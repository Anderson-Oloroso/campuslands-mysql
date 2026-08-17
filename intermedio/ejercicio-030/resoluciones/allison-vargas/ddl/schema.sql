DROP DATABASE IF EXISTS streaming_carga_db;
CREATE DATABASE streaming_carga_db;
USE streaming_carga_db;

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    calificacion DECIMAL(3, 2) NOT NULL,
    CONSTRAINT chk_calificacion CHECK (calificacion BETWEEN 0.00 AND 5.00)
);

CREATE TABLE equipos_streaming (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    nombre_equipo VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    fecha_recepcion DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT fk_equipo_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0.00),
    CONSTRAINT chk_stock_positivo CHECK (stock >= 0),
    CONSTRAINT chk_estado_equipo CHECK (estado IN ('Disponible', 'En Tránsito', 'Agotado'))
);
