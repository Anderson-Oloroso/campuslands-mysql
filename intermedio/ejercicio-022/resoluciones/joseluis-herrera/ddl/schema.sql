CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE proyectos_animacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(10,2) NOT NULL,
    estado ENUM('en_produccion', 'finalizado', 'pausado') NOT NULL DEFAULT 'en_produccion',
    fecha_inicio DATE NOT NULL,

    CONSTRAINT chk_proyecto_presupuesto
        CHECK (presupuesto >= 0)
);

CREATE TABLE animadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    experiencia_anios INT NOT NULL,

    CONSTRAINT chk_experiencia_animador
        CHECK (experiencia_anios >= 0)
);

CREATE TABLE proyecto_animador (
    proyecto_id INT NOT NULL,
    animador_id INT NOT NULL,
    rol VARCHAR(50) NOT NULL,

    PRIMARY KEY (proyecto_id, animador_id),

    CONSTRAINT fk_proyecto_animador_proyecto
        FOREIGN KEY (proyecto_id)
        REFERENCES proyectos_animacion(id),

    CONSTRAINT fk_proyecto_animador_animador
        FOREIGN KEY (animador_id)
        REFERENCES animadores(id)
);