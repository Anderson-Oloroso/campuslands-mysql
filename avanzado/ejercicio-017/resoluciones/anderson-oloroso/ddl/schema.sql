USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS prendas_ropa(
    prenda_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_prenda VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    talla VARCHAR(100) NOT NULL,
    precio DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS ventas_prendas(
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    prenda_id INT NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    unidades_vendidas VARCHAR(50) NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ventas_prendas_prendas_ropa FOREIGN KEY (prenda_id) REFERENCES prendas_ropa(prenda_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_prendas_ropa(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    prenda_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
