CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP VIEW IF EXISTS vista_productos_por_categoria;
DROP VIEW IF EXISTS vista_productos_activos;
DROP TABLE IF EXISTS productos_accesorios;

CREATE TABLE productos_accesorios (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CONSTRAINT chk_precio_positivo CHECK (precio > 0),
    CONSTRAINT chk_stock_no_negativo CHECK (stock >= 0)
);

CREATE VIEW vista_productos_activos AS
SELECT
    id_producto,
    nombre,
    categoria,
    marca,
    precio,
    stock
FROM productos_accesorios
WHERE estado = 'activo';

CREATE VIEW vista_productos_por_categoria AS
SELECT
    categoria,
    COUNT(*) AS total_productos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    SUM(stock) AS stock_total
FROM productos_accesorios
WHERE estado = 'activo'
GROUP BY categoria;