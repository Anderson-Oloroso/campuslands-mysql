USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS servicios_taller(
    servicio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    duracion_hrs VARCHAR(100) NOT NULL,
    costo_base DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
