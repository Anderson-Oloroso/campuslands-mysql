USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS accesorios_market(
    accesorio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    stock VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS ventas_accesorios(
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    accesorio_id INT NOT NULL,
    comprador VARCHAR(100) NOT NULL,
    cantidad VARCHAR(50) NOT NULL,
    calificacion_servicio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ventas_accesorios_accesorios_market FOREIGN KEY (accesorio_id) REFERENCES accesorios_market(accesorio_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_accesorios_market(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    accesorio_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
