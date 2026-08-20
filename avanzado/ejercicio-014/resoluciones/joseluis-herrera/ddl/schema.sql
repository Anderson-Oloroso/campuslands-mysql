CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP EVENT IF EXISTS evento_revision_peliculas;
DROP TABLE IF EXISTS control_eventos;
DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    saga VARCHAR(100) NOT NULL,
    fecha_estreno DATE NOT NULL,
    puntaje DECIMAL(3,1) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_pelicula_puntaje
        CHECK (puntaje >= 0 AND puntaje <= 10)
);

CREATE TABLE control_eventos (
    id INT PRIMARY KEY,
    nombre_evento VARCHAR(100) NOT NULL,
    ultima_ejecucion DATETIME NULL
);

INSERT INTO control_eventos
(id, nombre_evento, ultima_ejecucion)
VALUES
(1, 'evento_revision_peliculas', NULL);

DELIMITER //

CREATE EVENT evento_revision_peliculas
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO
BEGIN
    UPDATE control_eventos
    SET ultima_ejecucion = NOW()
    WHERE id = 1;
END //

DELIMITER ;