CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_3d;

CREATE TABLE proyectos_3d (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    tipo_animacion VARCHAR(50) NOT NULL,
    duracion_segundos INT UNSIGNED NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_entrega DATE NOT NULL,
    CONSTRAINT chk_duracion_proyecto CHECK (duracion_segundos > 0),
    CONSTRAINT chk_presupuesto_proyecto CHECK (presupuesto > 0),
    CONSTRAINT chk_estado_proyecto CHECK (
        estado IN ('en_produccion', 'finalizado', 'pendiente')
    )
);