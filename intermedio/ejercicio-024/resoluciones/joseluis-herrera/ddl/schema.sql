CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE soldadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    experiencia_anios INT NOT NULL,

    CONSTRAINT chk_experiencia_soldador
        CHECK (experiencia_anios >= 0)
);


CREATE TABLE trabajos_soldadura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_trabajo VARCHAR(100) NOT NULL,
    tipo_soldadura VARCHAR(50) NOT NULL,
    material VARCHAR(50) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizado', 'cancelado')
        NOT NULL DEFAULT 'pendiente',
    fecha_trabajo DATE NOT NULL,

    cliente_id INT NOT NULL,
    soldador_id INT NOT NULL,

    CONSTRAINT chk_costo_trabajo
        CHECK (costo >= 0),

    CONSTRAINT fk_trabajo_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id),

    CONSTRAINT fk_trabajo_soldador
        FOREIGN KEY (soldador_id)
        REFERENCES soldadores(id)
);