DROP DATABASE IF EXISTS academia_basico_db;
CREATE DATABASE academia_basico_db;
USE academia_basico_db;

CREATE TABLE cursos_academia (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    duracion_horas INT NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_duracion_positiva CHECK (duracion_horas > 0),
    CONSTRAINT chk_costo_positivo CHECK (costo >= 0.00),
    CONSTRAINT chk_estado_curso CHECK (estado IN ('Activo', 'Pausado', 'Finalizado'))
);
