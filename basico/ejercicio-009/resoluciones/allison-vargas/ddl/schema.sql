-- DDL: Estructura para gestión de inscripciones de Kickboxing y eliminaciones controladas
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS inscripciones_kickboxing;

CREATE TABLE inscripciones_kickboxing (
    inscripcion_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudiante VARCHAR(80) NOT NULL,
    categoria VARCHAR(40) NOT NULL,
    monto_pago DECIMAL(8,2) NOT NULL CHECK (monto_pago >= 0),
    asistencias INT DEFAULT 0 CHECK (asistencias >= 0),
    estado_inscripcion ENUM('activa', 'cancelada', 'inactiva', 'pendiente') NOT NULL DEFAULT 'pendiente',
    fecha_inscripcion DATE NOT NULL
) ENGINE=InnoDB;
