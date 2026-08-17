DROP DATABASE IF EXISTS streaming_optimizacion_db;
CREATE DATABASE streaming_optimizacion_db;
USE streaming_optimizacion_db;

CREATE TABLE equipos_streaming (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0.00),
    CONSTRAINT chk_stock_no_negativo CHECK (stock >= 0),
    CONSTRAINT chk_estado_equipo CHECK (estado IN ('Disponible', 'Agotado', 'Mantenimiento'))
);

-- Creación de índices para optimizar la búsqueda y el filtrado frecuente por categoría y estado
CREATE INDEX idx_categoria_estado ON equipos_streaming (categoria, estado);
CREATE INDEX idx_precio ON equipos_streaming (precio);
