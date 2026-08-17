-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS arquitectura_3d_roles_db;
USE arquitectura_3d_roles_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS asignacion_roles;
DROP TABLE IF EXISTS proyectos_arquitectura;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS roles;

-- Tabla 1: Roles de Sistema
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 2: Usuarios / Colaboradores
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 3: Proyectos de Arquitectura 3D
CREATE TABLE proyectos_arquitectura (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    presupuesto_usd DECIMAL(12,2) NOT NULL CHECK (presupuesto_usd >= 0),
    m2_superficie DECIMAL(8,2) NOT NULL CHECK (m2_superficie > 0),
    estado ENUM('diseno', 'revision', 'aprobado', 'archivado') DEFAULT 'diseno',
    fecha_creacion DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 4: Asignacion de Roles y Permisos en Proyectos
CREATE TABLE asignacion_roles (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_proyecto INT NOT NULL,
    id_rol INT NOT NULL,
    nivel_acceso ENUM('lectura', 'escritura', 'administrador') DEFAULT 'lectura',
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_proyecto) REFERENCES proyectos_arquitectura(id_proyecto) ON DELETE CASCADE,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
