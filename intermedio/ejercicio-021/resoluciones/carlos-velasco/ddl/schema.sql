CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS dibujos_digitales;

CREATE TABLE dibujos_digitales (
    id_dibujo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    tecnica VARCHAR(50) NOT NULL,
    software VARCHAR(50) NOT NULL,
    puntaje DECIMAL(4,2) NOT NULL,
    horas_trabajo DECIMAL(5,2) NOT NULL,
    fecha_creacion DATE NOT NULL,
    estado ENUM('activo', 'finalizado', 'archivado') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_puntaje
        CHECK (puntaje BETWEEN 0 AND 100),

    CONSTRAINT chk_horas_trabajo
        CHECK (horas_trabajo > 0)
);