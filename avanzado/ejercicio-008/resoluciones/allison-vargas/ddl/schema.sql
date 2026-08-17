-- DDL: Sistema de Control de Acceso Basado en Roles (RBAC) para Liga de Fútbol Sala
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS usuario_roles;
DROP TABLE IF EXISTS rol_permisos;
DROP TABLE IF EXISTS permisos;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS usuarios_futsal;

-- Entidad 1: Usuarios del Sistema de Fútbol Sala
CREATE TABLE usuarios_futsal (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    estado ENUM('activo', 'inactivo', 'bloqueado') NOT NULL DEFAULT 'activo',
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Entidad 2: Roles disponibles
CREATE TABLE roles (
    rol_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- Entidad 3: Permisos del sistema
CREATE TABLE permisos (
    permiso_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_permiso VARCHAR(50) NOT NULL UNIQUE,
    modulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- Tabla Intermedia: Roles asignados a Permisos
CREATE TABLE rol_permisos (
    rol_id INT NOT NULL,
    permiso_id INT NOT NULL,
    PRIMARY KEY (rol_id, permiso_id),
    FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON DELETE CASCADE,
    FOREIGN KEY (permiso_id) REFERENCES permisos(permiso_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tabla Intermedia: Usuarios asignados a Roles
CREATE TABLE usuario_roles (
    usuario_id INT NOT NULL,
    rol_id INT NOT NULL,
    fecha_asignacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, rol_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios_futsal(usuario_id) ON DELETE CASCADE,
    FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON DELETE CASCADE
) ENGINE=InnoDB;
