CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS jugadores_sala (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    posicion VARCHAR(30) NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    tarjetas_amarillas INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'lesionado', 'suspendido') DEFAULT 'activo',
    CONSTRAINT chk_goles CHECK (goles >= 0),
    CONSTRAINT chk_tarjetas CHECK (tarjetas_amarillas >= 0)
);