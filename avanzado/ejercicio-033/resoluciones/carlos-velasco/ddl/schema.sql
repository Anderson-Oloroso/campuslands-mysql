CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP FUNCTION IF EXISTS fn_calcular_valor_inventario;
DROP FUNCTION IF EXISTS fn_clasificar_raridad;

DROP TABLE IF EXISTS inventario_skins;

CREATE TABLE inventario_skins (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(100) NOT NULL UNIQUE,
    arma VARCHAR(50) NOT NULL,
    rareza ENUM(
        'comun',
        'poco_comun',
        'rara',
        'epica',
        'legendaria'
    ) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    estado ENUM('disponible', 'vendida', 'reservada') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_precio
        CHECK (precio >= 0),

    CONSTRAINT chk_cantidad
        CHECK (cantidad > 0)
);