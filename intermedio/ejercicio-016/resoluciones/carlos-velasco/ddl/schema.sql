CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS platos;
DROP TABLE IF EXISTS clientes;


CREATE TABLE clientes (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT uq_clientes_telefono
        UNIQUE (telefono),

    CONSTRAINT chk_clientes_nombre
        CHECK (CHAR_LENGTH(TRIM(nombre)) >= 3)
);


CREATE TABLE platos (
    id_plato INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT uq_platos_nombre
        UNIQUE (nombre),

    CONSTRAINT chk_platos_precio
        CHECK (precio > 0)
);


CREATE TABLE pedidos (
    id_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT UNSIGNED NOT NULL,
    id_plato INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'preparando', 'entregado', 'cancelado')
        NOT NULL DEFAULT 'pendiente',

    CONSTRAINT chk_pedidos_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT fk_pedidos_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_pedidos_plato
        FOREIGN KEY (id_plato)
        REFERENCES platos(id_plato)
);