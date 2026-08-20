CREATE TABLE categorias_menu (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE platillos (
    platillo_id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nombre_platillo VARCHAR(100) NOT NULL UNIQUE,
    precio_usd DECIMAL(8,2) NOT NULL CHECK (precio_usd > 0.00),
    es_vegetariano BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_platillos_categorias 
        FOREIGN KEY (categoria_id) REFERENCES categorias_menu(categoria_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE ordenes_pedidos (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_orden DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_servicio VARCHAR(20) NOT NULL CHECK (tipo_servicio IN ('Para llevar', 'Consumo local', 'Domicilio')),
    estado_orden VARCHAR(20) NOT NULL DEFAULT 'Pendiente' CHECK (estado_orden IN ('Pendiente', 'En preparación', 'Entregado', 'Cancelado')),
    CONSTRAINT fk_ordenes_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE detalles_orden (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT NOT NULL,
    platillo_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario_usd DECIMAL(8,2) NOT NULL CHECK (precio_unitario_usd > 0.00),
    CONSTRAINT fk_detalles_ordenes 
        FOREIGN KEY (orden_id) REFERENCES ordenes_pedidos(orden_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detalles_platillos 
        FOREIGN KEY (platillo_id) REFERENCES platillos(platillo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_orden_platillo 
        UNIQUE (orden_id, platillo_id)
);