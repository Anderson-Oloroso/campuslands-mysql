-- Campuslands MySQL - Avanzado Ejercicio 053
-- Roles y Permisos para Sistema de Arquitectura 3D

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza preventiva de usuarios y roles
DROP USER IF EXISTS 'app_admin'@'localhost';
DROP USER IF EXISTS 'app_designer'@'localhost';
DROP USER IF EXISTS 'app_viewer'@'localhost';

DROP ROLE IF EXISTS 'role_arch_admin';
DROP ROLE IF EXISTS 'role_arch_designer';
DROP ROLE IF EXISTS 'role_arch_viewer';

-- Limpieza de tablas
DROP TABLE IF EXISTS render_escenas;
DROP TABLE IF EXISTS proyectos_arquitectura;
DROP TABLE IF EXISTS arquitectos;

-- 1. Tabla: Arquitectos / Diseñadores
CREATE TABLE arquitectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    especialidad ENUM('BIM', 'Interiorismo', 'Exteriorismo', 'Renders Fotorrealistas') NOT NULL,
    nivel ENUM('Junior', 'Mid', 'Senior', 'Lead') NOT NULL DEFAULT 'Mid',
    costo_hora DECIMAL(8,2) NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL DEFAULT 'Activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_costo CHECK (costo_hora > 0)
) ENGINE=InnoDB;

-- 2. Tabla: Proyectos de Arquitectura 3D
CREATE TABLE proyectos_arquitectura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    arquitecto_id INT NOT NULL,
    nombre_proyecto VARCHAR(120) NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    tipo_propiedad ENUM('Residencial', 'Comercial', 'Urbanístico', 'Corporativo') NOT NULL,
    presupuesto_usd DECIMAL(12,2) NOT NULL,
    estado ENUM('Diseño', 'Modelado 3D', 'Renderizado', 'Entregado') NOT NULL DEFAULT 'Diseño',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (arquitecto_id) REFERENCES arquitectos(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_presupuesto_arch CHECK (presupuesto_usd >= 0)
) ENGINE=InnoDB;

-- 3. Tabla: Renders de Escenas Arquitectónicas
CREATE TABLE render_escenas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    nombre_escena VARCHAR(100) NOT NULL,
    resolucion VARCHAR(20) NOT NULL DEFAULT '4K',
    poligonos_totales INT NOT NULL,
    tiempo_render_minutos DECIMAL(6,2) NOT NULL,
    calidad_score DECIMAL(3,1) NOT NULL,
    estado ENUM('Pendiente', 'Procesando', 'Aprobado', 'Rechazado') NOT NULL DEFAULT 'Pendiente',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_arquitectura(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_poligonos_escena CHECK (poligonos_totales > 0),
    CONSTRAINT chk_score CHECK (calidad_score BETWEEN 0.0 AND 10.0)
) ENGINE=InnoDB;

-- ====================================================================
-- GESTIÓN DE ROLES Y PERMISOS DE MYSQL
-- ====================================================================

-- Creación de Roles
CREATE ROLE 'role_arch_admin';
CREATE ROLE 'role_arch_designer';
CREATE ROLE 'role_arch_viewer';

-- Asignación de Privilegios a Roles
-- Admin: Control Total
GRANT ALL PRIVILEGES ON campuslands_mysql.* TO 'role_arch_admin';

-- Diseñador: Lectura y modificación de datos DML
GRANT SELECT, INSERT, UPDATE ON campuslands_mysql.* TO 'role_arch_designer';

-- Visualizador: Únicamente lectura DQL
GRANT SELECT ON campuslands_mysql.* TO 'role_arch_viewer';

-- Creación de Usuarios de Prueba
CREATE USER 'app_admin'@'localhost' IDENTIFIED BY 'AdminPass3D!';
CREATE USER 'app_designer'@'localhost' IDENTIFIED BY 'DesignerPass3D!';
CREATE USER 'app_viewer'@'localhost' IDENTIFIED BY 'ViewerPass3D!';

-- Asignación de Roles a Usuarios
GRANT 'role_arch_admin' TO 'app_admin'@'localhost';
GRANT 'role_arch_designer' TO 'app_designer'@'localhost';
GRANT 'role_arch_viewer' TO 'app_viewer'@'localhost';

-- Definir roles por defecto al iniciar sesión
SET DEFAULT ROLE 'role_arch_admin' TO 'app_admin'@'localhost';
SET DEFAULT ROLE 'role_arch_designer' TO 'app_designer'@'localhost';
SET DEFAULT ROLE 'role_arch_viewer' TO 'app_viewer'@'localhost';

FLUSH PRIVILEGES;