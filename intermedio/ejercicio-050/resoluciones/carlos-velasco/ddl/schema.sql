CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS citas;
DROP TABLE IF EXISTS tatuadores;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT chk_estado_cliente
        CHECK (estado IN ('activo', 'inactivo'))
);

CREATE TABLE tatuadores (
    id_tatuador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    tarifa_hora DECIMAL(10, 2) NOT NULL,

    CONSTRAINT chk_tarifa_hora
        CHECK (tarifa_hora > 0)
);

CREATE TABLE citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_tatuador INT NOT NULL,
    fecha_cita DATE NOT NULL,
    horas_estimadas DECIMAL(4, 2) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT fk_cita_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_cita_tatuador
        FOREIGN KEY (id_tatuador)
        REFERENCES tatuadores(id_tatuador),

    CONSTRAINT chk_horas_estimadas
        CHECK (horas_estimadas > 0),

    CONSTRAINT chk_precio_cita
        CHECK (precio > 0),

    CONSTRAINT chk_estado_cita
        CHECK (estado IN ('programada', 'realizada', 'cancelada'))
);