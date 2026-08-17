DROP DATABASE IF EXISTS academia_tech_json_db;
CREATE DATABASE academia_tech_json_db;
USE academia_tech_json_db;

CREATE TABLE detalles_estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(60) NOT NULL,
    correo VARCHAR(60) NOT NULL,
    carrera VARCHAR(40) NOT NULL,
    metadata_json JSON NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_estado_estudiante CHECK (estado IN ('Activo', 'Inactivo', 'Graduado'))
);
