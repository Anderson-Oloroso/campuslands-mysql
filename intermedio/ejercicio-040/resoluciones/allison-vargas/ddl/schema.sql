DROP DATABASE IF EXISTS carreras_urbanas_unique_db;
CREATE DATABASE carreras_urbanas_unique_db;
USE carreras_urbanas_unique_db;

CREATE TABLE carreras_urbanas (
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    dorsal INT NOT NULL UNIQUE,
    nombre_corredor VARCHAR(60) NOT NULL,
    correo_electronico VARCHAR(80) NOT NULL UNIQUE,
    categoria VARCHAR(30) NOT NULL,
    distancia_km DECIMAL(4,1) NOT NULL,
    tiempo_segundos INT NOT NULL DEFAULT 0,
    estado_participacion VARCHAR(20) NOT NULL,
    CONSTRAINT chk_dorsal_positivo CHECK (dorsal > 0),
    CONSTRAINT chk_distancia_unq CHECK (distancia_km > 0),
    CONSTRAINT chk_tiempo_unq CHECK (tiempo_segundos >= 0),
    CONSTRAINT chk_estado_unq CHECK (estado_participacion IN ('Inscrito', 'En Ruta', 'Finalizado', 'Retirado'))
);
