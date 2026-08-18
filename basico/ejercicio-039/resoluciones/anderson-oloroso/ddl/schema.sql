USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS peleadores_kickboxing(
    peleador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_peleador VARCHAR(100) NOT NULL,
    categoria_peso VARCHAR(50) NOT NULL,
    gimnasio VARCHAR(100) NOT NULL,
    victorias_ko DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
