USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS ilustraciones_digitales(
    ilustracion_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_obra VARCHAR(100) NOT NULL,
    estilo_arte VARCHAR(50) NOT NULL,
    software VARCHAR(100) NOT NULL,
    horas_trabajo DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS capas_ilustracion(
    capa_id INT AUTO_INCREMENT PRIMARY KEY,
    ilustracion_id INT NOT NULL,
    nombre_capa VARCHAR(100) NOT NULL,
    opacidad_porcentaje VARCHAR(50) NOT NULL,
    modo_fusion DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_capas_ilustracion_ilustraciones_digitales FOREIGN KEY (ilustracion_id) REFERENCES ilustraciones_digitales(ilustracion_id) ON DELETE CASCADE
);
