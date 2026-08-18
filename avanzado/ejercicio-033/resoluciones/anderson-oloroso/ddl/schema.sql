USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS armas_shooter(
    arma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_arma VARCHAR(100) NOT NULL,
    tipo_arma VARCHAR(50) NOT NULL,
    daño_base VARCHAR(100) NOT NULL,
    cadencia DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS skins_shooter(
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    arma_id INT NOT NULL,
    nombre_skin VARCHAR(100) NOT NULL,
    rareza VARCHAR(50) NOT NULL,
    precio_puntos DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_skins_shooter_armas_shooter FOREIGN KEY (arma_id) REFERENCES armas_shooter(arma_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_armas_shooter(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    arma_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
