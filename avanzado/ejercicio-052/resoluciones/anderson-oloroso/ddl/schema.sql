USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS modelos_3d(
    modelo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(100) NOT NULL,
    tipo_geometria VARCHAR(50) NOT NULL,
    numero_poligonos VARCHAR(100) NOT NULL,
    software_creacion DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS renders_animacion(
    render_id INT AUTO_INCREMENT PRIMARY KEY,
    modelo_id INT NOT NULL,
    resolucion VARCHAR(100) NOT NULL,
    tiempo_render_min VARCHAR(50) NOT NULL,
    formato_salida DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_renders_animacion_modelos_3d FOREIGN KEY (modelo_id) REFERENCES modelos_3d(modelo_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_modelos_3d(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    modelo_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
