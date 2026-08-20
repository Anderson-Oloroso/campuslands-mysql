-- Campuslands MySQL - Intermedio Ejercicio 053
-- Temática: Arquitectura 3D (Normalización 3FN: Eliminación de Dependencias Transitivas)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS render_escenas;
DROP TABLE IF EXISTS modelos_3d;
DROP TABLE IF EXISTS firmas_arquitectura;
DROP TABLE IF EXISTS categorias_espacio;
DROP TABLE IF EXISTS arquitectos;

-- Tabla de Firmas / Estudios de Arquitectura
-- Extraída para cumplir 3FN (evita dependencias transitivas: proyecto -> firma -> pais_firma/software_bim)
CREATE TABLE firmas_arquitectura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_firma VARCHAR(80) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    software_bim_preferido VARCHAR(50) NOT NULL DEFAULT 'Revit'
);

-- Tabla de Categorías de Espacio / Tipologías Arquitectónicas
-- Extraída para cumplir 3FN (evita dependencias transitivas: modelo -> categoria -> norma_construccion)
CREATE TABLE categorias_espacio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    norma_construccion_aplicable VARCHAR(80) NOT NULL,
    es_espacio_publico BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabla de Arquitectos / Diseñadores 3D
CREATE TABLE arquitectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firma_id INT NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    licencia_profesional VARCHAR(40) NOT NULL UNIQUE,
    FOREIGN KEY (firma_id) REFERENCES firmas_arquitectura(id) ON DELETE CASCADE
);

-- Tabla Principal de Modelos 3D Arquitectónicos
CREATE TABLE modelos_3d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    arquitecto_id INT NOT NULL,
    categoria_id INT NOT NULL,
    nombre_proyecto VARCHAR(100) NOT NULL,
    superficie_m2 DECIMAL(8,2) NOT NULL CHECK (superficie_m2 > 0.00),
    costo_estimado_usd DECIMAL(12,2) NOT NULL CHECK (costo_estimado_usd >= 0.00),
    escala VARCHAR(20) NOT NULL DEFAULT '1:100',
    fecha_aprobacion DATE NOT NULL,
    estado ENUM('Boceto', 'En Revisión', 'Aprobado', 'En Construcción') NOT NULL DEFAULT 'En Revisión',
    FOREIGN KEY (arquitecto_id) REFERENCES arquitectos(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias_espacio(id) ON DELETE CASCADE
);

-- Tabla de Renderizado de Escenas Arquitectónicas
CREATE TABLE render_escenas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo_id INT NOT NULL,
    nombre_vista VARCHAR(80) NOT NULL,
    motor_render VARCHAR(50) NOT NULL DEFAULT 'V-Ray',
    tiempo_render_minutos DECIMAL(6,2) NOT NULL CHECK (tiempo_render_minutos >= 0.00),
    resolucion_k ENUM('1K', '2K', '4K', '8K') NOT NULL DEFAULT '4K',
    FOREIGN KEY (modelo_id) REFERENCES modelos_3d(id) ON DELETE CASCADE
);