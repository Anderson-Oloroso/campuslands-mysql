CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS ilustraciones;

CREATE TABLE ilustraciones (
    id_ilustracion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    tecnica VARCHAR(50) NOT NULL,
    nivel VARCHAR(20) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    fecha_creacion DATE NOT NULL,
    estado ENUM('activa', 'archivada') NOT NULL DEFAULT 'activa',

    CONSTRAINT chk_precio_positivo
        CHECK (precio >= 0),

    CONSTRAINT chk_nivel_valido
        CHECK (nivel IN ('basico', 'intermedio', 'avanzado')),

    INDEX idx_ilustraciones_tecnica_estado (tecnica, estado)
);