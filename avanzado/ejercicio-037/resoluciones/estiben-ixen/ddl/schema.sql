-- Campuslands MySQL - avanzado ejercicio-037
-- Tema: liga de futbol (vistas avanzadas)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_liga_futbol;
DROP TABLE IF EXISTS futbolistas;
DROP TABLE IF EXISTS clubes_futbol;

CREATE TABLE clubes_futbol (
    id_club INT AUTO_INCREMENT PRIMARY KEY,
    nombre_club VARCHAR(60) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    estadio VARCHAR(60) NOT NULL,
    fundacion INT NOT NULL
);

CREATE TABLE futbolistas (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    posicion ENUM('Portero','Defensa','Centrocampista','Delantero') NOT NULL,
    numero_camiseta INT NOT NULL,
    id_club INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    asistencias INT NOT NULL DEFAULT 0,
    salario_mensual DECIMAL(10,2) NOT NULL,
    estado ENUM('Titular','Suplente','Lesionado') DEFAULT 'Titular',
    FOREIGN KEY (id_club) REFERENCES clubes_futbol(id_club) ON DELETE CASCADE
);

-- Vista Avanzada con Metricas
CREATE OR REPLACE VIEW vista_avanzada_liga_futbol AS
SELECT 
    p.nombre_club AS entidad_padre,
    s.nombre AS elemento,
    s.id_club AS valor_metrica,
    AVG(s.id_club) OVER(PARTITION BY p.id_club) AS promedio_grupo,
    DENSE_RANK() OVER(PARTITION BY p.id_club ORDER BY s.id_club DESC) AS ranking_en_grupo
FROM clubes_futbol p
INNER JOIN futbolistas s ON p.id_club = s.posicion;
