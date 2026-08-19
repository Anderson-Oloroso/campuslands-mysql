CREATE DATABASE IF NOT EXISTS agencia_viajes_db;
USE agencia_viajes_db;

CREATE TABLE destinos_turisticos (
    id_destino INT PRIMARY KEY AUTO_INCREMENT,
    nombre_destino VARCHAR(80) NOT NULL UNIQUE,
    pais VARCHAR(50) NOT NULL,
    continente VARCHAR(30) NOT NULL
);

CREATE TABLE paquetes_turisticos (
    id_paquete INT PRIMARY KEY AUTO_INCREMENT,
    codigo_referencia VARCHAR(20) NOT NULL UNIQUE,
    nombre_paquete VARCHAR(100) NOT NULL,
    id_destino INT,
    duracion_dias INT NOT NULL,
    precio_base DECIMAL(9,2) NOT NULL,
    cupos_disponibles INT NOT NULL,
    estado_paquete ENUM('activo', 'agotado', 'proximamente', 'suspendido') DEFAULT 'activo',
    FOREIGN KEY (id_destino) REFERENCES destinos_turisticos(id_destino),
    CONSTRAINT chk_precio_paquete CHECK (precio_base > 0.00),
    CONSTRAINT chk_duracion_dias CHECK (duracion_dias > 0),
    CONSTRAINT chk_cupos CHECK (cupos_disponibles >= 0)
);