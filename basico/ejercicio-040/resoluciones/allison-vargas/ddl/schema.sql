DROP DATABASE IF EXISTS carreras_urbanas_count_sum_db;
CREATE DATABASE carreras_urbanas_count_sum_db;
USE carreras_urbanas_count_sum_db;

CREATE TABLE carreras_urbanas (
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    nombre_corredor VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    distancia_km DECIMAL(4,1) NOT NULL,
    tiempo_segundos INT NOT NULL DEFAULT 0,
    estado_participacion VARCHAR(20) NOT NULL,
    CONSTRAINT chk_distancia_km CHECK (distancia_km > 0),
    CONSTRAINT chk_tiempo_segundos CHECK (tiempo_segundos >= 0),
    CONSTRAINT chk_estado_participacion CHECK (estado_participacion IN ('Inscrito', 'En Ruta', 'Finalizado', 'Retirado'))
);
