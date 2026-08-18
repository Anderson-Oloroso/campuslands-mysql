CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE tatuajes (
    id_tatuaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    nombre_tatuador VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    tamano_cm DECIMAL(5, 2) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_cita DATE NOT NULL,
    estado VARCHAR(30) NOT NULL DEFAULT 'Programada',

    CONSTRAINT chk_tatuajes_tamano_positivo
        CHECK (tamano_cm > 0),

    CONSTRAINT chk_tatuajes_precio_positivo
        CHECK (precio > 0),

    CONSTRAINT chk_tatuajes_estado
        CHECK (estado IN ('Programada', 'Completada', 'Cancelada'))
);