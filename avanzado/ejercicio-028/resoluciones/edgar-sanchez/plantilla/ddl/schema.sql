DROP TABLE IF EXISTS entregas_proyectos;
DROP TABLE IF EXISTS matriculas_cursos;
DROP TABLE IF EXISTS perfiles_estudiantes;
DROP TABLE IF EXISTS cursos_tecnicos;
DROP TABLE IF EXISTS instructores;

CREATE TABLE instructores (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    contacto_json JSON NOT NULL,
    fecha_ingreso DATE NOT NULL
);

CREATE TABLE cursos_tecnicos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_id INT NOT NULL,
    nombre_curso VARCHAR(100) NOT NULL UNIQUE,
    nivel VARCHAR(30) NOT NULL CONSTRAINT chk_nivel CHECK (nivel IN ('Principiante', 'Intermedio', 'Avanzado')),
    temario_json JSON NOT NULL,
    CONSTRAINT fk_cursos_instructores 
        FOREIGN KEY (instructor_id) REFERENCES instructores(instructor_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE perfiles_estudiantes (
    estudiante_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudiante VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    habilidades_json JSON NOT NULL,
    preferencias_json JSON NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE matriculas_cursos (
    matricula_id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    curso_id INT NOT NULL,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo' CONSTRAINT chk_estado_matricula CHECK (estado IN ('Activo', 'Completado', 'Cancelado')),
    metadatos_evaluacion_json JSON NULL,
    fecha_matricula DATE NOT NULL,
    CONSTRAINT fk_matriculas_estudiantes 
        FOREIGN KEY (estudiante_id) REFERENCES perfiles_estudiantes(estudiante_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_matriculas_cursos 
        FOREIGN KEY (curso_id) REFERENCES cursos_tecnicos(curso_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_estudiante_curso 
        UNIQUE (estudiante_id, curso_id)
);

CREATE TABLE entregas_proyectos (
    entrega_id INT AUTO_INCREMENT PRIMARY KEY,
    matricula_id INT NOT NULL,
    titulo_proyecto VARCHAR(120) NOT NULL,
    detalles_entrega_json JSON NOT NULL,
    fecha_entrega DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_entregas_matriculas 
        FOREIGN KEY (matricula_id) REFERENCES matriculas_cursos(matricula_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);