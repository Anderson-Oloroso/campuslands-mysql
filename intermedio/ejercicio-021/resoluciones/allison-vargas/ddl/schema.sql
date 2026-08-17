-- DDL: Estructura normalizada en Primera Forma Normal (1FN)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS etiquetas_obras;
DROP TABLE IF EXISTS obras_dibujo_1fn;

CREATE TABLE obras_dibujo_1fn (
    obra_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_obra VARCHAR(15) NOT NULL UNIQUE,
    artista_nombre VARCHAR(100) NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    software ENUM('Photoshop', 'Procreate', 'Clip Studio Paint', 'Krita', 'Blender') NOT NULL,
    precio_usd DECIMAL(8,2) NOT NULL CHECK (precio_usd >= 0.00),
    estado ENUM('en_venta', 'vendida', 'exhibicion') NOT NULL DEFAULT 'en_venta',
    fecha_publicacion DATE NOT NULL
) ENGINE=InnoDB;

-- Tabla para garantizar la 1FN eliminando campos multivaluados (Etiquetas/Tags atómicas)
CREATE TABLE etiquetas_obras (
    etiqueta_id INT AUTO_INCREMENT PRIMARY KEY,
    obra_id INT NOT NULL,
    etiqueta VARCHAR(50) NOT NULL,
    FOREIGN KEY (obra_id) REFERENCES obras_dibujo_1fn(obra_id) ON DELETE CASCADE,
    UNIQUE KEY uq_obra_etiqueta (obra_id, etiqueta)
) ENGINE=InnoDB;
