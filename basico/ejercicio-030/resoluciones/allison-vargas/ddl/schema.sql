DROP DATABASE IF EXISTS streaming_relaciones_db;
CREATE DATABASE streaming_relaciones_db;
USE streaming_relaciones_db;

CREATE TABLE categorias_streaming (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(40) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE equipos_streaming (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre_equipo VARCHAR(60) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT fk_equipo_categoria FOREIGN KEY (id_categoria) REFERENCES categorias_streaming(id_categoria),
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0.00),
    CONSTRAINT chk_stock_positivo CHECK (stock >= 0),
    CONSTRAINT chk_estado_equipo CHECK (estado IN ('Disponible', 'Agotado', 'Mantenimiento'))
);
