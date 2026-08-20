-- Campuslands MySQL - avanzado ejercicio-022
-- Tema: animacion 3D (vistas avanzadas)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_animacion_3d;
DROP TABLE IF EXISTS personajes_3d;
DROP TABLE IF EXISTS estudios_animacion;

CREATE TABLE estudios_animacion (
    id_estudio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudio VARCHAR(60) NOT NULL UNIQUE,
    pais VARCHAR(40) NOT NULL,
    motor_render_principal ENUM('Cycles','Arnold','RenderMan','V-Ray','Unreal Engine 5') NOT NULL
);

CREATE TABLE personajes_3d (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(70) NOT NULL,
    id_estudio INT NOT NULL,
    software_modelado ENUM('Maya','Blender','ZBrush','Houdini','Cinema 4D') NOT NULL,
    poligonos_count INT NOT NULL,
    tipo_rig ENUM('Bipedo Humanoide','Facial Avanzado','Criatura Cuadrupeda','Mecanico/Robot') NOT NULL,
    texturas_4k ENUM('Si','No') DEFAULT 'Si',
    costo_produccion DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (id_estudio) REFERENCES estudios_animacion(id_estudio) ON DELETE CASCADE
);

-- Vista Avanzada con Metricas
CREATE OR REPLACE VIEW vista_avanzada_animacion_3d AS
SELECT 
    p.nombre_estudio AS entidad_padre,
    s.nombre_modelo AS elemento,
    s.poligonos_count AS valor_metrica,
    AVG(s.poligonos_count) OVER(PARTITION BY p.id_estudio) AS promedio_grupo,
    DENSE_RANK() OVER(PARTITION BY p.id_estudio ORDER BY s.poligonos_count DESC) AS ranking_en_grupo
FROM estudios_animacion p
INNER JOIN personajes_3d s ON p.id_estudio = s.id_estudio;
