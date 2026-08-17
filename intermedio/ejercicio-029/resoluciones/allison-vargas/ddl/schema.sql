DROP DATABASE IF EXISTS marketplace_vistas_db;
CREATE DATABASE marketplace_vistas_db;
USE marketplace_vistas_db;

CREATE TABLE accesorios_tienda (
    id_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_accesorio VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0.00),
    CONSTRAINT chk_stock_positivo CHECK (stock >= 0),
    CONSTRAINT chk_estado_accesorio CHECK (estado IN ('Disponible', 'Agotado', 'Descontinuado'))
);

-- Creación de una vista simple para encapsular los accesorios disponibles con valor de inventario
CREATE OR REPLACE VIEW vw_accesorios_disponibles AS
SELECT 
    id_accesorio,
    nombre_accesorio,
    categoria,
    precio,
    stock,
    (precio * stock) AS valor_inventario
FROM accesorios_tienda
WHERE estado = 'Disponible';
    