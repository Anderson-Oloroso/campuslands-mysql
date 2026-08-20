USE campuslands_mysql;

DROP VIEW IF EXISTS vista_accesorios_activos;
DROP TABLE IF EXISTS accesorios;

CREATE TABLE accesorios (
    id_accesorio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_accesorio_precio
        CHECK (precio > 0)
);

CREATE VIEW vista_accesorios_activos AS
SELECT
    id_accesorio,
    nombre,
    categoria,
    precio,
    fecha_publicacion
FROM accesorios
WHERE estado = 'activo';