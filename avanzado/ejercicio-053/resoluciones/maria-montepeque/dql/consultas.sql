-- Las consultas 1 a 4 son de introspeccion de permisos: necesitan
-- acceso a "mysql.role_edges" e "information_schema.table_privileges",
-- por lo que igual que ddl/schema.sql deben ejecutarse como root.
USE campuslands_mysql;

-- 1. Que rol tiene asignado cada usuario
SELECT TO_USER AS usuario, FROM_USER AS rol_asignado
FROM mysql.role_edges
WHERE TO_USER IN ('renata_lectora', 'hugo_editor', 'ines_admin')
ORDER BY usuario;

-- 2. Privilegios exactos que otorga cada rol sobre la tabla
SELECT grantee, privilege_type
FROM information_schema.table_privileges
WHERE table_name = 'maquetas_roles_avanzado'
ORDER BY grantee, privilege_type;

-- 3. Grants completos de cada usuario (incluye su rol por defecto)
SHOW GRANTS FOR 'renata_lectora'@'%';
SHOW GRANTS FOR 'hugo_editor'@'%';
SHOW GRANTS FOR 'ines_admin'@'%';

-- 4. Roles del ejercicio que existen en el servidor y a quien estan asignados
SELECT DISTINCT FROM_USER AS rol
FROM mysql.role_edges
WHERE FROM_USER LIKE 'rol_maquetas3d_%'
ORDER BY rol;

-- 5. Consulta normal sobre los datos que estos roles protegen
-- (puede ejecutarse como 'campus' sin problema)
SELECT nombre, cliente, tipo_construccion, presupuesto, estado
FROM maquetas_roles_avanzado
ORDER BY presupuesto DESC;

-- 6. Presupuesto total por tipo de construccion
SELECT tipo_construccion, SUM(presupuesto) AS presupuesto_total
FROM maquetas_roles_avanzado
GROUP BY tipo_construccion
ORDER BY presupuesto_total DESC;
