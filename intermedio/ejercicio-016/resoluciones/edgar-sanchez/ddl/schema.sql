CREATE TABLE categorias_menu (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL
);

CREATE TABLE productos_comida (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL UNIQUE,
    precio_venta_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_producto CHECK (precio_venta_usd > 0.00),
    es_vegetariano BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_productos_categorias 
        FOREIGN KEY (categoria_id) REFERENCES categorias_menu(categoria_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE mesas_restaurante (
    mesa_id INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT NOT NULL UNIQUE CONSTRAINT chk_numero_mesa CHECK (numero_mesa > 0),
    capacidad_personas INT NOT NULL CONSTRAINT chk_capacidad_mesa CHECK (capacidad_personas > 0),
    ubicacion_zona VARCHAR(50) NOT NULL CONSTRAINT chk_zona CHECK (ubicacion_zona IN ('Terraza', 'Interior', 'Barra'))
);

CREATE TABLE ordenes_restaurante (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    mesa_id INT NOT NULL,
    fecha_hora_orden DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nombre_mesero VARCHAR(100) NOT NULL,
    estado_orden VARCHAR(20) NOT NULL DEFAULT 'En proceso' CONSTRAINT chk_estado_orden CHECK (estado_orden IN ('En proceso', 'Atendida', 'Cancelada')),
    CONSTRAINT fk_ordenes_mesas 
        FOREIGN KEY (mesa_id) REFERENCES mesas_restaurante(mesa_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE detalles_orden_comida (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT chk_cantidad CHECK (cantidad > 0),
    precio_unitario_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_detalle CHECK (precio_unitario_usd > 0.00),
    CONSTRAINT fk_detalles_ordenes 
        FOREIGN KEY (orden_id) REFERENCES ordenes_restaurante(orden_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detalles_productos 
        FOREIGN KEY (producto_id) REFERENCES productos_comida(producto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_orden_producto 
        UNIQUE (orden_id, producto_id)
);