-- ============================================================
-- Ejercicio 015 - Relaciones simples para biblioteca gamer
-- Archivo: ddl/schema.sql
-- Motor: MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ============================================================
-- Tabla: categorias
-- Contiene las categorías de los videojuegos.
-- ============================================================

CREATE TABLE categorias (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- ============================================================
-- Tabla: juegos
-- Contiene los videojuegos registrados en la biblioteca.
-- ============================================================

CREATE TABLE juegos (
    id_juego INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    puntaje DECIMAL(3,1) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    id_categoria INT UNSIGNED NOT NULL,

    CONSTRAINT chk_juegos_puntaje
        CHECK (puntaje BETWEEN 0.0 AND 10.0),

    CONSTRAINT chk_juegos_precio
        CHECK (precio >= 0),

    CONSTRAINT fk_juegos_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);