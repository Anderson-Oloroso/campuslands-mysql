CREATE DATABASE IF NOT EXISTS marketplace_accesorios_db;
USE marketplace_accesorios_db;

CREATE TABLE accesorios_marketplace (
    id_accesorio INT PRIMARY KEY AUTO_INCREMENT,
    codigo_accesorio VARCHAR(20) NOT NULL UNIQUE,
    nombre_accesorio VARCHAR(100) NOT NULL,
    categoria_accesorio VARCHAR(50) NOT NULL,
    precio_usd DECIMAL(10,2) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    estado_inventario ENUM('disponible', 'agotado', 'en_oferta', 'descontinuado') DEFAULT 'disponible',
    CONSTRAINT chk_precio_accesorio CHECK (precio_usd > 0.00)
);