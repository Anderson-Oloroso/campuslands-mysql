USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS peleadores_kickboxing(
    peleador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_peleador VARCHAR(100) NOT NULL,
    categoria_peso VARCHAR(50) NOT NULL,
    gimnasio VARCHAR(100) NOT NULL,
    victorias_ko DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS combates_kickboxing(
    combate_id INT AUTO_INCREMENT PRIMARY KEY,
    peleador_id INT NOT NULL,
    evento VARCHAR(100) NOT NULL,
    resultado VARCHAR(50) NOT NULL,
    round_final DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_combates_kickboxing_peleadores_kickboxing FOREIGN KEY (peleador_id) REFERENCES peleadores_kickboxing(peleador_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_peleadores_kickboxing(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    peleador_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
