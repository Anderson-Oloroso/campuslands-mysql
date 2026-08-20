CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE tatuadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tatuador VARCHAR(80) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    experiencia_anos INT NOT NULL,
    CONSTRAINT chk_experiencia CHECK (experiencia_anos >= 0)
);

CREATE TABLE tatuajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tatuador_id INT NOT NULL,
    nombre_cliente VARCHAR(80) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado_cita ENUM('comendado', 'realizado', 'cancelado') DEFAULT 'realizado',
    CONSTRAINT fk_tatuador FOREIGN KEY (tatuador_id) REFERENCES tatuadores(id) ON DELETE CASCADE,
    CONSTRAINT chk_precio_tatuaje CHECK (precio > 0)
);