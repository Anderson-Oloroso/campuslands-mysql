-- Campuslands MySQL - avanzado ejercicio 023
-- Resolucion: maria-montepeque
-- Tema: arquitectura 3D
--
-- IMPORTANTE: este archivo crea ROLES y USUARIOS de MySQL, no solo
-- tablas. Eso requiere el privilegio CREATE USER/CREATE ROLE, que el
-- usuario "campus" del docker-compose de este repo NO tiene (solo
-- tiene ALL PRIVILEGES sobre la base campuslands_mysql, no privilegios
-- globales de administracion). Ejecuta este archivo como root:
--
--   mysql -h 127.0.0.1 -P 3307 -u root -proot123 < ddl/schema.sql
--
-- Ver README.md para el detalle completo de esta restriccion.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_roles_avanzado;

CREATE TABLE proyectos_roles_avanzado (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  cliente VARCHAR(120) NOT NULL,
  tipo_construccion ENUM('residencial','comercial','institucional','industrial') NOT NULL,
  presupuesto DECIMAL(12,2) NOT NULL,
  estado ENUM('boceto','modelado','renderizado','entregado') NOT NULL DEFAULT 'boceto',
  CONSTRAINT chk_proyectos_roles_avanzado_presupuesto CHECK (presupuesto > 0)
);

-- ===================================================================
-- Roles: tres niveles de acceso, aplicando el principio de menor
-- privilegio (cada rol tiene solo lo que necesita, ni mas ni menos).
-- ===================================================================
DROP ROLE IF EXISTS 'rol_arquitectura_lector', 'rol_arquitectura_editor', 'rol_arquitectura_admin';
CREATE ROLE 'rol_arquitectura_lector', 'rol_arquitectura_editor', 'rol_arquitectura_admin';

-- Solo lectura: para clientes o visores que consultan el avance.
GRANT SELECT ON campuslands_mysql.proyectos_roles_avanzado TO 'rol_arquitectura_lector';

-- Lectura y escritura de datos, sin poder borrar ni alterar la estructura:
-- para arquitectos que actualizan el avance de sus proyectos.
GRANT SELECT, INSERT, UPDATE ON campuslands_mysql.proyectos_roles_avanzado TO 'rol_arquitectura_editor';

-- Control total sobre la tabla: para quien administra el modulo.
GRANT ALL PRIVILEGES ON campuslands_mysql.proyectos_roles_avanzado TO 'rol_arquitectura_admin';

-- ===================================================================
-- Usuarios de ejemplo, uno por rol. Contraseñas de practica local
-- unicamente (no usar en produccion).
-- ===================================================================
DROP USER IF EXISTS 'ana_lectora'@'%', 'carlos_editor'@'%', 'sofia_admin'@'%';
CREATE USER 'ana_lectora'@'%' IDENTIFIED BY 'Lectora#2026';
CREATE USER 'carlos_editor'@'%' IDENTIFIED BY 'Editor#2026';
CREATE USER 'sofia_admin'@'%' IDENTIFIED BY 'Admin#2026';

GRANT 'rol_arquitectura_lector' TO 'ana_lectora'@'%';
GRANT 'rol_arquitectura_editor' TO 'carlos_editor'@'%';
GRANT 'rol_arquitectura_admin' TO 'sofia_admin'@'%';

-- Sin esto, el rol queda asignado pero INACTIVO al iniciar sesion
-- (el usuario tendria que activarlo el mismo con SET ROLE). Con
-- SET DEFAULT ROLE, el rol se activa automaticamente al conectar.
SET DEFAULT ROLE 'rol_arquitectura_lector' TO 'ana_lectora'@'%';
SET DEFAULT ROLE 'rol_arquitectura_editor' TO 'carlos_editor'@'%';
SET DEFAULT ROLE 'rol_arquitectura_admin' TO 'sofia_admin'@'%';
