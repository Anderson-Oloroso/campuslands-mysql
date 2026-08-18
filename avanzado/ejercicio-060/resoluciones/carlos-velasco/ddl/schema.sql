CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS equipo_streaming;

CREATE TABLE equipo_streaming (
    id_integrante INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    usuario_streaming VARCHAR(50) NOT NULL UNIQUE,
    plataforma VARCHAR(30) NOT NULL,
    rol VARCHAR(40) NOT NULL,
    seguidores INT UNSIGNED NOT NULL DEFAULT 0,
    horas_stream_mes DECIMAL(6,2) NOT NULL DEFAULT 0.00,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    fecha_ingreso DATE NOT NULL,

    CONSTRAINT chk_seguidores
        CHECK (seguidores >= 0),

    CONSTRAINT chk_horas_stream
        CHECK (horas_stream_mes >= 0),

    CONSTRAINT chk_rol
        CHECK (rol IN (
            'streamer',
            'moderador',
            'editor',
            'manager'
        ))
);

CREATE INDEX idx_equipo_plataforma_estado
ON equipo_streaming (plataforma, estado);

CREATE INDEX idx_equipo_rol
ON equipo_streaming (rol);

CREATE INDEX idx_equipo_seguidores
ON equipo_streaming (seguidores);

CREATE INDEX idx_equipo_fecha_ingreso
ON equipo_streaming (fecha_ingreso);