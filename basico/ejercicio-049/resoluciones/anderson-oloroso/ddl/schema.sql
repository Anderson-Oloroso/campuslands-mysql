USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS saltos_paracaidismo(
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor VARCHAR(100) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    altura_pies VARCHAR(100) NOT NULL,
    costo_salto DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
