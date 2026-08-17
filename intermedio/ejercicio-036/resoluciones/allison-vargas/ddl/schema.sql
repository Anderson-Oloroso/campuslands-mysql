DROP DATABASE IF EXISTS hiperdeportivos_1fn_db;
CREATE DATABASE hiperdeportivos_1fn_db;
USE hiperdeportivos_1fn_db;

CREATE TABLE autos_hiperdeportivos (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    potencia_hp INT NOT NULL,
    velocidad_max_kmh INT NOT NULL,
    precio DECIMAL(12, 2) NOT NULL,
    estado_disponibilidad VARCHAR(25) NOT NULL,
    CONSTRAINT chk_potencia_atomica CHECK (potencia_hp > 0),
    CONSTRAINT chk_velocidad_atomica CHECK (velocidad_max_kmh > 0),
    CONSTRAINT chk_precio_atomico CHECK (precio >= 0.00),
    CONSTRAINT chk_estado_valido CHECK (estado_disponibilidad IN ('Disponible', 'Reservado', 'Vendido'))
);
