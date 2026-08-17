-- DDL: Estructura para registro de participantes, premios y puntos en Carreras Urbanas
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS participaciones_carreras;

CREATE TABLE participaciones_carreras (
    participacion_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_piloto VARCHAR(80) NOT NULL,
    categoria VARCHAR(40) NOT NULL,
    puntos_obtenidos INT NOT NULL DEFAULT 0 CHECK (puntos_obtenidos >= 0),
    premio_acumulado DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (premio_acumulado >= 0),
    estado_piloto ENUM('activo', 'sancionado', 'retirado') NOT NULL DEFAULT 'activo',
    fecha_carrera DATE NOT NULL
) ENGINE=InnoDB;
