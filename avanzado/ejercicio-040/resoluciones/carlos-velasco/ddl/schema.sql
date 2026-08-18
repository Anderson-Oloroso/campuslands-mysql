CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS participaciones;
DROP TABLE IF EXISTS corredores;
DROP TABLE IF EXISTS carreras;

CREATE TABLE carreras (
    id_carrera INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    distancia_km DECIMAL(5,2) NOT NULL,
    costo_inscripcion DECIMAL(10,2) NOT NULL,
    fecha_carrera DATE NOT NULL,
    estado ENUM('programada', 'finalizada', 'cancelada')
        NOT NULL DEFAULT 'programada',

    CONSTRAINT chk_distancia_carrera
        CHECK (distancia_km > 0),

    CONSTRAINT chk_costo_inscripcion
        CHECK (costo_inscripcion >= 0)
) ENGINE = InnoDB;


CREATE TABLE corredores (
    id_corredor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    categoria ENUM('juvenil', 'amateur', 'elite') NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_edad_corredor
        CHECK (edad >= 16)
) ENGINE = InnoDB;


CREATE TABLE participaciones (
    id_participacion INT AUTO_INCREMENT PRIMARY KEY,
    id_carrera INT NOT NULL,
    id_corredor INT NOT NULL,
    posicion_final INT NULL,
    tiempo_minutos DECIMAL(6,2) NULL,

    CONSTRAINT fk_participacion_carrera
        FOREIGN KEY (id_carrera)
        REFERENCES carreras(id_carrera),

    CONSTRAINT fk_participacion_corredor
        FOREIGN KEY (id_corredor)
        REFERENCES corredores(id_corredor),

    CONSTRAINT uq_carrera_corredor
        UNIQUE (id_carrera, id_corredor),

    CONSTRAINT chk_posicion_final
        CHECK (posicion_final IS NULL OR posicion_final > 0),

    CONSTRAINT chk_tiempo_minutos
        CHECK (tiempo_minutos IS NULL OR tiempo_minutos > 0)
) ENGINE = InnoDB;