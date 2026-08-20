-- Campuslands MySQL - intermedio ejercicio-014
-- Tema: saga de ciencia ficcion (vistas simples)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS naves_espaciales;
DROP TABLE IF EXISTS facciones_scifi;

CREATE TABLE facciones_scifi (
    id_faccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_faccion VARCHAR(60) NOT NULL UNIQUE,
    planeta_capital VARCHAR(50) NOT NULL,
    tipo_gobierno ENUM('Imperio','Federacion','Corporacion','Gremio') NOT NULL
);

CREATE TABLE naves_espaciales (
    id_nave INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nave VARCHAR(70) NOT NULL,
    clase ENUM('Caza Ligero','Corbeta','Fragata','Destructor','Crucero de Batalla','Nave Insignia') NOT NULL,
    id_faccion INT NOT NULL,
    tripulacion_max INT NOT NULL,
    velocidad_curvatura DECIMAL(4,2) NOT NULL,
    nivel_escudos INT NOT NULL DEFAULT 100,
    estado_operativo ENUM('Activo','En Mantenimiento','Destruida') DEFAULT 'Activo',
    FOREIGN KEY (id_faccion) REFERENCES facciones_scifi(id_faccion) ON DELETE CASCADE
);

-- Vista simple asociada al ejercicio
CREATE OR REPLACE VIEW vista_resumen_scifi AS
SELECT 
    p.nombre_faccion AS entidad_principal,
    COUNT(s.id_nave) AS total_asociados,
    COALESCE(AVG(s.tripulacion_max), 0) AS promedio_metrica
FROM facciones_scifi p
LEFT JOIN naves_espaciales s ON p.id_faccion = s.id_faccion
GROUP BY p.id_faccion, p.nombre_faccion;
