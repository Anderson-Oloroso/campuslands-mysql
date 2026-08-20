USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS servicios_taller(
    servicio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    duracion_hrs VARCHAR(100) NOT NULL,
    costo_base DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS ordenes_taller(
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    servicio_id INT NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    estado_orden VARCHAR(50) NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ordenes_taller_servicios_taller FOREIGN KEY (servicio_id) REFERENCES servicios_taller(servicio_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_servicios_taller(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    servicio_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
