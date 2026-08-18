-- Campuslands MySQL - basico ejercicio 028
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE Cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    estado ENUM('Borrador', 'Activo', 'Pausado', 'Finalizado') DEFAULT 'Borrador'
);

CREATE TABLE Estudiantes (
    estudiante_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    estado ENUM('Activo', 'Inactivo', 'Suspendido') DEFAULT 'Activo'
);

CREATE TABLE Matriculas (
    matricula_id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    curso_id INT NOT NULL,
    estado_matricula ENUM('Inscrito', 'En Curso', 'Completado', 'Cancelado') DEFAULT 'Inscrito',
    estado_pago ENUM('Pendiente', 'Pagado', 'Reembolsado') DEFAULT 'Pendiente',
    fecha_matricula DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(estudiante_id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id) ON DELETE CASCADE
);
