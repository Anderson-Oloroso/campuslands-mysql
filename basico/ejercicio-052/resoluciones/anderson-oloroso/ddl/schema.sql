USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS modelos_3d(
    modelo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(100) NOT NULL,
    tipo_geometria VARCHAR(50) NOT NULL,
    numero_poligonos VARCHAR(100) NOT NULL,
    software_creacion DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
