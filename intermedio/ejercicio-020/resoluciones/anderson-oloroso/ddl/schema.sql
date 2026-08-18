USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS tatuajes_estudio(
    tatuaje_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_diseno VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    tamanio_cm VARCHAR(100) NOT NULL,
    precio DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS citas_tatuajes(
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    tatuaje_id INT NOT NULL,
    nombre_cliente VARCHAR(100) NOT NULL,
    tatuador VARCHAR(50) NOT NULL,
    horas_duracion DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_citas_tatuajes_tatuajes_estudio FOREIGN KEY (tatuaje_id) REFERENCES tatuajes_estudio(tatuaje_id) ON DELETE CASCADE
);
