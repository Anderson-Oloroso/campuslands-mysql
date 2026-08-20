DROP TABLE IF EXISTS detalles_orden;
DROP TABLE IF EXISTS ordenes;
DROP TABLE IF EXISTS productos_menu;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    saldo_monedero DECIMAL(10,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_saldo CHECK (saldo_monedero >= 0.00)
);

CREATE TABLE productos_menu (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL UNIQUE,
    categoria VARCHAR(50) NOT NULL,
    precio_unitario DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_producto CHECK (precio_unitario > 0.00),
    stock_disponible INT NOT NULL CONSTRAINT chk_stock CHECK (stock_disponible >= 0)
);

CREATE TABLE ordenes (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_orden DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_orden DECIMAL(10,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_total CHECK (total_orden >= 0.00),
    estado_orden VARCHAR(30) NOT NULL DEFAULT 'Pendiente' CONSTRAINT chk_estado_orden CHECK (estado_orden IN ('Pendiente', 'Completada', 'Cancelada')),
    CONSTRAINT fk_ordenes_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE detalles_orden (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT chk_cantidad CHECK (cantidad > 0),
    precio_historico DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_historico CHECK (precio_historico > 0.00),
    subtotal DECIMAL(10,2) NOT NULL CONSTRAINT chk_subtotal CHECK (subtotal > 0.00),
    CONSTRAINT fk_do_ordenes 
        FOREIGN KEY (orden_id) REFERENCES ordenes(orden_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_do_productos 
        FOREIGN KEY (producto_id) REFERENCES productos_menu(producto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_orden_producto 
        UNIQUE (orden_id, producto_id)
);