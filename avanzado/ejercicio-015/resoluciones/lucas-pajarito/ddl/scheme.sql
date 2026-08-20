-- Selección de Base de Datos
CREATE DATABASE IF NOT EXISTS avanzado_biblioteca_gamer;
USE avanzado_basico_biblioteca_gamer;

-- Limpieza previa de estructuras
DROP VIEW IF EXISTS vw_resumen_biblioteca;
DROP TABLE IF EXISTS libreria_juegos_015;
DROP TABLE IF EXISTS juegos_015;
DROP TABLE IF EXISTS creadores_015;
DROP TABLE IF EXISTS categoria_juegos_015;

-- Creación de Tablas con Estrategia de Indexación
CREATE TABLE categoria_juegos_015 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    INDEX idx_categoria_nombre (nombre)
);

CREATE TABLE juegos_015 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    categoria_juego_015 INT NOT NULL,
    FOREIGN KEY (categoria_juego_015) REFERENCES categoria_juegos_015(id) ON DELETE CASCADE,
    INDEX idx_juego_categoria (categoria_juego_015)
);

CREATE TABLE creadores_015 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    INDEX idx_creador_nombre (nombre)
);

CREATE TABLE libreria_juegos_015 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT NOT NULL,
    id_creador INT NOT NULL,
    cantidad_descargas INT NOT NULL CHECK(cantidad_descargas >= 0),
    FOREIGN KEY (id_juego) REFERENCES juegos_015(id) ON DELETE CASCADE,
    FOREIGN KEY (id_creador) REFERENCES creadores_015(id) ON DELETE CASCADE,
    -- Índice compuesto para acelerar JOINs y ordenamiento por rendimiento de descargas
    INDEX idx_libreria_juego_creador (id_juego, id_creador),
    INDEX idx_descargas (cantidad_descargas DESC)
);

-- Vista Optimizada para Consultas Recurrentes de Indicadores
CREATE VIEW vw_resumen_biblioteca AS
SELECT 
    j.nombre AS juego,
    c.nombre AS categoria,
    cr.nombre AS creador,
    l.cantidad_descargas
FROM libreria_juegos_015 l
JOIN juegos_015 j ON l.id_juego = j.id
JOIN categoria_juegos_015 c ON j.categoria_juego_015 = c.id
JOIN creadores_015 cr ON l.id_creador = cr.id;