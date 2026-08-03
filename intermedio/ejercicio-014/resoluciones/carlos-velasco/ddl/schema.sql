-- Campuslands MySQL - Intermedio Ejercicio 014
-- Tema: Vistas simples

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP VIEW IF EXISTS vista_sagas_activas;
DROP VIEW IF EXISTS vista_sagas_recientes;

DROP TABLE IF EXISTS sagas;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE sagas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    universo VARCHAR(80) NOT NULL,
    director VARCHAR(100) NOT NULL,
    fecha_estreno DATE NOT NULL,
    peliculas INT NOT NULL,
    estado ENUM('Activa','Finalizada') NOT NULL DEFAULT 'Activa',

    CHECK(peliculas>0)
);

-- Vista de sagas activas

CREATE VIEW vista_sagas_activas AS
SELECT
    titulo,
    universo,
    peliculas
FROM sagas
WHERE estado='Activa';

-- Vista de sagas estrenadas desde 2010

CREATE VIEW vista_sagas_recientes AS
SELECT
    titulo,
    director,
    fecha_estreno
FROM sagas
WHERE fecha_estreno >= '2010-01-01';