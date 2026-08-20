CREATE DATABASE IF NOT EXISTS sci_fi_saga_db;
USE sci_fi_saga_db;

CREATE TABLE facciones_estelares (
    id_faccion INT PRIMARY KEY AUTO_INCREMENT,
    nombre_faccion VARCHAR(60) NOT NULL UNIQUE,
    lider_faccion VARCHAR(80) NOT NULL,
    sistema_origen VARCHAR(60) NOT NULL
);

CREATE TABLE misiones_espaciales (
    id_mision INT PRIMARY KEY AUTO_INCREMENT,
    codigo_mision VARCHAR(20) NOT NULL UNIQUE,
    nombre_mision VARCHAR(100) NOT NULL,
    id_faccion INT,
    nivel_peligrosidad INT NOT NULL,
    duracion_meses INT NOT NULL,
    estado_mision ENUM('planificada', 'en_curso', 'completada', 'abortada') DEFAULT 'planificada',
    FOREIGN KEY (id_faccion) REFERENCES facciones_estelares(id_faccion),
    CONSTRAINT chk_nivel_peligro CHECK (nivel_peligrosidad >= 1 AND nivel_peligrosidad <= 10),
    CONSTRAINT chk_duracion_meses CHECK (duracion_meses > 0)
);

-- Creacion de vistas simples 
CREATE VIEW vw_misiones_activas AS
SELECT 
    m.codigo_mision,
    m.nombre_mision,
    f.nombre_faccion AS faccion,
    m.nivel_peligrosidad,
    m.duracion_meses,
    m.estado_mision
FROM misiones_espaciales m
JOIN facciones_estelares f ON m.id_faccion = f.id_faccion
WHERE m.estado_mision IN ('planificada', 'en_curso');

CREATE VIEW vw_resumen_facciones AS
SELECT 
    f.nombre_faccion AS faccion,
    f.sistema_origen,
    COUNT(m.id_mision) AS total_misiones,
    ROUND(AVG(m.nivel_peligrosidad), 1) AS peligrosidad_promedio,
    SUM(m.duracion_meses) AS meses_totales_operacion
FROM facciones_estelares f
LEFT JOIN misiones_espaciales m ON f.id_faccion = m.id_faccion
GROUP BY f.id_faccion, f.nombre_faccion, f.sistema_origen;