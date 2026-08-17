-- Campuslands MySQL - avanzado ejercicio 052
-- Resolucion: maria-montepeque
-- Tema: animacion 3D
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vw_entregas_fallidas_avanzado;
DROP VIEW IF EXISTS vw_resumen_producciones_avanzado;
DROP VIEW IF EXISTS vw_producciones_activas_avanzado;
DROP TABLE IF EXISTS entregas_avanzado;
DROP TABLE IF EXISTS producciones_avanzado;

CREATE TABLE producciones_avanzado (
  id_produccion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  cliente VARCHAR(120) NOT NULL,
  motor_render ENUM('Blender Cycles','Arnold','V-Ray','Redshift','Octane') NOT NULL,
  presupuesto DECIMAL(10,2) NOT NULL,
  fecha_entrega DATE NOT NULL,
  estado ENUM('activa','entregada','cancelada') NOT NULL DEFAULT 'activa',
  CONSTRAINT chk_producciones_avanzado_presupuesto CHECK (presupuesto > 0)
);

CREATE TABLE entregas_avanzado (
  id_entrega INT AUTO_INCREMENT PRIMARY KEY,
  id_produccion INT NOT NULL,
  resolucion ENUM('720p','1080p','2K','4K','8K') NOT NULL,
  tiempo_render_min INT NOT NULL,
  costo_computo DECIMAL(10,2) NOT NULL,
  fecha_entrega DATE NOT NULL,
  estado ENUM('exitosa','fallida') NOT NULL,
  CONSTRAINT fk_entregas_avanzado_produccion FOREIGN KEY (id_produccion) REFERENCES producciones_avanzado (id_produccion),
  CONSTRAINT chk_entregas_avanzado_tiempo CHECK (tiempo_render_min > 0),
  CONSTRAINT chk_entregas_avanzado_costo CHECK (costo_computo > 0)
);

-- ===================================================================
-- Vista 1: vista simple y actualizable (una sola tabla, sin agregacion)
-- con WITH CHECK OPTION. Cualquier UPDATE/INSERT hecho A TRAVES de esta
-- vista debe seguir cumpliendo estado = 'activa' despues del cambio;
-- si no, MySQL rechaza la operacion.
-- ===================================================================
CREATE VIEW vw_producciones_activas_avanzado AS
SELECT id_produccion, nombre, cliente, motor_render, presupuesto, fecha_entrega, estado
FROM producciones_avanzado
WHERE estado = 'activa'
WITH CHECK OPTION;

-- ===================================================================
-- Vista 2: vista de reporte con JOIN + agregacion (no es actualizable,
-- solo de lectura, pero encapsula un calculo que de otra forma habria
-- que repetir en cada consulta).
-- ===================================================================
CREATE VIEW vw_resumen_producciones_avanzado AS
SELECT p.id_produccion,
       p.nombre AS produccion,
       p.cliente,
       COUNT(e.id_entrega) AS total_entregas,
       SUM(CASE WHEN e.estado = 'exitosa' THEN 1 ELSE 0 END) AS entregas_exitosas,
       SUM(e.tiempo_render_min) AS minutos_totales,
       SUM(e.costo_computo) AS costo_total
FROM producciones_avanzado p
LEFT JOIN entregas_avanzado e ON e.id_produccion = p.id_produccion
GROUP BY p.id_produccion, p.nombre, p.cliente;

-- ===================================================================
-- Vista 3: vista anidada, construida SOBRE otra vista
-- (vw_producciones_activas_avanzado), no directamente sobre la tabla.
-- ===================================================================
CREATE VIEW vw_entregas_fallidas_avanzado AS
SELECT pa.nombre AS produccion, pa.cliente, e.id_entrega, e.resolucion, e.fecha_entrega, e.estado
FROM vw_producciones_activas_avanzado pa
INNER JOIN entregas_avanzado e ON e.id_produccion = pa.id_produccion
WHERE e.estado = 'fallida';
