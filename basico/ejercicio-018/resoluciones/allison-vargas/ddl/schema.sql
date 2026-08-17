-- DDL: Estructura centrada en la definición explícita de PRIMARY KEY e identificadores únicos
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS destinos_turismo;

CREATE TABLE destinos_turismo (
    destino_id INT AUTO_INCREMENT,
    codigo_destino VARCHAR(15) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    categoria ENUM('cultural', 'ecoturismo', 'aventura', 'playa', 'montaña') NOT NULL,
    costo_promedio_dia DECIMAL(8,2) NOT NULL CHECK (costo_promedio_dia > 0.00),
    cupo_maximo INT NOT NULL CHECK (cupo_maximo > 0),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT pk_destinos_turismo PRIMARY KEY (destino_id),
    CONSTRAINT uk_codigo_destino UNIQUE (codigo_destino)
) ENGINE=InnoDB;
