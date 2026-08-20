-- Campuslands MySQL - intermedio ejercicio 023
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE firmas_arquitectura (
    firma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_firma VARCHAR(100) NOT NULL UNIQUE,
    pais_sede VARCHAR(50) NOT NULL,
    ciudad_sede VARCHAR(50) NOT NULL
);

CREATE TABLE clientes_arquitectura (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE arquitectos_3d (
    arquitecto_id INT AUTO_INCREMENT PRIMARY KEY,
    firma_id INT NOT NULL,
    nombre_arquitecto VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    especialidad_render VARCHAR(50) NOT NULL CONSTRAINT chk_especialidad CHECK (especialidad_render IN ('ArchViz Exterior', 'ArchViz Interior', 'Recorridos Virtuales', 'BIM 3D')),
    CONSTRAINT fk_arquitectos_firmas 
        FOREIGN KEY (firma_id) REFERENCES firmas_arquitectura(firma_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE proyectos_3d (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    arquitecto_id INT NOT NULL,
    nombre_proyecto VARCHAR(150) NOT NULL,
    tipo_uso VARCHAR(50) NOT NULL CONSTRAINT chk_tipo_uso CHECK (tipo_uso IN ('Residencial', 'Comercial', 'Industrial', 'Urbanístico')),
    area_construccion_m2 DECIMAL(10,2) NOT NULL CONSTRAINT chk_area CHECK (area_construccion_m2 > 0.00),
    presupuesto_render_usd DECIMAL(10,2) NOT NULL CONSTRAINT chk_presupuesto CHECK (presupuesto_render_usd > 0.00),
    fecha_entrega DATE NOT NULL,
    CONSTRAINT fk_proyectos_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_arquitectura(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_proyectos_arquitectos 
        FOREIGN KEY (arquitecto_id) REFERENCES arquitectos_3d(arquitecto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_cliente_proyecto 
        UNIQUE (cliente_id, nombre_proyecto)
);

CREATE TABLE entregables_render (
    entregable_id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    tipo_formato VARCHAR(30) NOT NULL CONSTRAINT chk_formato CHECK (tipo_formato IN ('Renders 4K', 'Video 360', 'Plano 3D Interactive', 'VR Tour')),
    resolucion_px VARCHAR(20) NOT NULL,
    duracion_segundos INT DEFAULT 0 CONSTRAINT chk_duracion CHECK (duracion_segundos >= 0),
    CONSTRAINT fk_entregables_proyectos 
        FOREIGN KEY (proyecto_id) REFERENCES proyectos_3d(proyecto_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);