CREATE TABLE categorias_ropa (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    departamento VARCHAR(50) NOT NULL CONSTRAINT chk_departamento CHECK (departamento IN ('Damas', 'Caballeros', 'Niños', 'Unisex'))
);

CREATE TABLE proveedores_ropa (
    proveedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    correo_contacto VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE productos_ropa (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    proveedor_id INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    talla VARCHAR(10) NOT NULL CONSTRAINT chk_talla CHECK (talla IN ('XS', 'S', 'M', 'L', 'XL', 'Única')),
    color VARCHAR(30) NOT NULL,
    precio_venta_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_ropa CHECK (precio_venta_usd > 0.00),
    stock_actual INT NOT NULL CONSTRAINT chk_stock CHECK (stock_actual >= 0),
    CONSTRAINT fk_productos_categorias 
        FOREIGN KEY (categoria_id) REFERENCES categorias_ropa(categoria_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_productos_proveedores 
        FOREIGN KEY (proveedor_id) REFERENCES proveedores_ropa(proveedor_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_producto_talla_color 
        UNIQUE (nombre_producto, talla, color)
);

CREATE TABLE clientes_tienda (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL
);

CREATE TABLE ventas_ropa (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT chk_cantidad_ropa CHECK (cantidad > 0),
    precio_unidad_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_unidad CHECK (precio_unidad_usd > 0.00),
    fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ventas_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_tienda(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ventas_productos 
        FOREIGN KEY (producto_id) REFERENCES productos_ropa(producto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);