-- ============================================================
-- EJERCICIO 013
-- JSON EN MYSQL PARA CATALOGO DE PELICULAS DE MIEDO
-- ============================================================

-- ============================================================
-- 1. CREAR BASE DE DATOS
-- ============================================================

DROP DATABASE IF EXISTS catalogo_peliculas_json_013;

CREATE DATABASE catalogo_peliculas_json_013;

USE catalogo_peliculas_json_013;


-- ============================================================
-- 2. TABLA CATEGORIAS
-- ============================================================

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE
);


-- ============================================================
-- 3. TABLA DIRECTORES
-- ============================================================

CREATE TABLE directores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_director VARCHAR(100) NOT NULL
);


-- ============================================================
-- 4. TABLA PELICULAS
-- ============================================================

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_pelicula VARCHAR(150) NOT NULL,
    id_categoria INT NOT NULL,
    id_director INT NOT NULL,
    duracion_minutos INT NOT NULL CHECK (duracion_minutos > 0),
    anio_publicacion YEAR NOT NULL,

    -- Informacion flexible almacenada como JSON
    informacion_json JSON NOT NULL,

    CONSTRAINT fk_pelicula_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id),

    CONSTRAINT fk_pelicula_director
        FOREIGN KEY (id_director)
        REFERENCES directores(id)
);
