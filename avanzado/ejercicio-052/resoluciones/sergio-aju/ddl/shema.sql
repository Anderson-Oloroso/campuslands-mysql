-- Campuslands MySQL - Avanzado Ejercicio 052
-- Vistas Avanzadas para Estudio de Animación 3D

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza preventiva
DROP VIEW IF EXISTS vw_resumen_proyectos_3d;
DROP VIEW IF EXISTS vw_rendimiento_render_farm;
DROP VIEW IF EXISTS vw_eficiencia_animadores;

DROP TABLE IF EXISTS render_jobs;
DROP TABLE IF EXISTS modelos_3d;
DROP TABLE IF EXISTS animadores;
DROP TABLE IF EXISTS proyectos_3d;

-- Creación de tablas
CREATE TABLE proyectos_3d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    software_principal VARCHAR(60) NOT NULL,
    fps INT NOT NULL DEFAULT 24,
    presupuesto_usd DECIMAL(12,2) NOT NULL,
    estado ENUM('Preproducción', 'Producción', 'Renderizado', 'Completado') NOT NULL DEFAULT 'Preproducción',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_presupuesto CHECK (presupuesto_usd >= 0)
) ENGINE=InnoDB;

CREATE TABLE animadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    nivel ENUM('Junior', 'Mid', 'Senior', 'Lead') NOT NULL DEFAULT 'Mid',
    costo_hora DECIMAL(8,2) NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE modelos_3d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    animador_id INT NOT NULL,
    nombre_asset VARCHAR(100) NOT NULL,
    conteo_poligonos INT NOT NULL,
    tiene_rigging TINYINT(1) NOT NULL DEFAULT 0,
    estado ENUM('Modelado', 'Texturizado', 'Rigged', 'Aprobado') NOT NULL DEFAULT 'Modelado',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_3d(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (animador_id) REFERENCES animadores(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_poligonos CHECK (conteo_poligonos > 0)
) ENGINE=InnoDB;

CREATE TABLE render_jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    fotogramas_totales INT NOT NULL,
    minutos_render_farm DECIMAL(8,2) NOT NULL,
    costo_render_usd DECIMAL(10,2) NOT NULL,
    motor_render VARCHAR(50) NOT NULL,
    estado ENUM('En Cola', 'Renderizando', 'Exitoso', 'Fallido') NOT NULL DEFAULT 'En Cola',
    fecha_ejecucion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_3d(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_fotogramas CHECK (fotogramas_totales > 0)
) ENGINE=InnoDB;

-- Creación de vistas requeridas

CREATE VIEW vw_resumen_proyectos_3d AS
SELECT 
    p.id AS proyecto_id,
    p.nombre AS proyecto,
    p.software_principal,
    p.estado,
    COUNT(DISTINCT m.id) AS total_assets,
    SUM(m.conteo_poligonos) AS carga_poligonal_total,
    COALESCE(SUM(rj.costo_render_usd), 0.00) AS gasto_render_usd,
    p.presupuesto_usd
FROM proyectos_3d p
LEFT JOIN modelos_3d m ON p.id = m.proyecto_id
LEFT JOIN render_jobs rj ON p.id = rj.proyecto_id AND rj.estado = 'Exitoso'
GROUP BY p.id, p.nombre, p.software_principal, p.estado, p.presupuesto_usd;

CREATE VIEW vw_rendimiento_render_farm AS
SELECT 
    motor_render,
    COUNT(id) AS trabajos_totales,
    SUM(fotogramas_totales) AS fotogramas_procesados,
    ROUND(SUM(minutos_render_farm), 2) AS tiempo_total_minutos,
    ROUND(AVG(minutos_render_farm / fotogramas_totales), 4) AS promedio_minutos_por_frame,
    SUM(costo_render_usd) AS costo_acumulado_usd
FROM render_jobs
WHERE estado = 'Exitoso'
GROUP BY motor_render;

CREATE VIEW vw_eficiencia_animadores AS
SELECT 
    a.id AS animador_id,
    a.nombre AS animador,
    a.especialidad,
    a.nivel,
    COUNT(m.id) AS assets_creados,
    AVG(m.conteo_poligonos) AS promedio_poligonos_por_asset,
    SUM(CASE WHEN m.tiene_rigging = 1 THEN 1 ELSE 0 END) AS assets_con_rigging
FROM animadores a
LEFT JOIN modelos_3d m ON a.id = m.animador_id
GROUP BY a.id, a.nombre, a.especialidad, a.nivel;