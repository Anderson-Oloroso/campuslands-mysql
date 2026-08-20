CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS ilustraciones;

CREATE TABLE ilustraciones (
    id_ilustracion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    tecnica VARCHAR(50) NOT NULL,
    programa VARCHAR(50) NOT NULL,
    formato VARCHAR(20) NOT NULL,
    resolucion_ancho INT NOT NULL,
    resolucion_alto INT NOT NULL,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT chk_resolucion_ancho
        CHECK (resolucion_ancho > 0),

    CONSTRAINT chk_resolucion_alto
        CHECK (resolucion_alto > 0),

    CONSTRAINT chk_estado_ilustracion
        CHECK (
            estado IN (
                'borrador',
                'en_proceso',
                'finalizada'
            )
        )
);