CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE saltos (
    id_salto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_participante VARCHAR(100) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    altura_salto INT UNSIGNED NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_salto DATE NOT NULL,
    estado VARCHAR(30) NOT NULL DEFAULT 'Programado',
    CONSTRAINT chk_saltos_altura_positiva
        CHECK (altura_salto > 0),
    CONSTRAINT chk_saltos_precio_positivo
        CHECK (precio > 0)
);