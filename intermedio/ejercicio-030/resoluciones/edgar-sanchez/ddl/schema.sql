-- Campuslands MySQL - intermedio ejercicio 030
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE categorias_equipo (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE marcas_hardware (
    marca_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    sitio_web VARCHAR(100) NOT NULL
);

CREATE TABLE creadores_contenido (
    creador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_canal VARCHAR(100) NOT NULL UNIQUE,
    plataforma_principal VARCHAR(30) NOT NULL CONSTRAINT chk_plataforma CHECK (plataforma_principal IN ('Twitch', 'YouTube', 'Kick', 'Facebook Gaming')),
    correo_contacto VARCHAR(100) NOT NULL UNIQUE,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE inventario_equipos (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    marca_id INT NOT NULL,
    categoria_id INT NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    codigo_sku VARCHAR(30) NOT NULL UNIQUE,
    precio_usd DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio CHECK (precio_usd > 0.00),
    stock_almacen INT NOT NULL DEFAULT 0 CONSTRAINT chk_stock CHECK (stock_almacen >= 0),
    CONSTRAINT fk_equipos_marcas 
        FOREIGN KEY (marca_id) REFERENCES marcas_hardware(marca_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_equipos_categorias 
        FOREIGN KEY (categoria_id) REFERENCES categorias_equipo(categoria_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE asignaciones_setups (
    asignacion_id INT AUTO_INCREMENT PRIMARY KEY,
    creador_id INT NOT NULL,
    equipo_id INT NOT NULL,
    fecha_adquisicion DATE NOT NULL,
    cantidad INT NOT NULL DEFAULT 1 CONSTRAINT chk_cantidad CHECK (cantidad > 0),
    estado_equipo VARCHAR(20) NOT NULL DEFAULT 'Excelente' CONSTRAINT chk_estado CHECK (estado_equipo IN ('Excelente', 'Bueno', 'Regular', 'Defectuoso')),
    CONSTRAINT fk_asignaciones_creadores 
        FOREIGN KEY (creador_id) REFERENCES creadores_contenido(creador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_asignaciones_equipos 
        FOREIGN KEY (equipo_id) REFERENCES inventario_equipos(equipo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_creador_equipo 
        UNIQUE (creador_id, equipo_id)
);