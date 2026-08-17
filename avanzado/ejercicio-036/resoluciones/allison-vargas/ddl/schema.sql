DROP DATABASE IF EXISTS hiperdeportivos_explain_db;
CREATE DATABASE hiperdeportivos_explain_db;
USE hiperdeportivos_explain_db;

CREATE TABLE autos_hiperdeportivos (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    potencia_hp INT NOT NULL,
    velocidad_max_kmh INT NOT NULL,
    precio DECIMAL(12, 2) NOT NULL,
    estado_disponibilidad VARCHAR(25) NOT NULL,
    CONSTRAINT chk_potencia CHECK (potencia_hp > 0),
    CONSTRAINT chk_velocidad CHECK (velocidad_max_kmh > 0),
    CONSTRAINT chk_precio CHECK (precio >= 0.00),
    CONSTRAINT chk_estado CHECK (estado_disponibilidad IN ('Disponible', 'Reservado', 'Vendido'))
);

-- Creación de índices para optimizar y analizar planes de ejecución con EXPLAIN
CREATE INDEX idx_marca_modelo ON autos_hiperdeportivos(marca, modelo);
CREATE INDEX idx_estado ON autos_hiperdeportivos(estado_disponibilidad);
CREATE INDEX idx_precio ON autos_hiperdeportivos(precio);
