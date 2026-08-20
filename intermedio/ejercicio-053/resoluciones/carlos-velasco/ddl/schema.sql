CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos;
DROP TABLE IF EXISTS arquitectos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS software_3d;
DROP TABLE IF EXISTS tipos_proyecto;


CREATE TABLE clientes (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(120) NOT NULL UNIQUE
);


CREATE TABLE arquitectos (
    id_arquitecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_arquitecto VARCHAR(100) NOT NULL,
    especialidad VARCHAR(80) NOT NULL
);


CREATE TABLE software_3d (
    id_software INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_software VARCHAR(60) NOT NULL UNIQUE,
    fabricante VARCHAR(80) NOT NULL
);


CREATE TABLE tipos_proyecto (
    id_tipo_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(60) NOT NULL UNIQUE,
    descripcion VARCHAR(200)
);


CREATE TABLE proyectos (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(120) NOT NULL,
    id_cliente INT UNSIGNED NOT NULL,
    id_arquitecto INT UNSIGNED NOT NULL,
    id_software INT UNSIGNED NOT NULL,
    id_tipo_proyecto INT UNSIGNED NOT NULL,
    presupuesto DECIMAL(12, 2) NOT NULL,
    estado ENUM(
        'planificado',
        'en_revision',
        'aprobado',
        'finalizado'
    ) NOT NULL DEFAULT 'planificado',
    fecha_entrega DATE NOT NULL,

    CONSTRAINT chk_proyecto_presupuesto
        CHECK (presupuesto >= 0),

    CONSTRAINT fk_proyecto_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_proyecto_arquitecto
        FOREIGN KEY (id_arquitecto)
        REFERENCES arquitectos(id_arquitecto),

    CONSTRAINT fk_proyecto_software
        FOREIGN KEY (id_software)
        REFERENCES software_3d(id_software),

    CONSTRAINT fk_proyecto_tipo
        FOREIGN KEY (id_tipo_proyecto)
        REFERENCES tipos_proyecto(id_tipo_proyecto)
);