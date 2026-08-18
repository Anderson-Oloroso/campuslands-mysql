CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_arquitectura_3d;
DROP TABLE IF EXISTS estados_proyecto;
DROP TABLE IF EXISTS softwares_3d;
DROP TABLE IF EXISTS tipos_proyecto;
DROP TABLE IF EXISTS arquitectos;

CREATE TABLE arquitectos (
    id_arquitecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    experiencia_anios TINYINT UNSIGNED NOT NULL,

    CONSTRAINT chk_experiencia_anios
        CHECK (experiencia_anios <= 50)
);

CREATE TABLE tipos_proyecto (
    id_tipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE softwares_3d (
    id_software INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_software VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE estados_proyecto (
    id_estado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE proyectos_arquitectura_3d (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    id_arquitecto INT UNSIGNED NOT NULL,
    id_tipo INT UNSIGNED NOT NULL,
    id_software INT UNSIGNED NOT NULL,
    id_estado INT UNSIGNED NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,

    CONSTRAINT chk_presupuesto
        CHECK (presupuesto >= 0),

    CONSTRAINT fk_proyecto_arquitecto
        FOREIGN KEY (id_arquitecto)
        REFERENCES arquitectos(id_arquitecto),

    CONSTRAINT fk_proyecto_tipo
        FOREIGN KEY (id_tipo)
        REFERENCES tipos_proyecto(id_tipo),

    CONSTRAINT fk_proyecto_software
        FOREIGN KEY (id_software)
        REFERENCES softwares_3d(id_software),

    CONSTRAINT fk_proyecto_estado
        FOREIGN KEY (id_estado)
        REFERENCES estados_proyecto(id_estado)
);