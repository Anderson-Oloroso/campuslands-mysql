-- Campuslands MySQL - Intermedio Ejercicio 058
-- Temática: Academia Tech (Diseño de Tablas Puente / Relaciones M:N)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS entregas_proyectos;
DROP TABLE IF EXISTS matriculas_bootcamp;
DROP TABLE IF EXISTS asignacion_mentores;
DROP TABLE IF EXISTS proyectos;
DROP TABLE IF EXISTS modulos;
DROP TABLE IF EXISTS bootcamps;
DROP TABLE IF EXISTS mentores;
DROP TABLE IF EXISTS estudiantes;

-- 1. Tabla de Estudiantes
CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NULL,
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
    estado ENUM('Activo', 'Graduado', 'Inactivo', 'Suspendido') NOT NULL DEFAULT 'Activo'
);

-- 2. Tabla de Mentores
CREATE TABLE mentores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    anios_experiencia INT NOT NULL CONSTRAINT chk_exp_mentor CHECK (anios_experiencia >= 0),
    tarifa_hora DECIMAL(8,2) NOT NULL CONSTRAINT chk_tarifa_mentor CHECK (tarifa_hora > 0.00)
);

-- 3. Tabla de Bootcamps
CREATE TABLE bootcamps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_bootcamp VARCHAR(80) NOT NULL UNIQUE,
    nivel ENUM('Principiante', 'Intermedio', 'Avanzado') NOT NULL DEFAULT 'Intermedio',
    duracion_semanas INT NOT NULL CONSTRAINT chk_duracion_bootcamp CHECK (duracion_semanas > 0),
    precio_tuicion DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_bootcamp CHECK (precio_tuicion >= 0.00)
);

-- 4. Tabla de Módulos (pertenecientes a Bootcamps)
CREATE TABLE modulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bootcamp_id INT NOT NULL,
    nombre_modulo VARCHAR(80) NOT NULL,
    orden_secuencia INT NOT NULL,
    horas_teoricas INT NOT NULL DEFAULT 20,
    horas_practicas INT NOT NULL DEFAULT 40,
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(id) ON DELETE CASCADE,
    CONSTRAINT uk_bootcamp_modulo UNIQUE (bootcamp_id, orden_secuencia)
);

-- 5. Tabla de Proyectos Evaluables
CREATE TABLE proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modulo_id INT NOT NULL,
    titulo_proyecto VARCHAR(100) NOT NULL,
    ponderacion_porcentaje DECIMAL(5,2) NOT NULL CONSTRAINT chk_ponderacion CHECK (ponderacion_porcentaje BETWEEN 1.00 AND 100.00),
    FOREIGN KEY (modulo_id) REFERENCES modulos(id) ON DELETE CASCADE
);

-- ============================================================================
-- TABLAS PUENTE (RELACIONES MUCHOS A MUCHOS - M:N)
-- ============================================================================

-- 6. TABLA PUENTE 1: Matrículas de Estudiantes en Bootcamps (Estudiantes M:N Bootcamps)
CREATE TABLE matriculas_bootcamp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    bootcamp_id INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT (CURRENT_DATE),
    porcentaje_asistencia DECIMAL(5,2) NOT NULL DEFAULT 100.00 CONSTRAINT chk_asistencia CHECK (porcentaje_asistencia BETWEEN 0.00 AND 100.00),
    estado_matricula ENUM('Cursando', 'Aprobado', 'Reprobado', 'Retirado') NOT NULL DEFAULT 'Cursando',
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(id) ON DELETE CASCADE,
    CONSTRAINT uk_estudiante_bootcamp UNIQUE (estudiante_id, bootcamp_id)
);

-- 7. TABLA PUENTE 2: Asignación de Mentores a Módulos (Mentores M:N Módulos)
CREATE TABLE asignacion_mentores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mentor_id INT NOT NULL,
    modulo_id INT NOT NULL,
    rol_mentor ENUM('Líder de Módulo', 'Soporte Técnico', 'Evaluador') NOT NULL DEFAULT 'Líder de Módulo',
    horas_asignadas INT NOT NULL DEFAULT 10 CONSTRAINT chk_horas_asignadas CHECK (horas_asignadas > 0),
    FOREIGN KEY (mentor_id) REFERENCES mentores(id) ON DELETE CASCADE,
    FOREIGN KEY (modulo_id) REFERENCES modulos(id) ON DELETE CASCADE,
    CONSTRAINT uk_mentor_modulo UNIQUE (mentor_id, modulo_id)
);

-- 8. TABLA PUENTE 3: Entregas de Proyectos por Estudiantes (Estudiantes M:N Proyectos)
CREATE TABLE entregas_proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    proyecto_id INT NOT NULL,
    url_repositorio VARCHAR(255) NOT NULL,
    calificacion DECIMAL(4,2) NULL CONSTRAINT chk_nota_rango CHECK (calificacion BETWEEN 0.00 AND 100.00),
    fecha_entrega DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_entrega ENUM('En Revisión', 'Calificado', 'Rechazado', 'Entregado Fuera de Tiempo') NOT NULL DEFAULT 'En Revisión',
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id) ON DELETE CASCADE,
    CONSTRAINT uk_estudiante_proyecto UNIQUE (estudiante_id, proyecto_id)
);