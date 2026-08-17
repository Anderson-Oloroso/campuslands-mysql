-- Las consultas 1 a 4 son de introspeccion de permisos: necesitan
-- acceso a "mysql.role_edges" e "information_schema.table_privileges",
-- por lo que igual que ddl/schema.sql deben ejecutarse como root.
USE campuslands_mysql;

-- 1. Que rol tiene asignado cada usuario
SELECT TO_USER AS usuario, FROM_USER AS rol_asignado
FROM mysql.role_edges
WHERE TO_USER IN ('ana_lectora', 'carlos_editor', 'sofia_admin')
ORDER BY usuario;

-- 2. Privilegios exactos que otorga cada rol sobre la tabla
SELECT grantee, privilege_type
FROM information_schema.table_privileges
WHERE table_name = 'proyectos_roles_avanzado'
ORDER BY grantee, privilege_type;

-- 3. Grants completos de cada usuario (incluye su rol por defecto)
SHOW GRANTS FOR 'ana_lectora'@'%';
SHOW GRANTS FOR 'carlos_editor'@'%';
SHOW GRANTS FOR 'sofia_admin'@'%';

-- 4. Roles que existen en el servidor y a quien estan asignados
SELECT DISTINCT FROM_USER AS rol
FROM mysql.role_edges
WHERE FROM_USER LIKE 'rol_arquitectura_%'
ORDER BY rol;

-- 5. Consulta normal sobre los datos que estos roles protegen
-- (puede ejecutarse como 'campus' sin problema)
SELECT nombre, cliente, tipo_construccion, presupuesto, estado
FROM proyectos_roles_avanzado
ORDER BY presupuesto DESC;

-- 6. Presupuesto total por tipo de construccion
SELECT tipo_construccion, SUM(presupuesto) AS presupuesto_total
FROM proyectos_roles_avanzado
GROUP BY tipo_construccion
ORDER BY presupuesto_total DESC;

-- Nota de validacion manual (verificada al preparar esta resolucion):
--   mysql -u ana_lectora -p'Lectora#2026' -e "SELECT * FROM campuslands_mysql.proyectos_roles_avanzado;"
--   -> funciona (el rol lector tiene SELECT).
--   mysql -u ana_lectora -p'Lectora#2026' -e "INSERT INTO campuslands_mysql.proyectos_roles_avanzado (nombre, cliente, tipo_construccion, presupuesto) VALUES ('x','y','residencial',1000);"
--   -> falla con: ERROR 1142 (42000): INSERT command denied to user
--   'ana_lectora'@'...' for table 'proyectos_roles_avanzado'
