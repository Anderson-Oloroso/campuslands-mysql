-- DDL: Estructura y Vistas Avanzadas para proyectos de Animación 3D
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vista_resumen_proyectos_3d;
DROP VIEW IF EXISTS vista_rendimiento_animadores;
DROP TABLE IF EXISTS renders_3d;
DROP TABLE IF EXISTS animadores_3d;

CREATE TABLE animadores_3d (
    animador_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_animador VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    especialidad ENUM('Rigging', 'Modeling', 'Texturing', 'Lighting', 'Keyframe') NOT NULL,
    nivel ENUM('Junior', 'Mid', 'Senior') NOT NULL DEFAULT 'Junior'
) ENGINE=InnoDB;

CREATE TABLE renders_3d (
    render_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_render VARCHAR(15) NOT NULL UNIQUE,
    animador_id INT NOT NULL,
    proyecto_nombre VARCHAR(100) NOT NULL,
    motor_render ENUM('Arnold', 'Cycles', 'Octane', 'Redshift', 'Unreal Engine') NOT NULL,
    fotogramas_totales INT NOT NULL CHECK (fotogramas_totales > 0),
    tiempo_render_hs DECIMAL(6,2) NOT NULL CHECK (tiempo_render_hs > 0.00),
    costo_farm_usd DECIMAL(8,2) NOT NULL CHECK (costo_farm_usd >= 0.00),
    estado ENUM('en_proceso', 'completado', 'fallido') NOT NULL DEFAULT 'en_proceso',
    fecha_render DATE NOT NULL,
    FOREIGN KEY (animador_id) REFERENCES animadores_3d(animador_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- VISTAS AVANZADAS

-- 1. Vista analítica de costo y tiempo por proyecto de animación 3D
CREATE VIEW vista_resumen_proyectos_3d AS
SELECT 
    proyecto_nombre,
    COUNT(render_id) AS total_renders,
    SUM(fotogramas_totales) AS fotogramas_procesados,
    ROUND(SUM(tiempo_render_hs), 2) AS tiempo_total_horas,
    ROUND(SUM(costo_farm_usd), 2) AS inversion_farm_usd
FROM renders_3d
WHERE estado = 'completado'
GROUP BY proyecto_nombre;

-- 2. Vista de métricas y rendimiento por animador
CREATE VIEW vista_rendimiento_animadores AS
SELECT 
    a.codigo_animador,
    a.nombre AS animador,
    a.especialidad,
    a.nivel,
    COUNT(r.render_id) AS renders_asignados,
    ROUND(COALESCE(AVG(r.tiempo_render_hs), 0), 2) AS tiempo_promedio_hs,
    ROUND(COALESCE(SUM(r.costo_farm_usd), 0), 2) AS costo_acumulado_usd
FROM animadores_3d a
LEFT JOIN renders_3d r ON a.animador_id = r.animador_id AND r.estado = 'completado'
GROUP BY a.animador_id, a.codigo_animador, a.nombre, a.especialidad, a.nivel;
