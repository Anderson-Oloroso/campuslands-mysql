CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS cursos_academia;

CREATE TABLE cursos_academia (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    nivel ENUM('basico', 'intermedio', 'avanzado') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    informacion JSON NOT NULL,
    CONSTRAINT chk_precio_no_negativo CHECK (precio >= 0),
    CONSTRAINT chk_informacion_json CHECK (JSON_VALID(informacion))
);