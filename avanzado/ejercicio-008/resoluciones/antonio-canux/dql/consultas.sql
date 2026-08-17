-- Gestion de Roles, Usuarios y Permisos.
USE campuslands_mysql;

-- Limpieza previa para evitar errores si el script se ejecuta multiples veces
DROP ROLE IF EXISTS 'rol_cuerpo_tecnico', 'rol_junta_directiva';
DROP USER IF EXISTS 'entrenador_fs'@'localhost', 'gerente_fs'@'localhost';

-- 1. Creacion de los Roles para separar el acceso a datos deportivos (publicos) y financieros (sensibles)
CREATE ROLE 'rol_cuerpo_tecnico', 'rol_junta_directiva';

-- 2. Asignacion de permisos (GRANT) a los roles creados
GRANT SELECT ON campuslands_mysql.avanzado_ejercicio_008_jugadores TO 'rol_cuerpo_tecnico';
GRANT ALL PRIVILEGES ON campuslands_mysql.avanzado_ejercicio_008_jugadores TO 'rol_junta_directiva';
GRANT ALL PRIVILEGES ON campuslands_mysql.avanzado_ejercicio_008_contratos TO 'rol_junta_directiva';

-- 3. Creacion de usuarios del sistema y vinculacion a sus respectivos roles (con asignacion por defecto)
CREATE USER 'entrenador_fs'@'localhost' IDENTIFIED BY 'pass_tecnico_123';
CREATE USER 'gerente_fs'@'localhost' IDENTIFIED BY 'pass_gerente_123';
GRANT 'rol_cuerpo_tecnico' TO 'entrenador_fs'@'localhost';
GRANT 'rol_junta_directiva' TO 'gerente_fs'@'localhost';
SET DEFAULT ROLE ALL TO 'entrenador_fs'@'localhost', 'gerente_fs'@'localhost';

-- 4. Verificacion de los permisos efectivos asignados al usuario 'entrenador_fs'
SHOW GRANTS FOR 'entrenador_fs'@'localhost';

-- 5. Revocacion de un permiso (REVOKE): Quitar a la directiva el permiso de eliminar contratos
REVOKE DELETE ON campuslands_mysql.avanzado_ejercicio_008_contratos FROM 'rol_junta_directiva';
SHOW GRANTS FOR 'rol_junta_directiva';