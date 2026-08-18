USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS pilotos_carreras(
    piloto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_piloto VARCHAR(100) NOT NULL,
    escuderia VARCHAR(50) NOT NULL,
    vehiculo VARCHAR(100) NOT NULL,
    puntuacion DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS tiempos_carreras(
    tiempo_id INT AUTO_INCREMENT PRIMARY KEY,
    piloto_id INT NOT NULL,
    circuito VARCHAR(100) NOT NULL,
    posicion_salida VARCHAR(50) NOT NULL,
    tiempo_segundos DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_tiempos_carreras_pilotos_carreras FOREIGN KEY (piloto_id) REFERENCES pilotos_carreras(piloto_id) ON DELETE CASCADE
);
