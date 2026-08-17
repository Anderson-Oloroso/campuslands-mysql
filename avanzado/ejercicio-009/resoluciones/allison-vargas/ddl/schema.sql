-- DDL: Estructura para gestión de Peleas y Apuestas de Kickboxing con Bloqueos de Concurrencia
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS apuestas_kickboxing;
DROP TABLE IF EXISTS peleas_kickboxing;
DROP TABLE IF EXISTS peleadores_kickboxing;

CREATE TABLE peleadores_kickboxing (
    peleador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_peleador VARCHAR(80) NOT NULL,
    apodo VARCHAR(50),
    categoria_peso VARCHAR(40) NOT NULL,
    victorias INT DEFAULT 0 CHECK (victorias >= 0),
    derrotas INT DEFAULT 0 CHECK (derrotas >= 0),
    estado ENUM('activo', 'suspendido', 'retirado') DEFAULT 'activo'
) ENGINE=InnoDB;

CREATE TABLE peleas_kickboxing (
    pelea_id INT AUTO_INCREMENT PRIMARY KEY,
    peleador_rojo_id INT NOT NULL,
    peleador_azul_id INT NOT NULL,
    evento VARCHAR(100) NOT NULL,
    cupo_apuestas DECIMAL(10,2) NOT NULL DEFAULT 5000.00 CHECK (cupo_apuestas >= 0),
    estado_pelea ENUM('programada', 'en_curso', 'finalizada', 'cancelada') DEFAULT 'programada',
    FOREIGN KEY (peleador_rojo_id) REFERENCES peleadores_kickboxing(peleador_id),
    FOREIGN KEY (peleador_azul_id) REFERENCES peleadores_kickboxing(peleador_id)
) ENGINE=InnoDB;

CREATE TABLE apuestas_kickboxing (
    apuesta_id INT AUTO_INCREMENT PRIMARY KEY,
    pelea_id INT NOT NULL,
    apostador VARCHAR(80) NOT NULL,
    monto DECIMAL(10,2) NOT NULL CHECK (monto > 0),
    peleador_apostado_id INT NOT NULL,
    FOREIGN KEY (pelea_id) REFERENCES peleas_kickboxing(pelea_id),
    FOREIGN KEY (peleador_apostado_id) REFERENCES peleadores_kickboxing(peleador_id)
) ENGINE=InnoDB;
