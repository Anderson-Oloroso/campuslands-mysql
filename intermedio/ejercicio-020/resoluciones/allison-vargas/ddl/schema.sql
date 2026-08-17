-- DDL: Estructura relacional para pruebas con subconsultas
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_subconsultas;
DROP TABLE IF EXISTS tatuadores_subconsultas;

CREATE TABLE tatuadores_subconsultas (
    tatuador_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_tatuador VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    especialidad ENUM('realismo', 'tradicional', 'neotradicional', 'blackwork', 'fine line', 'anime') NOT NULL,
    tarifa_hora DECIMAL(8,2) NOT NULL CHECK (tarifa_hora > 0.00)
) ENGINE=InnoDB;

CREATE TABLE citas_subconsultas (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_cita VARCHAR(15) NOT NULL UNIQUE,
    tatuador_id INT NOT NULL,
    cliente_nombre VARCHAR(100) NOT NULL,
    estilo ENUM('realismo', 'tradicional', 'neotradicional', 'blackwork', 'fine line', 'anime') NOT NULL,
    monto_total DECIMAL(8,2) NOT NULL CHECK (monto_total >= 0.00),
    estado ENUM('programada', 'completada', 'cancelada') NOT NULL DEFAULT 'programada',
    fecha_cita DATE NOT NULL,
    FOREIGN KEY (tatuador_id) REFERENCES tatuadores_subconsultas(tatuador_id) ON DELETE CASCADE
) ENGINE=InnoDB;
