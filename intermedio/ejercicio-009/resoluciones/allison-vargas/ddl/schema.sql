-- DDL: Esquema relacional con Foreign Keys para Dojos, Entrenadores y Practicantes de Kickboxing
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS practicantes_kickboxing;
DROP TABLE IF EXISTS dojos_kickboxing;

CREATE TABLE dojos_kickboxing (
    dojo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_dojo VARCHAR(80) NOT NULL UNIQUE,
    entrenador_principal VARCHAR(80) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    capacidad_maxima INT NOT NULL CHECK (capacidad_maxima > 0)
) ENGINE=InnoDB;

CREATE TABLE practicantes_kickboxing (
    practicante_id INT AUTO_INCREMENT PRIMARY KEY,
    dojo_id INT NOT NULL,
    nombre_practicante VARCHAR(80) NOT NULL,
    cinta VARCHAR(30) NOT NULL DEFAULT 'Blanca',
    cuota_mensual DECIMAL(8,2) NOT NULL CHECK (cuota_mensual >= 0),
    estado ENUM('activo', 'inactivo', 'suspendido') DEFAULT 'activo',
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT fk_practicante_dojo FOREIGN KEY (dojo_id)
        REFERENCES dojos_kickboxing(dojo_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;
