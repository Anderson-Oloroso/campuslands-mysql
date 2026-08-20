CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE equipos_moba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    puntos_ranking INT DEFAULT 0,
    premio_acumulado DECIMAL(12, 2) DEFAULT 0.00,
    estado ENUM('activo', 'eliminado', 'campeon') DEFAULT 'activo',
    CONSTRAINT chk_puntos_ranking CHECK (puntos_ranking >= 0),
    CONSTRAINT chk_premio CHECK (premio_acumulado >= 0)
);

CREATE TABLE transferencias_jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador VARCHAR(100) NOT NULL,
    equipo_origen_id INT NOT NULL,
    equipo_destino_id INT NOT NULL,
    costo_transferencia DECIMAL(10, 2) NOT NULL,
    fecha_transaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_origen FOREIGN KEY (equipo_origen_id) REFERENCES equipos_moba(id),
    CONSTRAINT fk_destino FOREIGN KEY (equipo_destino_id) REFERENCES equipos_moba(id),
    CONSTRAINT chk_costo CHECK (costo_transferencia >= 0)
);