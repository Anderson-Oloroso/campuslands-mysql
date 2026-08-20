-- Campuslands MySQL - Intermedio Ejercicio 052
-- Temática: Animación 3D (Normalización 2FN: Eliminación de Dependencias Parciales)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS asignaciones_render;
DROP TABLE IF EXISTS escenas_3d;
DROP TABLE IF EXISTS proyectos_animacion;
DROP TABLE IF EXISTS animadores;
DROP TABLE IF EXISTS motores_render;

-- Tabla de Animadores / Artistas 3D
CREATE TABLE animadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    especialidad ENUM('Rigging', 'Lighting', 'Keyframe Animation', 'VFX', 'Texturizado') NOT NULL
);

-- Tabla de Motores de Render / Software (Se extrae para cumplir 2FN y evitar redundancia parcial)
CREATE TABLE motores_render (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_engine VARCHAR(50) NOT NULL UNIQUE,
    desarrollador VARCHAR(60) NOT NULL,
    licencia ENUM('Open Source', 'Comercial', 'Suscripción') NOT NULL,
    costo_licencia_usd DECIMAL(8,2) NOT NULL DEFAULT 0.00 CHECK (costo_licencia_usd >= 0.00)
);

-- Tabla de Proyectos de Animación 3D
CREATE TABLE proyectos_animacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_proyecto VARCHAR(100) NOT NULL,
    cliente VARCHAR(80) NOT NULL,
    fps INT NOT NULL DEFAULT 24 CHECK (fps IN (24, 30, 60)),
    fecha_inicio DATE NOT NULL,
    estado ENUM('Preproducción', 'Producción', 'Renderizado', 'Completado') NOT NULL DEFAULT 'Preproducción'
);

-- Tabla de Escenas 3D dentro de un Proyecto
CREATE TABLE escenas_3d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    nombre_escena VARCHAR(80) NOT NULL,
    duracion_cuadros INT NOT NULL CHECK (duracion_cuadros > 0),
    nivel_complejidad ENUM('Baja', 'Media', 'Alta', 'Extrema') NOT NULL DEFAULT 'Media',
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_animacion(id) ON DELETE CASCADE
);

-- Tabla de Asignación de Renders (Relación M:N cumpliendo 2FN)
-- En un diseño NO-2FN, el nombre del software, costo de licencia y desarrollador estarían repetidos en esta tabla compuesta (proyecto_id, animador_id).
-- Para cumplir 2FN, solo se mantienen atributos que dependen de TODA la clave compuesta: (escena_id, animador_id, motor_id).
CREATE TABLE asignaciones_render (
    escena_id INT NOT NULL,
    animador_id INT NOT NULL,
    motor_id INT NOT NULL,
    horas_computo_render DECIMAL(6,2) NOT NULL CHECK (horas_computo_render >= 0.00),
    cuadros_renderizados INT NOT NULL CHECK (cuadros_renderizados >= 0),
    puntuacion_calidad INT CHECK (puntuacion_calidad BETWEEN 1 AND 10),
    PRIMARY KEY (escena_id, animador_id, motor_id),
    FOREIGN KEY (escena_id) REFERENCES escenas_3d(id) ON DELETE CASCADE,
    FOREIGN KEY (animador_id) REFERENCES animadores(id) ON DELETE CASCADE,
    FOREIGN KEY (motor_id) REFERENCES motores_render(id) ON DELETE CASCADE
);