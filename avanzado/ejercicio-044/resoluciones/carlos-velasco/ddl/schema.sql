CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP EVENT IF EXISTS ev_actualizar_estado_peliculas;

DROP TABLE IF EXISTS auditoria_estados;
DROP TABLE IF EXISTS peliculas_ciencia_ficcion;

CREATE TABLE peliculas_ciencia_ficcion (
    id_pelicula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    episodio TINYINT UNSIGNED NOT NULL,
    director VARCHAR(120) NOT NULL,
    fecha_estreno DATE NOT NULL,
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    calificacion DECIMAL(3,1) NOT NULL,
    estado ENUM('disponible', 'retirada') NOT NULL DEFAULT 'disponible',

    CONSTRAINT uq_pelicula_episodio
        UNIQUE (episodio),

    CONSTRAINT chk_pelicula_episodio
        CHECK (episodio BETWEEN 1 AND 20),

    CONSTRAINT chk_pelicula_duracion
        CHECK (duracion_minutos BETWEEN 60 AND 300),

    CONSTRAINT chk_pelicula_calificacion
        CHECK (calificacion BETWEEN 0.0 AND 10.0)
);

CREATE TABLE auditoria_estados (
    id_auditoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT UNSIGNED NOT NULL,
    estado_anterior ENUM('disponible', 'retirada') NOT NULL,
    estado_nuevo ENUM('disponible', 'retirada') NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_auditoria_pelicula
        FOREIGN KEY (id_pelicula)
        REFERENCES peliculas_ciencia_ficcion(id_pelicula)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DELIMITER $$

CREATE TRIGGER tr_auditar_cambio_estado
AFTER UPDATE ON peliculas_ciencia_ficcion
FOR EACH ROW
BEGIN
    IF OLD.estado <> NEW.estado THEN
        INSERT INTO auditoria_estados (
            id_pelicula,
            estado_anterior,
            estado_nuevo
        )
        VALUES (
            NEW.id_pelicula,
            OLD.estado,
            NEW.estado
        );
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE EVENT ev_actualizar_estado_peliculas
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    UPDATE peliculas_ciencia_ficcion
    SET estado = 'retirada'
    WHERE estado = 'disponible'
      AND fecha_estreno < CURRENT_DATE - INTERVAL 10 YEAR;
END$$

DELIMITER ;