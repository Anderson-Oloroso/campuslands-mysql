-- DDL: Estructura relacional aplicando restricciones UNIQUE en campos identificadores
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS autos_carreras;
DROP TABLE IF EXISTS escuderias_carreras;

CREATE TABLE escuderias_carreras (
    escuderia_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_escuderia VARCHAR(80) NOT NULL UNIQUE,
    codigo_escuderia VARCHAR(10) NOT NULL UNIQUE,
    patrocinador_principal VARCHAR(80) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE autos_carreras (
    auto_id INT AUTO_INCREMENT PRIMARY KEY,
    escuderia_id INT NOT NULL,
    numero_vin VARCHAR(17) NOT NULL UNIQUE,
    numero_competencia INT NOT NULL UNIQUE,
    modelo VARCHAR(60) NOT NULL,
    potencia_hp INT NOT NULL CHECK (potencia_hp > 0),
    estado ENUM('listo', 'en_mantenimiento', 'descalificado') DEFAULT 'listo',
    FOREIGN KEY (escuderia_id) REFERENCES escuderias_carreras(escuderia_id)
) ENGINE=InnoDB;
