CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Tabla principal de autos hiperdeportivos normalizada (1FN: campos atómicos y sin grupos repetitivos)
CREATE TABLE IF NOT EXISTS autos_hiperdeportivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    velocidad_maxima_kmh INT NOT NULL,
    precio_millones_usd DECIMAL(10, 2) NOT NULL,
    estado ENUM('disponible', 'vendido', 'reservado') DEFAULT 'disponible',
    anio_lanzamiento YEAR NOT NULL,
    CONSTRAINT chk_velocidad_1fn CHECK (velocidad_maxima_kmh > 300)
);

-- Tabla dependiente para cumplir con la atomicidad de atributos multivaluados (1FN), por ejemplo, las opciones de colores o materiales de personalización disponibles por auto
CREATE TABLE IF NOT EXISTS especificaciones_colores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    auto_id INT NOT NULL,
    color_disponible VARCHAR(40) NOT NULL,
    FOREIGN KEY (auto_id) REFERENCES autos_hiperdeportivos(id) ON DELETE CASCADE
);