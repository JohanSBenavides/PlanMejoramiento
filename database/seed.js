require('dotenv').config();
const { sequelize } = require('./conn');
const bcrypt = require('bcryptjs');

// Modelos
const Rol = require('../models/Rol');
const Usuario = require('../models/Usuario');
const Curso = require('../models/Curso');
const Materia = require('../models/Materia');
const Nota = require('../models/Nota');
const CursoProfesor = require('../models/CursoProfesor');
const CursoEstudiante = require('../models/CursoEstudiante');

async function crearDatosDePrueba(forceReset = false) {
  try {
    console.log(forceReset ? '⚠️ Reiniciando base de datos...' : '🧠 Creando datos de prueba...');
    await sequelize.sync({ force: forceReset });

    // =====================================================
    // ROLES
    // =====================================================
    const [adminRol] = await Rol.findOrCreate({ where: { nombre: 'Administrador' } });
    const [profesorRol] = await Rol.findOrCreate({ where: { nombre: 'Profesor' } });
    const [estudianteRol] = await Rol.findOrCreate({ where: { nombre: 'Estudiante' } });

    // =====================================================
    // CURSOS (6)
    // =====================================================
    const cursosRaw = ["Primero A", "Primero B", "Segundo A", "Segundo B", "Tercero A", "Tercero B"];
    const cursos = [];

    for (const nombre of cursosRaw) {
      const [curso] = await Curso.findOrCreate({ where: { nombre } });
      cursos.push(curso);
    }

    // =====================================================
    // MATERIAS (12)
    // =====================================================
    const materiasRaw = [
      "Matemáticas", "Lengua Castellana", "Biología", "Química",
      "Sociales", "Ética", "Física", "Inglés",
      "Geometría", "Historia", "Informática", "Artes"
    ];

    const materias = [];
    for (let i = 0; i < materiasRaw.length; i++) {
      const curso = cursos[i % cursos.length];
      const [mat] = await Materia.findOrCreate({
        where: { nombre: materiasRaw[i] },
        defaults: { idCurso: curso.id }
      });
      materias.push(mat);
    }

    // =====================================================
    // PROFESORES (6)
    // =====================================================
    const passProfesor = await bcrypt.hash("profesor123", 10);
    const profesores = [];

    for (let i = 1; i <= 6; i++) {
      const [prof] = await Usuario.findOrCreate({
        where: { correo: `prof${i}@notas.com` },
        defaults: {
          nombre: `Profesor ${i}`,
          password: passProfesor,
          idRol: profesorRol.id
        }
      });
      profesores.push(prof);
    }

    // =====================================================
    // ESTUDIANTES (20)
    // =====================================================
    const passEst = await bcrypt.hash("estudiante123", 10);
    const estudiantes = [];

    for (let i = 1; i <= 20; i++) {
      const [est] = await Usuario.findOrCreate({
        where: { correo: `est${i}@notas.com` },
        defaults: {
          nombre: `Estudiante ${i}`,
          password: passEst,
          idRol: estudianteRol.id
        }
      });
      estudiantes.push(est);
    }

    // =====================================================
    // RELACIONES: Profesores ↔ Cursos
    // =====================================================
    for (let i = 0; i < cursos.length; i++) {
      await CursoProfesor.create({
        idCurso: cursos[i].id,
        idProfesor: profesores[i % profesores.length].id
      });
    }

    // =====================================================
    // RELACIONES: Estudiantes ↔ Cursos (distribución equilibrada)
    // =====================================================
    for (let i = 0; i < estudiantes.length; i++) {
      const curso = cursos[i % cursos.length];
      await CursoEstudiante.create({
        idCurso: curso.id,
        idEstudiante: estudiantes[i].id
      });
    }

    // =====================================================
    // RELACIONES: Profesores ↔ Materias
    // =====================================================
    for (let i = 0; i < materias.length; i++) {
      const profesor = profesores[i % profesores.length];
      await materias[i].update({ idProfesor: profesor.id });
    }

    // =====================================================
    // GENERAR 50 NOTAS AUTOMÁTICAMENTE
    // =====================================================
    const notas = [];
    for (let i = 0; i < 50; i++) {
      const materia = materias[Math.floor(Math.random() * materias.length)];
      const estudiante = estudiantes[Math.floor(Math.random() * estudiantes.length)];
      const profesor = profesores[Math.floor(Math.random() * profesores.length)];

      notas.push({
        calificacion: (Math.random() * 5).toFixed(1),
        idMateria: materia.id,
        idProfesor: profesor.id,
        idEstudiante: estudiante.id
      });
    }

    await Nota.bulkCreate(notas);

    // =====================================================
    // ADMIN
    // =====================================================
    const passAdmin = await bcrypt.hash("admin123", 10);
    await Usuario.findOrCreate({
      where: { correo: "admin@notas.com" },
      defaults: {
        nombre: "Super Admin",
        password: passAdmin,
        idRol: adminRol.id
      }
    });

    console.log("✅ Seed completo creado con éxito");
    process.exit(0);

  } catch (err) {
    console.error("❌ Error en el seed:", err);
    process.exit(1);
  }
}

const forceReset = process.argv.includes("--force");
crearDatosDePrueba(forceReset);
