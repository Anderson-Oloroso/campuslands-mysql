-- ============================================================
-- Ejercicio 016 - Transacciones para restaurante de comida urbana
-- Base de datos: campuslands_mysql
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tabla: productos
-- ------------------------------------------------------------
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_productos_precio
        CHECK (precio > 0),

    CONSTRAINT chk_productos_stock
        CHECK (stock >= 0)
);

-- ------------------------------------------------------------
-- Tabla: pedidos
-- ------------------------------------------------------------
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'preparando', 'entregado', 'cancelado')
        NOT NULL DEFAULT 'pendiente',
    total DECIMAL(10, 2) NOT NULL DEFAULT 0.00,

    CONSTRAINT chk_pedidos_total
        CHECK (total >= 0)
);

-- ------------------------------------------------------------
-- Tabla: detalle_pedido
-- ------------------------------------------------------------
CREATE TABLE detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,

    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto),

    CONSTRAINT chk_detalle_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT chk_detalle_precio
        CHECK (precio_unitario > 0),

    CONSTRAINT uq_pedido_producto
        UNIQUE (id_pedido, id_producto)
);

-- Índices útiles para consultas y relaciones.
CREATE INDEX idx_productos_categoria
    ON productos(categoria);

CREATE INDEX idx_pedidos_estado
    ON pedidos(estado);

CREATE INDEX idx_pedidos_fecha
    ON pedidos(fecha_pedido);

CREATE INDEX idx_detalle_pedido
    ON detalle_pedido(id_pedido);