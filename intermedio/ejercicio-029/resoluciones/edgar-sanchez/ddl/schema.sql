-- Campuslands MySQL - intermedio ejercicio 029
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE categorias_accesorios (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE vendedores (
    vendedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tienda VARCHAR(100) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE productos_accesorios (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    vendedor_id INT NOT NULL,
    categoria_id INT NOT NULL,
    sku VARCHAR(30) NOT NULL UNIQUE,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_usd DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio CHECK (precio_usd > 0.00),
    stock_disponible INT NOT NULL DEFAULT 0 CONSTRAINT chk_stock CHECK (stock_disponible >= 0),
    CONSTRAINT fk_productos_vendedores 
        FOREIGN KEY (vendedor_id) REFERENCES vendedores(vendedor_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_productos_categorias 
        FOREIGN KEY (categoria_id) REFERENCES categorias_accesorios(categoria_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE ordenes_compra (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_orden VARCHAR(20) NOT NULL UNIQUE,
    cliente_nombre VARCHAR(100) NOT NULL,
    correo_cliente VARCHAR(100) NOT NULL,
    fecha_orden DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_orden VARCHAR(20) NOT NULL DEFAULT 'Pendiente' CONSTRAINT chk_estado_orden CHECK (estado_orden IN ('Pendiente', 'Procesando', 'Enviado', 'Entregado', 'Cancelado'))
);

CREATE TABLE detalle_orden (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT chk_cantidad CHECK (cantidad > 0),
    precio_unitario_usd DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_unitario CHECK (precio_unitario_usd > 0.00),
    CONSTRAINT fk_detalle_ordenes 
        FOREIGN KEY (orden_id) REFERENCES ordenes_compra(orden_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detalle_productos 
        FOREIGN KEY (producto_id) REFERENCES productos_accesorios(producto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_orden_producto 
        UNIQUE (orden_id, producto_id)
);

CREATE VIEW vw_catalogo_disponible AS
SELECT 
    p.producto_id,
    p.sku,
    p.nombre_producto,
    c.nombre_categoria,
    v.nombre_tienda AS vendedor,
    p.precio_usd,
    p.stock_disponible
FROM productos_accesorios p
INNER JOIN categorias_accesorios c ON p.categoria_id = c.categoria_id
INNER JOIN vendedores v ON p.vendedor_id = v.vendedor_id
WHERE p.stock_disponible > 0;

CREATE VIEW vw_resumen_ventas_vendedor AS
SELECT 
    v.vendedor_id,
    v.nombre_tienda,
    COUNT(DISTINCT o.orden_id) AS total_ordenes_procesadas,
    COALESCE(SUM(d.cantidad), 0) AS unidades_vendidas,
    COALESCE(SUM(d.cantidad * d.precio_unitario_usd), 0.00) AS ingresos_totales_usd
FROM vendedores v
LEFT JOIN productos_accesorios p ON v.vendedor_id = p.vendedor_id
LEFT JOIN detalle_orden d ON p.producto_id = d.producto_id
LEFT JOIN ordenes_compra o ON d.orden_id = o.orden_id AND o.estado_orden IN ('Enviado', 'Entregado')
GROUP BY v.vendedor_id, v.nombre_tienda;