DROP TABLE IF EXISTS auditoria_eventos_tienda;
DROP TABLE IF EXISTS cupones_descuento;
DROP TABLE IF EXISTS pedidos_detalles;
DROP TABLE IF EXISTS pedidos_cabecera;
DROP TABLE IF EXISTS productos_accesorios;
DROP TABLE IF EXISTS usuarios_clientes;

CREATE TABLE usuarios_clientes (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    estado_cuenta VARCHAR(20) NOT NULL DEFAULT 'Activo' CONSTRAINT chk_estado_usuario CHECK (estado_cuenta IN ('Activo', 'Inactivo', 'Suspendido')),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE productos_accesorios (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL CONSTRAINT chk_categoria CHECK (categoria IN ('Relojes', 'Joyería', 'Lentes', 'Bolsos', 'Cinturones')),
    precio_unitario DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio CHECK (precio_unitario > 0.00),
    stock_disponible INT NOT NULL CONSTRAINT chk_stock CHECK (stock_disponible >= 0)
);

CREATE TABLE pedidos_cabecera (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_monto CHECK (monto_total >= 0.00),
    estado_pedido VARCHAR(30) NOT NULL DEFAULT 'Pendiente' CONSTRAINT chk_estado_pedido CHECK (estado_pedido IN ('Pendiente', 'Pagado', 'Cancelado_Expirado', 'Enviado')),
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pedidos_usuarios 
        FOREIGN KEY (usuario_id) REFERENCES usuarios_clientes(usuario_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE pedidos_detalles (
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT chk_cantidad CHECK (cantidad > 0),
    precio_historico DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_hist CHECK (precio_historico > 0.00),
    PRIMARY KEY (pedido_id, producto_id),
    CONSTRAINT fk_detalles_pedidos 
        FOREIGN KEY (pedido_id) REFERENCES pedidos_cabecera(pedido_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detalles_productos 
        FOREIGN KEY (producto_id) REFERENCES productos_accesorios(producto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE cupones_descuento (
    cupon_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_cupon VARCHAR(30) NOT NULL UNIQUE,
    porcentaje_descuento DECIMAL(5,2) NOT NULL CONSTRAINT chk_descuento CHECK (porcentaje_descuento BETWEEN 1.00 AND 100.00),
    fecha_expiracion DATETIME NOT NULL,
    estado_cupon VARCHAR(20) NOT NULL DEFAULT 'Activo' CONSTRAINT chk_estado_cupon CHECK (estado_cupon IN ('Activo', 'Expirado', 'Agotado'))
);

CREATE TABLE auditoria_eventos_tienda (
    evento_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(80) NOT NULL,
    registros_afectados INT NOT NULL DEFAULT 0,
    detalles VARCHAR(255) NOT NULL,
    fecha_ejecucion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);