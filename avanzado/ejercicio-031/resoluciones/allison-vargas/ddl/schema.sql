DROP DATABASE IF EXISTS db_esports_moba;
CREATE DATABASE db_esports_moba;
USE db_esports_moba;

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(30) NOT NULL,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo'
);

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    alias VARCHAR(50) NOT NULL,
    rol VARCHAR(30) NOT NULL,
    kda_promedio DECIMAL(4,2) DEFAULT 0.00,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE CASCADE
);

CREATE TABLE partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_ganador_id INT NOT NULL,
    equipo_perdedor_id INT NOT NULL,
    duracion_minutos INT NOT NULL,
    fecha_partida DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (equipo_ganador_id) REFERENCES equipos(id),
    FOREIGN KEY (equipo_perdedor_id) REFERENCES equipos(id),
    CONSTRAINT chk_duracion CHECK (duracion_minutos > 5)
);
