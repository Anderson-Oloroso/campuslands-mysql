-- Campuslands MySQL - avanzado ejercicio 022
-- Resolucion: maria-montepeque
-- Tema: animacion 3D
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vw_renders_pendientes_avanzado;
DROP VIEW IF EXISTS vw_resumen_proyectos_avanzado;
DROP VIEW IF EXISTS vw_proyectos_en_progreso_avanzado;
DROP TABLE IF EXISTS renders_avanzado;
DROP TABLE IF EXISTS proyectos_avanzado;

CREATE TABLE proyectos_avanzado (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  cliente VARCHAR(120) NOT NULL,
  motor_render ENUM('Blender Cycles','Arnold','V-Ray','Redshift','Octane') NOT NULL,
  presupuesto DECIMAL(10,2) NOT NULL,
  fecha_entrega DATE NOT NULL,
  estado ENUM('en_progreso','entregado','cancelado') NOT NULL DEFAULT 'en_progreso',
  CONSTRAINT chk_proyectos_avanzado_presupuesto CHECK (presupuesto > 0)
);

CREATE TABLE renders_avanzado (
  id_render INT AUTO_INCREMENT PRIMARY KEY,
  id_proyecto INT NOT NULL,
  resolucion ENUM('720p','1080p','2K','4K','8K') NOT NULL,
  tiempo_render_min INT NOT NULL,
  costo_computo DECIMAL(10,2) NOT NULL,
  fecha_render DATE NOT NULL,
  estado ENUM('exitoso','fallido') NOT NULL,
  CONSTRAINT fk_renders_avanzado_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyectos_avanzado (id_proyecto),
  CONSTRAINT chk_renders_avanzado_tiempo CHECK (tiempo_render_min > 0),
  CONSTRAINT chk_renders_avanzado_costo CHECK (costo_computo > 0)
);

-- ===================================================================
-- Vista 1: vista simple y actualizable (una sola tabla, sin agregacion)
-- con WITH CHECK OPTION. Cualquier UPDATE/INSERT hecho A TRAVES de esta
-- vista debe seguir cumpliendo estado = 'en_progreso' despues del
-- cambio; si no, MySQL rechaza la operacion.
-- ===================================================================
CREATE VIEW vw_proyectos_en_progreso_avanzado AS
SELECT id_proyecto, nombre, cliente, motor_render, presupuesto, fecha_entrega, estado
FROM proyectos_avanzado
WHERE estado = 'en_progreso'
WITH CHECK OPTION;

-- ===================================================================
-- Vista 2: vista de reporte con JOIN + agregacion (no es actualizable,
-- solo de lectura, pero encapsula un calculo que de otra forma habria
-- que repetir en cada consulta).
-- ===================================================================
CREATE VIEW vw_resumen_proyectos_avanzado AS
SELECT p.id_proyecto,
       p.nombre AS proyecto,
       p.cliente,
       COUNT(r.id_render) AS total_renders,
       SUM(CASE WHEN r.estado = 'exitoso' THEN 1 ELSE 0 END) AS renders_exitosos,
       SUM(r.tiempo_render_min) AS minutos_totales,
       SUM(r.costo_computo) AS costo_total
FROM proyectos_avanzado p
LEFT JOIN renders_avanzado r ON r.id_proyecto = p.id_proyecto
GROUP BY p.id_proyecto, p.nombre, p.cliente;

-- ===================================================================
-- Vista 3: vista anidada, construida SOBRE otra vista
-- (vw_proyectos_en_progreso_avanzado), no directamente sobre la tabla.
-- ===================================================================
CREATE VIEW vw_renders_pendientes_avanzado AS
SELECT pe.nombre AS proyecto, pe.cliente, r.id_render, r.resolucion, r.fecha_render, r.estado
FROM vw_proyectos_en_progreso_avanzado pe
INNER JOIN renders_avanzado r ON r.id_proyecto = pe.id_proyecto
WHERE r.estado = 'fallido';
