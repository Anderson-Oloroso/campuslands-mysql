USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS trabajos_soldadura(
    trabajo_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_soldadura VARCHAR(100) NOT NULL,
    material_base VARCHAR(50) NOT NULL,
    espesor_mm VARCHAR(100) NOT NULL,
    costo_proyecto DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS inspecciones_soldadura(
    inspeccion_id INT AUTO_INCREMENT PRIMARY KEY,
    trabajo_id INT NOT NULL,
    inspector VARCHAR(100) NOT NULL,
    resultado_prueba VARCHAR(50) NOT NULL,
    nivel_defecto DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_inspecciones_soldadura_trabajos_soldadura FOREIGN KEY (trabajo_id) REFERENCES trabajos_soldadura(trabajo_id) ON DELETE CASCADE
);
