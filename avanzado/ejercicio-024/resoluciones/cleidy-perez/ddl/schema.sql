-- Campuslands MySQL - avanzado ejercicio 024
-- Ejecuta este archivo antes de inserts.sql.
CREATE DATABASE IF NOT EXISTS taller_soldadura;
USE taller_soldadura;

-- 1. Tabla Áreas de Trabajo
CREATE TABLE IF NOT EXISTS areas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    ubicacion VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Tabla Tipos de Bloqueo / Seguridad
CREATE TABLE IF NOT EXISTS tipos_bloqueo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_bloqueo VARCHAR(20) NOT NULL UNIQUE,
    tipo VARCHAR(50) NOT NULL,
    descripcion TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Tabla Equipos de Soldadura
CREATE TABLE IF NOT EXISTS equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_equipo VARCHAR(20) NOT NULL UNIQUE,
    modelo VARCHAR(100) NOT NULL,
    id_area INT NOT NULL,
    estado ENUM('Disponible', 'Bloqueado', 'Mantenimiento') DEFAULT 'Disponible',
    FOREIGN KEY (id_area) REFERENCES areas(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Tabla Ejercicios Prácticos
CREATE TABLE IF NOT EXISTS ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    dificultad VARCHAR(50) NOT NULL,
    tematica VARCHAR(100) NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Tabla Registro de Bloqueos de Seguridad
CREATE TABLE IF NOT EXISTS registros_bloqueo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    id_tipo_bloqueo INT NOT NULL,
    tecnico_responsable VARCHAR(100) NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    fecha_bloqueo DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_desbloqueo DATETIME NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_tipo_bloqueo) REFERENCES tipos_bloqueo(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

