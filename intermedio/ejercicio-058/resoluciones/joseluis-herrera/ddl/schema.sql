CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS estudiante_curso;
DROP TABLE IF EXISTS estudiantes;
DROP TABLE IF EXISTS cursos;

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    nivel ENUM('basico', 'intermedio', 'avanzado') NOT NULL,
    duracion_horas INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CONSTRAINT chk_duracion_positiva CHECK (duracion_horas > 0)
);

CREATE TABLE estudiante_curso (
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    nota_final DECIMAL(5, 2) NOT NULL,
    estado ENUM('cursando', 'aprobado', 'reprobado') NOT NULL DEFAULT 'cursando',
    PRIMARY KEY (id_estudiante, id_curso),
    CONSTRAINT chk_nota_valida CHECK (nota_final >= 0 AND nota_final <= 100),
    CONSTRAINT fk_estudiante_curso_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante),
    CONSTRAINT fk_estudiante_curso_curso
        FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
);