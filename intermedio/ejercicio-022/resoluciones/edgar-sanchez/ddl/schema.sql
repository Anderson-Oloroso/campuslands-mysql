-- Campuslands MySQL - intermedio ejercicio 022
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;


CREATE TABLE software_3d (
    software_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_software VARCHAR(50) NOT NULL UNIQUE,
    desarrollador VARCHAR(50) NOT NULL,
    licencia_tipo VARCHAR(30) NOT NULL CONSTRAINT chk_licencia CHECK (licencia_tipo IN ('Gratuito', 'Pago Único', 'Suscripción'))
);

CREATE TABLE estudios_animacion (
    estudio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudio VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    anio_fundacion INT NOT NULL CONSTRAINT chk_fundacion CHECK (anio_fundacion BETWEEN 1900 AND 2026)
);

CREATE TABLE artistas_3d (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    estudio_id INT NOT NULL,
    nombre_artista VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL CONSTRAINT chk_especialidad CHECK (especialidad IN ('Modelado', 'Rigging', 'Animación', 'Texturizado', 'Render/VFX')),
    correo VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT fk_artistas_estudios 
        FOREIGN KEY (estudio_id) REFERENCES estudios_animacion(estudio_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE proyectos_3d (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    estudio_id INT NOT NULL,
    software_id INT NOT NULL,
    titulo_proyecto VARCHAR(150) NOT NULL,
    tipo_produccion VARCHAR(50) NOT NULL CONSTRAINT chk_tipo_prod CHECK (tipo_produccion IN ('Cortometraje', 'Largometraje', 'Comercial', 'Videojuego')),
    duracion_segundos INT NOT NULL CONSTRAINT chk_duracion CHECK (duracion_segundos > 0),
    presupuesto_usd DECIMAL(12,2) NOT NULL CONSTRAINT chk_presupuesto CHECK (presupuesto_usd >= 0.00),
    CONSTRAINT fk_proyectos_estudios 
        FOREIGN KEY (estudio_id) REFERENCES estudios_animacion(estudio_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_proyectos_software 
        FOREIGN KEY (software_id) REFERENCES software_3d(software_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_estudio_proyecto 
        UNIQUE (estudio_id, titulo_proyecto)
);

CREATE TABLE asignaciones_proyecto (
    proyecto_id INT NOT NULL,
    artista_id INT NOT NULL,
    rol_en_proyecto VARCHAR(50) NOT NULL,
    horas_asignadas DECIMAL(6,2) NOT NULL CONSTRAINT chk_horas CHECK (horas_asignadas > 0.00),
    PRIMARY KEY (proyecto_id, artista_id),
    CONSTRAINT fk_asignaciones_proyectos 
        FOREIGN KEY (proyecto_id) REFERENCES proyectos_3d(proyecto_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_asignaciones_artistas 
        FOREIGN KEY (artista_id) REFERENCES artistas_3d(artista_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);