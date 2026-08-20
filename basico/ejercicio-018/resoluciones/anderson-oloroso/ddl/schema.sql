USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS paquetes_turisitcos(
    paquete_id INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(100) NOT NULL,
    tipo_paquete VARCHAR(50) NOT NULL,
    duracion_dias VARCHAR(100) NOT NULL,
    precio_persona DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
