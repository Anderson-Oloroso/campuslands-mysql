DROP DATABASE IF EXISTS garaje_motos_basico_db;
CREATE DATABASE garaje_motos_basico_db;
USE garaje_motos_basico_db;

CREATE TABLE motos_garaje (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada_cc INT NOT NULL,
    costo_mantenimiento DECIMAL(10, 2) NOT NULL,
    estado_operativo VARCHAR(20) NOT NULL,
    CONSTRAINT chk_cilindrada_positiva CHECK (cilindrada_cc > 0),
    CONSTRAINT chk_costo_no_negativo CHECK (costo_mantenimiento >= 0.00),
    CONSTRAINT chk_estado_valido CHECK (estado_operativo IN ('Disponible', 'En Reparación', 'Fuera de Servicio'))
);
