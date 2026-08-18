USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS trabajos_soldadura(
    trabajo_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_soldadura VARCHAR(100) NOT NULL,
    material_base VARCHAR(50) NOT NULL,
    espesor_mm VARCHAR(100) NOT NULL,
    costo_proyecto DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
