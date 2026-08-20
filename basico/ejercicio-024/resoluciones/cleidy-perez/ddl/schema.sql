-- Campuslands MySQL - basico ejercicio 024
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE trabajos_soldadura (
    id_trabajo INT AUTO_INCREMENT PRIMARY KEY,
    proyecto VARCHAR(120) NOT NULL,
    tipo_soldadura ENUM('SMAW', 'GMAW/MIG', 'GTAW/TIG', 'FCAW') NOT NULL,
    material VARCHAR(50) NOT NULL,
    inspector VARCHAR(100) NOT NULL,
    estado_inspeccion ENUM('Aprobado', 'Rechazado', 'Pendiente') DEFAULT 'Pendiente',
    defectuosa BOOLEAN DEFAULT FALSE,
    fecha_inspeccion DATE NOT NULL
);