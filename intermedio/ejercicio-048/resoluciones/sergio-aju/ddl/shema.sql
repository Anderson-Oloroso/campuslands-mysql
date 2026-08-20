-- Campuslands MySQL - Intermedio Ejercicio 048
-- Temática: Viajes y Turismo (Uso de GROUP BY y Agregaciones)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reservas;
DROP TABLE IF EXISTS paquetes_turisticos;
DROP TABLE IF EXISTS destinos;
DROP TABLE IF EXISTS clientes;

-- Tabla de clientes (turistas)
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    nacionalidad VARCHAR(50) NOT NULL
);

-- Tabla de destinos turísticos
CREATE TABLE destinos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    CONSTRAINT uq_destino UNIQUE (pais, ciudad)
);

-- Tabla de paquetes turísticos
CREATE TABLE paquetes_turisticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    destino_id INT NOT NULL,
    nombre_paquete VARCHAR(100) NOT NULL,
    duracion_dias INT NOT NULL CHECK (duracion_dias > 0),
    precio_persona DECIMAL(10,2) NOT NULL CHECK (precio_persona > 0.00),
    categoria VARCHAR(30) NOT NULL DEFAULT 'Económico', -- Económico, Premium, Aventura, Cultural
    FOREIGN KEY (destino_id) REFERENCES destinos(id) ON DELETE CASCADE
);

-- Tabla de reservas efectuadas
CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    paquete_id INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    cantidad_personas INT NOT NULL DEFAULT 1 CHECK (cantidad_personas > 0),
    monto_total DECIMAL(10,2) NOT NULL CHECK (monto_total >= 0.00),
    estado ENUM('Confirmada', 'Pendiente', 'Cancelada') NOT NULL DEFAULT 'Confirmada',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
    FOREIGN KEY (paquete_id) REFERENCES paquetes_turisticos(id) ON DELETE CASCADE
);