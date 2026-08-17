-- Las consultas 1 a 4 son de introspeccion de permisos: necesitan
-- acceso a "mysql.role_edges" e "information_schema.table_privileges",
-- por lo que igual que ddl/schema.sql deben ejecutarse como root.
USE campuslands_mysql;

-- 1. Que rol tiene asignado cada usuario
SELECT TO_USER AS usuario, FROM_USER AS rol_asignado
FROM mysql.role_edges
WHERE TO_USER IN ('laura_lectora', 'mario_editor', 'valeria_admin')
ORDER BY usuario;

-- 2. Privilegios exactos que otorga cada rol sobre la tabla
SELECT grantee, privilege_type
FROM information_schema.table_privileges
WHERE table_name = 'jugadores_roles_avanzado'
ORDER BY grantee, privilege_type;

-- 3. Grants completos de cada usuario (incluye su rol por defecto)
SHOW GRANTS FOR 'laura_lectora'@'%';
SHOW GRANTS FOR 'mario_editor'@'%';
SHOW GRANTS FOR 'valeria_admin'@'%';

-- 4. Roles que existen en el servidor y a quien estan asignados
SELECT DISTINCT FROM_USER AS rol
FROM mysql.role_edges
WHERE FROM_USER LIKE 'rol_futsal_%'
ORDER BY rol;

-- 5. Consulta normal sobre los datos que estos roles protegen
-- (puede ejecutarse como 'campus' sin problema)
SELECT nombre, equipo, posicion, goles, precio_ficha, estado
FROM jugadores_roles_avanzado
ORDER BY goles DESC;

-- 6. Valor total de fichas por equipo
SELECT equipo, SUM(precio_ficha) AS valor_total_plantilla
FROM jugadores_roles_avanzado
GROUP BY equipo
ORDER BY valor_total_plantilla DESC;

-- Nota de validacion manual (verificada al preparar esta resolucion):
--   mysql -u laura_lectora -p'Lectora#2026' -e "SELECT * FROM campuslands_mysql.jugadores_roles_avanzado;"
--   -> funciona (el rol lector tiene SELECT).
--   mysql -u laura_lectora -p'Lectora#2026' -e "INSERT INTO campuslands_mysql.jugadores_roles_avanzado (nombre, equipo, posicion, precio_ficha) VALUES ('x','y','ala',1000);"
--   -> falla con: ERROR 1142 (42000): INSERT command denied to user
--   'laura_lectora'@'...' for table 'jugadores_roles_avanzado'
