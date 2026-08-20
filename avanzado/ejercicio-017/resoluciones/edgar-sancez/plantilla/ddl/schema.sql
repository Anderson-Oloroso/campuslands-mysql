DROP TABLE IF EXISTS ventas_detalle;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS prendas_inventario;
DROP TABLE IF EXISTS categorias_ropa;
DROP TABLE IF EXISTS clientes_tienda;

CREATE TABLE clientes_tienda (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    puntos_fidelidad INT NOT NULL DEFAULT 0 CONSTRAINT chk_puntos CHECK (puntos_fidelidad >= 0)
);

CREATE TABLE categorias_ropa (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    departamento VARCHAR(50) NOT NULL
);

CREATE TABLE prendas_inventario (
    prenda_id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    codigo_sku VARCHAR(30) NOT NULL UNIQUE,
    nombre_prenda VARCHAR(100) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    color VARCHAR(30) NOT NULL,
    precio_unitario DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_prenda CHECK (precio_unitario > 0.00),
    stock_actual INT NOT NULL CONSTRAINT chk_stock_prenda CHECK (stock_actual >= 0),
    CONSTRAINT fk_prendas_categorias 
        FOREIGN KEY (categoria_id) REFERENCES categorias_ropa(categoria_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_sku_talla_color 
        UNIQUE (codigo_sku, talla, color)
);

CREATE TABLE ventas (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monto_total DECIMAL(10,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_monto_total CHECK (monto_total >= 0.00),
    estado_venta VARCHAR(30) NOT NULL DEFAULT 'Completada' CONSTRAINT chk_estado_venta CHECK (estado_venta IN ('Completada', 'Cancelada', 'Devuelta')),
    CONSTRAINT fk_ventas_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_tienda(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE ventas_detalle (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT NOT NULL,
    prenda_id INT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT chk_cantidad_detalle CHECK (cantidad > 0),
    precio_historico DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_hist CHECK (precio_historico > 0.00),
    subtotal DECIMAL(10,2) NOT NULL CONSTRAINT chk_subtotal_detalle CHECK (subtotal > 0.00),
    CONSTRAINT fk_vd_ventas 
        FOREIGN KEY (venta_id) REFERENCES ventas(venta_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_vd_prendas 
        FOREIGN KEY (prenda_id) REFERENCES prendas_inventario(prenda_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_venta_prenda 
        UNIQUE (venta_id, prenda_id)
);