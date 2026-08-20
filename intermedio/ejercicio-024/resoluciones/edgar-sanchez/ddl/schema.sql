-- Campuslands MySQL - intermedio ejercicio 024
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE tipos_soldadura (
    tipo_id INT AUTO_INCREMENT PRIMARY KEY,
    proceso_siglas VARCHAR(10) NOT NULL UNIQUE,
    nombre_proceso VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE soldadores (
    soldador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_soldador VARCHAR(100) NOT NULL,
    codigo_certificacion VARCHAR(30) NOT NULL UNIQUE,
    nivel_experiencia VARCHAR(30) NOT NULL CONSTRAINT chk_nivel_experiencia CHECK (nivel_experiencia IN ('Principiante', 'Intermedio', 'Avanzado', 'Master')),
    fecha_certificacion DATE NOT NULL
);

CREATE TABLE proyectos_estrucutras (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(150) NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL
);

CREATE TABLE inspecciones_soldadura (
    inspeccion_id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    soldador_id INT NOT NULL,
    tipo_id INT NOT NULL,
    fecha_inspeccion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    longitud_junta_cm DECIMAL(8,2) NOT NULL CONSTRAINT chk_longitud CHECK (longitud_junta_cm > 0.00),
    resultado_inspeccion VARCHAR(20) NOT NULL CONSTRAINT chk_resultado CHECK (resultado_inspeccion IN ('Aprobado', 'Rechazado', 'Requiere Reproceso')),
    costo_inspeccion_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_costo_inspeccion CHECK (costo_inspeccion_usd >= 0.00),
    CONSTRAINT fk_inspecciones_proyectos 
        FOREIGN KEY (proyecto_id) REFERENCES proyectos_estrucutras(proyecto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_inspecciones_soldadores 
        FOREIGN KEY (soldador_id) REFERENCES soldadores(soldador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_inspecciones_tipos 
        FOREIGN KEY (tipo_id) REFERENCES tipos_soldadura(tipo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);