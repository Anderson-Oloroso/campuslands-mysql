CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE destinos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_destino VARCHAR(80) NOT NULL UNIQUE,
    pais VARCHAR(50) NOT NULL,
    continente VARCHAR(40) NOT NULL
);

CREATE TABLE paquetes_turisticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    destino_id INT NOT NULL,
    nombre_paquete VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    duracion_dias INT NOT NULL,
    estado_paquete ENUM('disponible', 'agotado', 'proximamente') DEFAULT 'disponible',
    CONSTRAINT fk_destino FOREIGN KEY (destino_id) REFERENCES destinos(id) ON DELETE CASCADE,
    CONSTRAINT chk_precio_paquete CHECK (precio > 0),
    CONSTRAINT chk_duracion_dias CHECK (duracion_dias > 0)
);