USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS ilustraciones_digitales(
    ilustracion_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_obra VARCHAR(100) NOT NULL,
    estilo_arte VARCHAR(50) NOT NULL,
    software VARCHAR(100) NOT NULL,
    horas_trabajo DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
