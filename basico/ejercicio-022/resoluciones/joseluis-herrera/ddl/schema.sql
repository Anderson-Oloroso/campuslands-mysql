CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE proyectos_animacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    duracion_minutos DECIMAL(6,2) NOT NULL,
    presupuesto DECIMAL(10,2) NOT NULL,
    estado ENUM('en_produccion', 'finalizado', 'pausado') NOT NULL DEFAULT 'en_produccion',
    fecha_inicio DATE NOT NULL,

    CONSTRAINT chk_duracion_positiva
        CHECK (duracion_minutos > 0),

    CONSTRAINT chk_presupuesto_no_negativo
        CHECK (presupuesto >= 0)
);