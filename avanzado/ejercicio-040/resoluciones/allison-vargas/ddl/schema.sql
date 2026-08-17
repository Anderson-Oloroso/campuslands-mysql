DROP DATABASE IF EXISTS carreras_urbanas_backup_db;
CREATE DATABASE carreras_urbanas_backup_db;
USE carreras_urbanas_backup_db;

-- Tabla transaccional para el control de participantes y tiempos en carreras urbanas
CREATE TABLE carreras_urbanas (
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    nombre_corredor VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    distancia_km DECIMAL(4,1) NOT NULL,
    tiempo_segundos INT NOT NULL DEFAULT 0,
    estado_participacion VARCHAR(20) NOT NULL,
    CONSTRAINT chk_distancia CHECK (distancia_km > 0),
    CONSTRAINT chk_tiempo CHECK (tiempo_segundos >= 0),
    CONSTRAINT chk_estado_carrera CHECK (estado_participacion IN ('Inscrito', 'En Ruta', 'Finalizado', 'Retirado'))
);
