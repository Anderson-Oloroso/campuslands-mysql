DROP DATABASE IF EXISTS shooter_skins_basico_db;
CREATE DATABASE shooter_skins_basico_db;
USE shooter_skins_basico_db;

CREATE TABLE skins_shooter (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(60) NOT NULL,
    arma VARCHAR(40) NOT NULL,
    rareza VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado_inventario VARCHAR(20) NOT NULL,
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0.00),
    CONSTRAINT chk_rareza_valida CHECK (rareza IN ('Común', 'Rara', 'Épica', 'Legendaria')),
    CONSTRAINT chk_estado_valido CHECK (estado_inventario IN ('Disponible', 'Equipado', 'En Venta'))
);
