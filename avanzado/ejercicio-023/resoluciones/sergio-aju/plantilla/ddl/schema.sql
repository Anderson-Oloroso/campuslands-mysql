CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_arquitectura;

-- Tabla principal de proyectos 3D
CREATE TABLE proyectos_arquitectura (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_proyecto VARCHAR(120) NOT NULL,
  tipo ENUM('Residencial', 'Comercial', 'Industrial', 'Paisajismo') NOT NULL,
  costo_estimado DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo', 'revision', 'completado', 'cancelado') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- GESTIÓN DE ROLES Y PERMISOS (DCL)
-- ==========================================

-- 1. Crear roles personalizados
CREATE ROLE IF NOT EXISTS 'rol_consultor_3d';
CREATE ROLE IF NOT EXISTS 'rol_disenador_3d';
CREATE ROLE IF NOT EXISTS 'rol_admin_3d';

-- 2. Asignar permisos al rol de consulta (Solo SELECT)
GRANT SELECT ON campuslands_mysql.proyectos_arquitectura TO 'rol_consultor_3d';

-- 3. Asignar permisos al rol de diseñador (SELECT, INSERT, UPDATE)
GRANT SELECT, INSERT, UPDATE ON campuslands_mysql.proyectos_arquitectura TO 'rol_disenador_3d';

-- 4. Asignar permisos totales al rol de administrador (ALL PRIVILEGES)
GRANT ALL PRIVILEGES ON campuslands_mysql.proyectos_arquitectura TO 'rol_admin_3d';

-- Nota: Para aplicar los cambios de privilegios
FLUSH PRIVILEGES;