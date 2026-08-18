CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE arquitectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    experiencia_anios INT NOT NULL,

    CONSTRAINT chk_arquitecto_experiencia
        CHECK (experiencia_anios >= 0)
);

CREATE TABLE proyectos_arquitectura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_proyecto VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    estado ENUM('planificado', 'en_progreso', 'finalizado', 'pausado')
        NOT NULL DEFAULT 'planificado',
    fecha_inicio DATE NOT NULL,
    cliente_id INT NOT NULL,
    arquitecto_id INT NOT NULL,

    CONSTRAINT chk_proyecto_presupuesto
        CHECK (presupuesto >= 0),

    CONSTRAINT fk_proyecto_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id),

    CONSTRAINT fk_proyecto_arquitecto
        FOREIGN KEY (arquitecto_id)
        REFERENCES arquitectos(id)
);