CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vista_reporte_rendimiento_categorias;
DROP VIEW IF EXISTS vista_proyectos_prioritarios;
DROP TABLE IF EXISTS proyectos_animacion;
DROP TABLE IF EXISTS categorias_animacion;

CREATE TABLE categorias_animacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE proyectos_animacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  categoria_id INT NOT NULL,
  puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',
  fecha_entrega DATE,
  CONSTRAINT fk_proyecto_categoria FOREIGN KEY (categoria_id) REFERENCES categorias_animacion(id)
);

-- Vista 1: Reporte consolidado de rendimiento por categoría
CREATE VIEW vista_reporte_rendimiento_categorias AS
SELECT c.nombre_categoria, COUNT(p.id) AS total_proyectos, AVG(p.puntaje) AS promedio_puntaje
FROM categorias_animacion c
LEFT JOIN proyectos_animacion p ON c.id = p.categoria_id
GROUP BY c.nombre_categoria;

-- Vista 2: Proyectos que requieren atención urgente (Activos con puntaje > 80)
CREATE VIEW vista_proyectos_prioritarios AS
SELECT nombre, puntaje, fecha_entrega
FROM proyectos_animacion
WHERE estado = 'activo' AND puntaje > 80.00;