CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS carreras_urbanas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_carrera VARCHAR(60) NOT NULL,
    distancia_km DECIMAL(5, 2) NOT NULL,
    participantes_inscritos INT NOT NULL DEFAULT 0,
    recaudacion_total_usd DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    estado ENUM('abiertas_inscripciones', 'en_curso', 'finalizada') DEFAULT 'abiertas_inscripciones',
    CONSTRAINT chk_distancia CHECK (distancia_km > 0),
    CONSTRAINT chk_participantes CHECK (participantes_inscritos >= 0),
    CONSTRAINT chk_recaudacion CHECK (recaudacion_total_usd >= 0)
);