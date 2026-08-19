USE campuslands_mysql;

DROP TABLE IF EXISTS animaciones_3d;

CREATE TABLE animaciones_3d (
    id_animacion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    animador VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    software VARCHAR(50) NOT NULL,
    duracion_segundos DECIMAL(8,2) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    fecha_produccion DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT chk_animacion_duracion
        CHECK (duracion_segundos > 0),

    CONSTRAINT chk_animacion_costo
        CHECK (costo >= 0),

    CONSTRAINT chk_animacion_estado
        CHECK (estado IN ('borrador', 'produccion', 'finalizada'))
);