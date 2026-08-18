-- Campuslands MySQL - intermedio ejercicio 021
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;
CREATE TABLE artistas_dibujo (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(100) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL
);

CREATE TABLE software_dibujo (
    software_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_software VARCHAR(50) NOT NULL UNIQUE,
    desarrollador VARCHAR(50) NOT NULL,
    licencia_tipo VARCHAR(30) NOT NULL CONSTRAINT chk_licencia CHECK (licencia_tipo IN ('Gratuito', 'Pago Único', 'Suscripción'))
);

CREATE TABLE ilustraciones (
    ilustracion_id INT AUTO_INCREMENT PRIMARY KEY,
    artista_id INT NOT NULL,
    software_id INT NOT NULL,
    titulo_ilustracion VARCHAR(150) NOT NULL,
    ancho_px INT NOT NULL CONSTRAINT chk_ancho CHECK (ancho_px > 0),
    alto_px INT NOT NULL CONSTRAINT chk_alto CHECK (alto_px > 0),
    resolucion_dpi INT NOT NULL CONSTRAINT chk_dpi CHECK (resolucion_dpi >= 72),
    horas_trabajo DECIMAL(5,2) NOT NULL CONSTRAINT chk_horas CHECK (horas_trabajo > 0.00),
    fecha_creacion DATE NOT NULL,
    CONSTRAINT fk_ilustraciones_artistas 
        FOREIGN KEY (artista_id) REFERENCES artistas_dibujo(artista_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ilustraciones_software 
        FOREIGN KEY (software_id) REFERENCES software_dibujo(software_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_artista_titulo 
        UNIQUE (artista_id, titulo_ilustracion)
);

CREATE TABLE ilustracion_etiquetas (
    etiqueta_id INT AUTO_INCREMENT PRIMARY KEY,
    ilustracion_id INT NOT NULL,
    nombre_etiqueta VARCHAR(30) NOT NULL,
    CONSTRAINT fk_etiquetas_ilustraciones 
        FOREIGN KEY (ilustracion_id) REFERENCES ilustraciones(ilustracion_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_ilustracion_etiqueta 
        UNIQUE (ilustracion_id, nombre_etiqueta)
);

CREATE TABLE ilustracion_paleta_colores (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    ilustracion_id INT NOT NULL,
    codigo_hex VARCHAR(7) NOT NULL CONSTRAINT chk_hex CHECK (codigo_hex REGEXP '^#[0-9A-Fa-f]{6}$'),
    CONSTRAINT fk_colores_ilustraciones 
        FOREIGN KEY (ilustracion_id) REFERENCES ilustraciones(ilustracion_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_ilustracion_color 
        UNIQUE (ilustracion_id, codigo_hex)
);