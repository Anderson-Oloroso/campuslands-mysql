DROP DATABASE IF EXISTS kickboxing_fk_db;
CREATE DATABASE kickboxing_fk_db;
USE kickboxing_fk_db;

-- Tabla Maestra: Gimnasios organizadores
CREATE TABLE gimnasios (
    id_gimnasio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_gimnasio VARCHAR(60) NOT NULL UNIQUE,
    ciudad VARCHAR(40) NOT NULL,
    pais VARCHAR(40) NOT NULL DEFAULT 'España'
);

-- Tabla Transaccional con FOREIGN KEY hacia Gimnasios
CREATE TABLE combates_kickboxing (
    id_combate INT AUTO_INCREMENT PRIMARY KEY,
    id_gimnasio INT NOT NULL,
    luchador_azul VARCHAR(50) NOT NULL,
    luchador_rojo VARCHAR(50) NOT NULL,
    categoria_peso VARCHAR(30) NOT NULL,
    puntaje_azul INT NOT NULL DEFAULT 0,
    puntaje_rojo INT NOT NULL DEFAULT 0,
    estado_combate VARCHAR(20) NOT NULL,
    CONSTRAINT fk_combate_gimnasio FOREIGN KEY (id_gimnasio) REFERENCES gimnasios(id_gimnasio) ON DELETE RESTRICT,
    CONSTRAINT chk_puntaje_azul CHECK (puntaje_azul >= 0),
    CONSTRAINT chk_puntaje_rojo CHECK (puntaje_rojo >= 0),
    CONSTRAINT chk_estado_combate CHECK (estado_combate IN ('Programado', 'En Curso', 'Finalizado', 'Suspendido'))
);
