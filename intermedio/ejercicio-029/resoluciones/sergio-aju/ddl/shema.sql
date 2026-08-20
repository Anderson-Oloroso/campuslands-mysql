CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vista_pedidos_activos;
DROP VIEW IF EXISTS vista_resumen_ventas_categoria;
DROP TABLE IF EXISTS pedidos_marketplace_intermedio;

-- Tabla principal de pedidos en el marketplace
CREATE TABLE pedidos_marketplace_intermedio (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_pedido VARCHAR(50) NOT NULL UNIQUE,
  cliente VARCHAR(100) NOT NULL,
  accesorio VARCHAR(100) NOT NULL,
  categoria VARCHAR(60) NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  cantidad INT NOT NULL DEFAULT 1,
  fecha_pedido DATE NOT NULL,
  estado_pedido ENUM('pendiente', 'enviado', 'entregado', 'cancelado') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT chk_precio_unitario CHECK (precio_unitario > 0.00),
  CONSTRAINT chk_cantidad_pedido CHECK (cantidad > 0)
);

-- Creación de una Vista Simple: Filtrando pedidos activos (pendientes o enviados) con el cálculo del total por línea
CREATE VIEW vista_pedidos_activos AS
SELECT 
    codigo_pedido,
    cliente,
    accesorio,
    categoria,
    precio_unitario,
    cantidad,
    (precio_unitario * cantidad) AS total_linea,
    fecha_pedido,
    estado_pedido
FROM pedidos_marketplace_intermedio
WHERE estado_pedido IN ('pendiente', 'enviado');

-- Creación de una Vista Simple de Resumen: Agrupando ventas totales y conteo por categoría de accesorio
CREATE VIEW vista_resumen_ventas_categoria AS
SELECT 
    categoria,
    COUNT(*) AS total_pedidos_categoria,
    SUM(precio_unitario * cantidad) AS ingreso_total_categoria,
    AVG(precio_unitario) AS precio_promedio_accesorio
FROM pedidos_marketplace_intermedio
GROUP BY categoria;