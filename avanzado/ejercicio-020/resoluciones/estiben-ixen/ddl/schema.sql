-- Campuslands MySQL - avanzado ejercicio-020
-- Tema: estudio de tatuajes (indices)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_tatuajes;
DROP TABLE IF EXISTS citas_tatuajes;
DROP TABLE IF EXISTS artistas_tatuadores;

CREATE TABLE artistas_tatuadores (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    apodo VARCHAR(40) NOT NULL UNIQUE,
    estilo_principal ENUM('Realismo Black & Grey','Neotradicional','Japones Tradicional (Irezumi)','Microrealismo','Lettering','Blackwork') NOT NULL,
    tarifa_por_hora DECIMAL(6,2) NOT NULL DEFAULT 80.00
);

CREATE TABLE citas_tatuajes (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(80) NOT NULL,
    id_artista INT NOT NULL,
    zona_cuerpo ENUM('Brazo','Espalda','Pecho','Pierna','Costillas','Cuello','Mano') NOT NULL,
    horas_sesion DECIMAL(4,2) NOT NULL,
    costo_total DECIMAL(8,2) NOT NULL,
    estado ENUM('Confirmada','Completada','Cancelada') DEFAULT 'Completada',
    fecha_cita DATE NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artistas_tatuadores(id_artista) ON DELETE CASCADE
);

-- Creacion de Indices Optimizados
CREATE INDEX idx_tatuajes_fk ON citas_tatuajes(id_artista);
CREATE INDEX idx_tatuajes_metric ON citas_tatuajes(horas_sesion DESC);
CREATE INDEX idx_tatuajes_compuesto ON citas_tatuajes(id_artista, horas_sesion);
