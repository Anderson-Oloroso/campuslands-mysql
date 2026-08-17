DROP DATABASE IF EXISTS marketplace_fechas_db;
CREATE DATABASE marketplace_fechas_db;
USE marketplace_fechas_db;

CREATE TABLE accesorios_lanzamiento (
    id_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_accesorio VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    fecha_garantia_hasta DATE NOT NULL,
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0.00),
    CONSTRAINT chk_fechas_coherentes CHECK (fecha_garantia_hasta >= fecha_lanzamiento)
);
