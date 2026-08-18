-- Campuslands MySQL - intermedio ejercicio 033
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE rarezas_skin (
    rareza_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rareza VARCHAR(50) NOT NULL UNIQUE,
    multiplicador_valor DECIMAL(4,2) NOT NULL DEFAULT 1.00 CONSTRAINT chk_multiplicador CHECK (multiplicador_valor > 0.00)
);

CREATE TABLE armas_shooter (
    arma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_arma VARCHAR(50) NOT NULL UNIQUE,
    tipo_arma VARCHAR(30) NOT NULL CONSTRAINT chk_tipo_arma CHECK (tipo_arma IN ('Rifle de Asalto', 'Subfusil', 'Francotirador', 'Pistola', 'Cuchillo')),
    calibre VARCHAR(20) NOT NULL
);

CREATE TABLE colecciones_skins (
    coleccion_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_coleccion VARCHAR(100) NOT NULL UNIQUE,
    temporada_lanzamiento VARCHAR(30) NOT NULL
);

CREATE TABLE skins_arma (
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    arma_id INT NOT NULL,
    rareza_id INT NOT NULL,
    coleccion_id INT NOT NULL,
    nombre_skin VARCHAR(100) NOT NULL,
    precio_base_usd DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_base CHECK (precio_base_usd > 0.00),
    CONSTRAINT fk_skins_armas 
        FOREIGN KEY (arma_id) REFERENCES armas_shooter(arma_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_skins_rarezas 
        FOREIGN KEY (rareza_id) REFERENCES rarezas_skin(rareza_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_skins_colecciones 
        FOREIGN KEY (coleccion_id) REFERENCES colecciones_skins(coleccion_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_arma_skin 
        UNIQUE (arma_id, nombre_skin)
);

CREATE TABLE inventario_jugadores_skins (
    inventario_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_codigo VARCHAR(20) NOT NULL,
    skin_id INT NOT NULL,
    float_wear DECIMAL(5,4) NOT NULL CONSTRAINT chk_float CHECK (float_wear BETWEEN 0.0000 AND 1.0000),
    es_stattrak BOOLEAN NOT NULL DEFAULT FALSE,
    adquirido_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_inventario_skins 
        FOREIGN KEY (skin_id) REFERENCES skins_arma(skin_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);