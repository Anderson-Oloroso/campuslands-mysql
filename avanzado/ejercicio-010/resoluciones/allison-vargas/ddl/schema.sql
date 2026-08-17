-- DDL: Estructura para Carreras Urbanas optimizada para exportación de Backup Lógico (mysqldump)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS resultados_carreras;
DROP TABLE IF EXISTS vehiculos_carreras;
DROP TABLE IF EXISTS pilotos_carreras;

CREATE TABLE pilotos_carreras (
    piloto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_piloto VARCHAR(80) NOT NULL,
    apodo VARCHAR(50) NOT NULL UNIQUE,
    patrocinador VARCHAR(80),
    licencia_pista VARCHAR(40) UNIQUE NOT NULL,
    estado ENUM('activo', 'sancionado', 'retirado') DEFAULT 'activo'
) ENGINE=InnoDB;

CREATE TABLE vehiculos_carreras (
    vehiculo_id INT AUTO_INCREMENT PRIMARY KEY,
    piloto_id INT NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    marca VARCHAR(40) NOT NULL,
    caballos_fuerza INT NOT NULL CHECK (caballos_fuerza > 0),
    categoria ENUM('Street', 'Pro Modified', 'Supercar', 'Drift') NOT NULL,
    FOREIGN KEY (piloto_id) REFERENCES pilotos_carreras(piloto_id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE resultados_carreras (
    resultado_id INT AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT NOT NULL,
    circuito VARCHAR(100) NOT NULL,
    tiempo_segundos DECIMAL(6,3) NOT NULL CHECK (tiempo_segundos > 0),
    posicion_final INT NOT NULL CHECK (posicion_final > 0),
    puntos_obtenidos INT NOT NULL DEFAULT 0,
    fecha_carrera DATETIME NOT NULL,
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculos_carreras(vehiculo_id)
) ENGINE=InnoDB;
