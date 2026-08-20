-- Campuslands MySQL - Intermedio Ejercicio 060
-- Temática: Carga de Datos para Equipo de Streaming
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza previa de tablas
DROP TABLE IF EXISTS asignaciones_equipos;
DROP TABLE IF EXISTS equipos_streaming;
DROP TABLE IF EXISTS streamers;
DROP TABLE IF EXISTS categorias_equipos;
DROP TABLE IF EXISTS marcas;

-- 1. Tabla de Marcas de Hardware
CREATE TABLE marcas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL DEFAULT 'Japón'
);

-- 2. Tabla de Categorías de Equipos
CREATE TABLE categorias_equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT NULL
);

-- 3. Tabla de Streamers / Creadores
CREATE TABLE streamers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    plataforma_principal ENUM('Twitch', 'YouTube', 'Kick', 'Facebook Gaming') NOT NULL DEFAULT 'Twitch',
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- 4. Tabla Principal: Equipos de Streaming
CREATE TABLE equipos_streaming (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca_id INT NOT NULL,
    categoria_id INT NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    numero_serie VARCHAR(50) NOT NULL UNIQUE,
    precio_adquisicion DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_positivo CHECK (precio_adquisicion > 0.00),
    stock_almacen INT NOT NULL DEFAULT 0 CONSTRAINT chk_stock_no_negativo CHECK (stock_almacen >= 0),
    resolucion_o_especificacion VARCHAR(100) NOT NULL DEFAULT 'N/A',
    estado ENUM('Disponible', 'Asignado', 'En Mantenimiento', 'Baja') NOT NULL DEFAULT 'Disponible',
    fecha_ingreso DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (marca_id) REFERENCES marcas(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias_equipos(id) ON DELETE CASCADE
);

-- 5. Tabla de Asignaciones de Equipos a Streamers
CREATE TABLE asignaciones_equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    streamer_id INT NOT NULL,
    fecha_asignacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_devolucion DATETIME NULL,
    estado_asignacion ENUM('Activa', 'Devuelto', 'Dañado') NOT NULL DEFAULT 'Activa',
    FOREIGN KEY (equipo_id) REFERENCES equipos_streaming(id) ON DELETE CASCADE,
    FOREIGN KEY (streamer_id) REFERENCES streamers(id) ON DELETE CASCADE
);