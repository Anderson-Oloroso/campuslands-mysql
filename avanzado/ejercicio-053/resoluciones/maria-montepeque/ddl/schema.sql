-- Campuslands MySQL - avanzado ejercicio 053
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

DROP TABLE IF EXISTS maquetas_roles_avanzado;

CREATE TABLE maquetas_roles_avanzado (
  id_maqueta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  cliente VARCHAR(120) NOT NULL,
  tipo_construccion ENUM('residencial','comercial','institucional','industrial') NOT NULL,
  presupuesto DECIMAL(12,2) NOT NULL,
  estado ENUM('boceto','modelado','renderizado','entregado') NOT NULL DEFAULT 'boceto',
  CONSTRAINT chk_maquetas_roles_avanzado_presupuesto CHECK (presupuesto > 0)
);

-- ===================================================================
-- Roles: tres niveles de acceso, aplicando el principio de menor
-- privilegio (cada rol tiene solo lo que necesita, ni mas ni menos).
-- ===================================================================
DROP ROLE IF EXISTS 'rol_maquetas3d_lector', 'rol_maquetas3d_editor', 'rol_maquetas3d_admin';
CREATE ROLE 'rol_maquetas3d_lector', 'rol_maquetas3d_editor', 'rol_maquetas3d_admin';

-- Solo lectura: para clientes o visores que consultan el avance.
GRANT SELECT ON campuslands_mysql.maquetas_roles_avanzado TO 'rol_maquetas3d_lector';

-- Lectura y escritura de datos, sin poder borrar ni alterar la estructura:
-- para arquitectos que actualizan el avance de sus maquetas.
GRANT SELECT, INSERT, UPDATE ON campuslands_mysql.maquetas_roles_avanzado TO 'rol_maquetas3d_editor';

-- Control total sobre la tabla: para quien administra el modulo.
GRANT ALL PRIVILEGES ON campuslands_mysql.maquetas_roles_avanzado TO 'rol_maquetas3d_admin';

-- ===================================================================
-- Usuarios de ejemplo, uno por rol. Contraseñas de practica local
-- unicamente (no usar en produccion).
-- ===================================================================
DROP USER IF EXISTS 'renata_lectora'@'%', 'hugo_editor'@'%', 'ines_admin'@'%';
CREATE USER 'renata_lectora'@'%' IDENTIFIED BY 'Lectora#2026';
CREATE USER 'hugo_editor'@'%' IDENTIFIED BY 'Editor#2026';
CREATE USER 'ines_admin'@'%' IDENTIFIED BY 'Admin#2026';

GRANT 'rol_maquetas3d_lector' TO 'renata_lectora'@'%';
GRANT 'rol_maquetas3d_editor' TO 'hugo_editor'@'%';
GRANT 'rol_maquetas3d_admin' TO 'ines_admin'@'%';

-- Sin esto, el rol queda asignado pero INACTIVO al iniciar sesion
-- (el usuario tendria que activarlo el mismo con SET ROLE). Con
-- SET DEFAULT ROLE, el rol se activa automaticamente al conectar.
SET DEFAULT ROLE 'rol_maquetas3d_lector' TO 'renata_lectora'@'%';
SET DEFAULT ROLE 'rol_maquetas3d_editor' TO 'hugo_editor'@'%';
SET DEFAULT ROLE 'rol_maquetas3d_admin' TO 'ines_admin'@'%';
