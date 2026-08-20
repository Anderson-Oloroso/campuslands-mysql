USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS tatuajes_estudio(
    tatuaje_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_diseno VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    tamanio_cm VARCHAR(100) NOT NULL,
    precio DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
