USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS saltos_paracaidismo(
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor VARCHAR(100) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    altura_pies VARCHAR(100) NOT NULL,
    costo_salto DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS bitacora_saltos(
    bitacora_id INT AUTO_INCREMENT PRIMARY KEY,
    salto_id INT NOT NULL,
    paracaidista VARCHAR(100) NOT NULL,
    tiempo_caida_libre_seg VARCHAR(50) NOT NULL,
    calificacion_aterrizaje DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_bitacora_saltos_saltos_paracaidismo FOREIGN KEY (salto_id) REFERENCES saltos_paracaidismo(salto_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_saltos_paracaidismo(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    salto_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
