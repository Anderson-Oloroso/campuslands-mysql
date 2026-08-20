CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE trabajos_soldadura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_trabajo VARCHAR(100) NOT NULL,
    tipo_soldadura VARCHAR(50) NOT NULL,
    material VARCHAR(50) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizado', 'cancelado')
        NOT NULL DEFAULT 'pendiente',

    CONSTRAINT chk_costo_positivo
        CHECK (costo >= 0)
);