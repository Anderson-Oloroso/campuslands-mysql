USE campuslands_mysql;

DROP TABLE IF EXISTS equipos_streaming;
DROP TABLE IF EXISTS categorias_equipo;

CREATE TABLE categorias_equipo (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL
);

CREATE TABLE equipos_streaming (
    id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(60) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    id_categoria INT UNSIGNED NOT NULL,

    CONSTRAINT fk_equipo_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias_equipo(id_categoria),

    CONSTRAINT chk_equipo_precio
        CHECK (precio > 0)
);