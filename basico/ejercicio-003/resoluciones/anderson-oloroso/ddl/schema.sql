USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS armas_shooter(
    arma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_arma VARCHAR(100) NOT NULL,
    tipo_arma VARCHAR(50) NOT NULL,
    daño_base VARCHAR(100) NOT NULL,
    cadencia DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
