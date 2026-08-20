-- Campuslands MySQL - Avanzado Ejercicio 058
-- Manejo de datos JSON para Academia Tech

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza preventiva
DROP TABLE IF EXISTS entregas_proyectos;
DROP TABLE IF EXISTS bootcamps;
DROP TABLE IF EXISTS estudiantes;

-- 1. Tabla: Estudiantes (Guarda perfil e historial en columna JSON)
CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    detalles_perfil JSON NOT NULL, -- Incluye: habilidades, redes, direccion, contacto_emergencia
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_json_perfil CHECK (JSON_VALID(detalles_perfil))
) ENGINE=InnoDB;

-- 2. Tabla: Bootcamps / Módulos Académicos
CREATE TABLE bootcamps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tecnologia_principal VARCHAR(50) NOT NULL,
    malla_curricular JSON NOT NULL, -- Lista de temas y semanas en array/objeto JSON
    duracion_semanas INT NOT NULL,
    CONSTRAINT chk_duracion CHECK (duracion_semanas > 0),
    CONSTRAINT chk_json_malla CHECK (JSON_VALID(malla_curricular))
) ENGINE=InnoDB;

-- 3. Tabla: Entregas de Proyectos y Evaluaciones
CREATE TABLE entregas_proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    bootcamp_id INT NOT NULL,
    nombre_proyecto VARCHAR(100) NOT NULL,
    metadatos_evaluacion JSON NOT NULL, -- Notas por criterio, feedback, fecha_revision, aprobado
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_json_eval CHECK (JSON_VALID(metadatos_evaluacion))
) ENGINE=InnoDB;