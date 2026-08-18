CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS participantes;

CREATE TABLE participantes (
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    codigo_inscripcion VARCHAR(15) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    distancia_km DECIMAL(5,2) NOT NULL,
    tiempo_minutos DECIMAL(6,2) NOT NULL,
    estado ENUM('finalizo', 'retirado') NOT NULL DEFAULT 'finalizo',
    fecha_registro DATE NOT NULL,
    CONSTRAINT uq_participantes_codigo UNIQUE (codigo_inscripcion),
    CONSTRAINT chk_participantes_distancia CHECK (distancia_km > 0),
    CONSTRAINT chk_participantes_tiempo CHECK (tiempo_minutos > 0)
);