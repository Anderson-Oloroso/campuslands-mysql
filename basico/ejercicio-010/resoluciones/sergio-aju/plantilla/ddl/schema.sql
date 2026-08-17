DROP DATABASE IF EXISTS db_carreras_urbanas;
CREATE DATABASE db_carreras_urbanas;
USE db_carreras_urbanas;

CREATE TABLE inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    corredor VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    distancia_km DECIMAL(4,1) NOT NULL,
    costo_inscripcion DECIMAL(6,2) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Inscrito'
);