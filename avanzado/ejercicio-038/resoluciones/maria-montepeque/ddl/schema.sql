-- Campuslands MySQL - avanzado ejercicio 038
-- Resolucion: maria-montepeque
-- Tema: futbol sala
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

DROP TABLE IF EXISTS jugadores_roles_avanzado;

CREATE TABLE jugadores_roles_avanzado (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL UNIQUE,
  equipo VARCHAR(60) NOT NULL,
  posicion ENUM('portero','cierre','ala','pivote') NOT NULL,
  goles INT NOT NULL DEFAULT 0,
  precio_ficha DECIMAL(10,2) NOT NULL,
  estado ENUM('activo','lesionado','suspendido') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_jugadores_roles_avanzado_ficha CHECK (precio_ficha > 0),
  CONSTRAINT chk_jugadores_roles_avanzado_goles CHECK (goles >= 0)
);

-- ===================================================================
-- Roles: tres niveles de acceso, aplicando el principio de menor
-- privilegio (cada rol tiene solo lo que necesita, ni mas ni menos).
-- ===================================================================
DROP ROLE IF EXISTS 'rol_futsal_lector', 'rol_futsal_editor', 'rol_futsal_admin';
CREATE ROLE 'rol_futsal_lector', 'rol_futsal_editor', 'rol_futsal_admin';

-- Solo lectura: para aficionados o prensa que consultan la plantilla.
GRANT SELECT ON campuslands_mysql.jugadores_roles_avanzado TO 'rol_futsal_lector';

-- Lectura y escritura de datos, sin poder borrar ni alterar la estructura:
-- para el cuerpo tecnico que actualiza goles, estado o ficha.
GRANT SELECT, INSERT, UPDATE ON campuslands_mysql.jugadores_roles_avanzado TO 'rol_futsal_editor';

-- Control total sobre la tabla: para quien administra el modulo del club.
GRANT ALL PRIVILEGES ON campuslands_mysql.jugadores_roles_avanzado TO 'rol_futsal_admin';

-- ===================================================================
-- Usuarios de ejemplo, uno por rol. Contraseñas de practica local
-- unicamente (no usar en produccion).
-- ===================================================================
DROP USER IF EXISTS 'laura_lectora'@'%', 'mario_editor'@'%', 'valeria_admin'@'%';
CREATE USER 'laura_lectora'@'%' IDENTIFIED BY 'Lectora#2026';
CREATE USER 'mario_editor'@'%' IDENTIFIED BY 'Editor#2026';
CREATE USER 'valeria_admin'@'%' IDENTIFIED BY 'Admin#2026';

GRANT 'rol_futsal_lector' TO 'laura_lectora'@'%';
GRANT 'rol_futsal_editor' TO 'mario_editor'@'%';
GRANT 'rol_futsal_admin' TO 'valeria_admin'@'%';

-- Sin esto, el rol queda asignado pero INACTIVO al iniciar sesion
-- (el usuario tendria que activarlo el mismo con SET ROLE). Con
-- SET DEFAULT ROLE, el rol se activa automaticamente al conectar.
SET DEFAULT ROLE 'rol_futsal_lector' TO 'laura_lectora'@'%';
SET DEFAULT ROLE 'rol_futsal_editor' TO 'mario_editor'@'%';
SET DEFAULT ROLE 'rol_futsal_admin' TO 'valeria_admin'@'%';
