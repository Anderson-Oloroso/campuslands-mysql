-- Campuslands MySQL - Intermedio Ejercicio 059
-- Temática: Marketplace de Accesorios (Vistas Simples)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza previa de vistas y tablas
DROP VIEW IF EXISTS vw_ventas_por_vendedor;
DROP VIEW IF EXISTS vw_inventario_critico;
DROP VIEW IF EXISTS vw_catalogo_activos;
DROP VIEW IF EXISTS vw_resumen_pedidos;

DROP TABLE IF EXISTS detalle_pedidos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos_accesorios;
DROP TABLE IF EXISTS vendedores;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- 1. Tabla de Categorías de Accesorios
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT NULL
);

-- 2. Tabla de Vendedores del Marketplace
CREATE TABLE vendedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tienda VARCHAR(80) NOT NULL UNIQUE,
    correo_contacto VARCHAR(100) NOT NULL UNIQUE,
    comision_porcentaje DECIMAL(4,2) NOT NULL DEFAULT 5.00 CONSTRAINT chk_comision CHECK (comision_porcentaje BETWEEN 0.00 AND 30.00),
    estado ENUM('Activo', 'Suspendido', 'En Revision') NOT NULL DEFAULT 'Activo'
);

-- 3. Tabla de Clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL DEFAULT 'Guatemala',
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- 4. Tabla de Productos Accesorios
CREATE TABLE productos_accesorios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vendedor_id INT NOT NULL,
    categoria_id INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    sku VARCHAR(30) NOT NULL UNIQUE,
    precio DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_positivo CHECK (precio > 0.00),
    stock_disponible INT NOT NULL DEFAULT 0 CONSTRAINT chk_stock_positivo CHECK (stock_disponible >= 0),
    color_dominante VARCHAR(30) NOT NULL DEFAULT 'Negro',
    material_principal VARCHAR(50) NOT NULL DEFAULT 'Cuero',
    estado ENUM('Disponible', 'Agotado', 'Descontinuado') NOT NULL DEFAULT 'Disponible',
    FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
);

-- 5. Tabla Encabezado de Pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monto_total DECIMAL(10,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_monto_positivo CHECK (monto_total >= 0.00),
    estado_pedido ENUM('Pendiente', 'Pagado', 'Enviado', 'Entregado', 'Cancelado') NOT NULL DEFAULT 'Pendiente',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- 6. Tabla Detalle de Pedidos
CREATE TABLE detalle_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1 CONSTRAINT chk_cantidad_positiva CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_unitario CHECK (precio_unitario > 0.00),
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos_accesorios(id) ON DELETE CASCADE
);

-- ============================================================================
-- CREACIÓN DE VISTAS SIMPLES / ANALÍTICAS
-- ============================================================================

-- VISTA 1: Catálogo de productos activos con detalles de tienda y categoría
CREATE VIEW vw_catalogo_activos AS
SELECT 
    p.id AS producto_id,
    p.sku,
    p.nombre_producto,
    c.nombre_categoria,
    p.color_dominante,
    p.material_principal,
    p.precio,
    p.stock_disponible,
    v.nombre_tienda AS vendedor
FROM productos_accesorios p
INNER JOIN categorias c ON p.categoria_id = c.id
INNER JOIN vendedores v ON p.vendedor_id = v.id
WHERE p.estado = 'Disponible' AND v.estado = 'Activo';

-- VISTA 2: Productos con stock crítico (menor o igual a 5 unidades)
CREATE VIEW vw_inventario_critico AS
SELECT 
    p.id AS producto_id,
    p.sku,
    p.nombre_producto,
    v.nombre_tienda,
    p.stock_disponible,
    p.precio,
    CASE 
        WHEN p.stock_disponible = 0 THEN 'Agotado'
        WHEN p.stock_disponible BETWEEN 1 AND 5 THEN 'Reabastecer Urgente'
        ELSE 'Stock Normal'
    END AS diagnostico_stock
FROM productos_accesorios p
INNER JOIN vendedores v ON p.vendedor_id = v.id
WHERE p.stock_disponible <= 5 AND p.estado != 'Descontinuado';

-- VISTA 3: Resumen general de pedidos con información agregada del cliente
CREATE VIEW vw_resumen_pedidos AS
SELECT 
    p.id AS pedido_id,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente_nombre,
    c.email AS cliente_email,
    c.ciudad,
    p.fecha_pedido,
    p.monto_total,
    p.estado_pedido
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.id;

-- VISTA 4: Reporte consolidado de ventas y comisiones por tienda vendedora
CREATE VIEW vw_ventas_por_vendedor AS
SELECT 
    v.id AS vendedor_id,
    v.nombre_tienda,
    v.comision_porcentaje,
    COUNT(DISTINCT ped.id) AS total_pedidos_atendidos,
    IFNULL(SUM(dp.subtotal), 0.00) AS total_ventas_brutas,
    IFNULL(ROUND(SUM(dp.subtotal) * (v.comision_porcentaje / 100), 2), 0.00) AS ganancia_marketplace_comision
FROM vendedores v
LEFT JOIN productos_accesorios p ON v.id = p.vendedor_id
LEFT JOIN detalle_pedidos dp ON p.id = dp.producto_id
LEFT JOIN pedidos ped ON dp.pedido_id = ped.id AND ped.estado_pedido IN ('Pagado', 'Enviado', 'Entregado')
GROUP BY v.id, v.nombre_tienda, v.comision_porcentaje;