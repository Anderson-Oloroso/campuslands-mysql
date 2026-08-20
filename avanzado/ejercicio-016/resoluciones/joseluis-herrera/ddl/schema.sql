CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE clientes (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(150) NOT NULL
);

CREATE TABLE platos (
    id_plato INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT chk_platos_precio_positivo
        CHECK (precio > 0)
);

CREATE TABLE inventario (
    id_inventario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_plato INT UNSIGNED NOT NULL,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    ultima_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_inventario_plato
        UNIQUE (id_plato),
    CONSTRAINT fk_inventario_plato
        FOREIGN KEY (id_plato)
        REFERENCES platos(id_plato)
);

CREATE TABLE pedidos (
    id_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT UNSIGNED NOT NULL,
    fecha_pedido DATETIME NOT NULL,
    estado VARCHAR(30) NOT NULL DEFAULT 'Pendiente',
    CONSTRAINT fk_pedidos_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

CREATE TABLE detalle_pedido (
    id_detalle INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT UNSIGNED NOT NULL,
    id_plato INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),
    CONSTRAINT fk_detalle_plato
        FOREIGN KEY (id_plato)
        REFERENCES platos(id_plato),
    CONSTRAINT chk_detalle_cantidad_positiva
        CHECK (cantidad > 0),
    CONSTRAINT chk_detalle_precio_positivo
        CHECK (precio_unitario > 0)
);