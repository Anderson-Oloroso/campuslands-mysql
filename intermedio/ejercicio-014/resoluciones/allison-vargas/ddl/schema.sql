-- DDL: Estructura de personajes de ciencia ficción y vistas para reportes simplificados
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vista_personajes_activos;
DROP VIEW IF EXISTS vista_resumen_facciones;
DROP TABLE IF EXISTS personajes_scifi;

CREATE TABLE personajes_scifi (
    personaje_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    faccion VARCHAR(80) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    nivel_poder INT NOT NULL CHECK (nivel_poder BETWEEN 1 AND 100),
    estado ENUM('activo', 'retirado', 'caido_en_combate') DEFAULT 'activo',
    planeta_origen VARCHAR(80) NOT NULL
) ENGINE=InnoDB;

-- Vista 1: Abstracción de personajes activos con estatus operativo alto
CREATE VIEW vista_personajes_activos AS
SELECT 
    personaje_id,
    nombre,
    faccion,
    rol,
    nivel_poder,
    planeta_origen
FROM personajes_scifi
WHERE estado = 'activo';

-- Vista 2: Resumen analítico por facción
CREATE VIEW vista_resumen_facciones AS
SELECT 
    faccion,
    COUNT(*) AS total_miembros,
    ROUND(AVG(nivel_poder), 1) AS poder_promedio,
    MAX(nivel_poder) AS poder_maximo
FROM personajes_scifi
GROUP BY faccion;
