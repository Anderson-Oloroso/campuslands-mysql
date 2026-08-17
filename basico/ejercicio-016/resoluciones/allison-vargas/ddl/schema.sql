-- DDL: Definición de tabla para el menú del restaurante de comida urbana
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS menu_urbano;

CREATE TABLE menu_urbano (
    platillo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('hamburguesa', 'tacos', 'hot_dog', 'acompañamiento', 'bebida', 'postre') NOT NULL,
    precio DECIMAL(6,2) NOT NULL CHECK (precio > 0.00),
    es_vegetariano BOOLEAN NOT NULL DEFAULT FALSE,
    disponible BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;
