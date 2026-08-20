USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS planos_arquitectura(
    plano_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    tipo_estructura VARCHAR(50) NOT NULL,
    area_m2 VARCHAR(100) NOT NULL,
    presupuesto_usd DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS elementos_edificio(
    elemento_id INT AUTO_INCREMENT PRIMARY KEY,
    plano_id INT NOT NULL,
    nombre_elemento VARCHAR(100) NOT NULL,
    material VARCHAR(50) NOT NULL,
    costo_estimado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_elementos_edificio_planos_arquitectura FOREIGN KEY (plano_id) REFERENCES planos_arquitectura(plano_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_planos_arquitectura(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    plano_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
