USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS planos_arquitectura(
    plano_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    tipo_estructura VARCHAR(50) NOT NULL,
    area_m2 VARCHAR(100) NOT NULL,
    presupuesto_usd DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
