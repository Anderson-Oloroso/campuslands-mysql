USE campuslands_mysql;

DROP TABLE IF EXISTS accesorios;

CREATE TABLE accesorios (
    id_accesorio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    fecha_actualizacion DATE NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_accesorio_precio
        CHECK (precio > 0),

    CONSTRAINT chk_accesorio_fechas
        CHECK (fecha_actualizacion >= fecha_publicacion)
);