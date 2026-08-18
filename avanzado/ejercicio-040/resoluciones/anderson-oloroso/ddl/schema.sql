USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS pilotos_carreras(
    piloto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_piloto VARCHAR(100) NOT NULL,
    escuderia VARCHAR(50) NOT NULL,
    vehiculo VARCHAR(100) NOT NULL,
    puntuacion DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS tiempos_carreras(
    tiempo_id INT AUTO_INCREMENT PRIMARY KEY,
    piloto_id INT NOT NULL,
    circuito VARCHAR(100) NOT NULL,
    posicion_salida VARCHAR(50) NOT NULL,
    tiempo_segundos DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_tiempos_carreras_pilotos_carreras FOREIGN KEY (piloto_id) REFERENCES pilotos_carreras(piloto_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_pilotos_carreras(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    piloto_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
