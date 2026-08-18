-- Ejercicio 058 - Intermedio - Tablas Puente Academia Tech

-- Tabla de estudiantes
CREATE TABLE `ejercicio-058-int-estudiantes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de cursos
CREATE TABLE `ejercicio-058-int-cursos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nivel VARCHAR(30) NOT NULL
);

-- Tabla puente (inscripciones)
CREATE TABLE `ejercicio-058-int_inscripciones` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    curso_id INT,
    fecha DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (estudiante_id) REFERENCES `ejercicio-058-int-estudiantes`(id),
    FOREIGN KEY (curso_id) REFERENCES `ejercicio-058-int-cursos`(id)
);