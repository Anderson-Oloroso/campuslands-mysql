-- Campuslands MySQL - intermedio ejercicio 028
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE estudiantes (
    estudiante_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudiante VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_curso VARCHAR(20) NOT NULL UNIQUE,
    nombre_curso VARCHAR(100) NOT NULL,
    nivel VARCHAR(20) NOT NULL CONSTRAINT chk_nivel_curso CHECK (nivel IN ('Principiante', 'Intermedio', 'Avanzado')),
    costo_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_costo CHECK (costo_usd >= 0.00)
);

CREATE TABLE instructores (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_instructor VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE matriculas_cursos (
    estudiante_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_matricula DATE NOT NULL,
    estado_matricula VARCHAR(20) NOT NULL DEFAULT 'Activo' CONSTRAINT chk_estado_mat CHECK (estado_matricula IN ('Activo', 'Completado', 'Retirado')),
    monto_pagado_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_monto_pagado CHECK (monto_pagado_usd >= 0.00),
    PRIMARY KEY (estudiante_id, curso_id),
    CONSTRAINT fk_matriculas_estudiantes 
        FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_matriculas_cursos 
        FOREIGN KEY (curso_id) REFERENCES cursos(curso_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE asignaciones_instructores (
    instructor_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    rol VARCHAR(30) NOT NULL DEFAULT 'Titular' CONSTRAINT chk_rol_inst CHECK (rol IN ('Titular', 'Auxiliar', 'Mentor')),
    PRIMARY KEY (instructor_id, curso_id),
    CONSTRAINT fk_asignaciones_instructores 
        FOREIGN KEY (instructor_id) REFERENCES instructores(instructor_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_asignaciones_cursos 
        FOREIGN KEY (curso_id) REFERENCES cursos(curso_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);
);
