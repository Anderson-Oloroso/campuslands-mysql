DROP DATABASE IF EXISTS kickboxing_bloqueos_db;
CREATE DATABASE kickboxing_bloqueos_db;
USE kickboxing_bloqueos_db;

-- Tabla transaccional para control de combates de kickboxing bajo concurrencia
CREATE TABLE combates_kickboxing (
    id_combate INT AUTO_INCREMENT PRIMARY KEY,
    luchador_azul VARCHAR(50) NOT NULL,
    luchador_rojo VARCHAR(50) NOT NULL,
    categoria_peso VARCHAR(30) NOT NULL,
    puntaje_azul INT NOT NULL DEFAULT 0,
    puntaje_rojo INT NOT NULL DEFAULT 0,
    estado_combate VARCHAR(20) NOT NULL,
    CONSTRAINT chk_puntaje_a CHECK (puntaje_azul >= 0),
    CONSTRAINT chk_puntaje_r CHECK (puntaje_rojo >= 0),
    CONSTRAINT chk_estado_combate CHECK (estado_combate IN ('Programado', 'En Curso', 'Finalizado', 'Suspendido'))
);
