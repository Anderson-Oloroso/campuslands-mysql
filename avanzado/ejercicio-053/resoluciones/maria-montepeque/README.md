# Resolucion - Ejercicio 053 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele las maquetas de un estudio de arquitectura 3D
(`maquetas_roles_avanzado`) y cree tres roles de MySQL con distinto
nivel de acceso, aplicando el principio de menor privilegio:

| Rol | Privilegios sobre la tabla |
| --- | --- |
| `rol_maquetas3d_lector` | `SELECT` |
| `rol_maquetas3d_editor` | `SELECT`, `INSERT`, `UPDATE` |
| `rol_maquetas3d_admin` | Todos (`ALL PRIVILEGES`) |

Cada rol se asigno a un usuario de ejemplo (`renata_lectora`,
`hugo_editor`, `ines_admin`) con `SET DEFAULT ROLE`, para que el rol
quede activo automaticamente al iniciar sesion.

## Requisito de privilegios (importante)
Con el `docker-compose.yml` del repo, el usuario `campus` tiene
`ALL PRIVILEGES` sobre `campuslands_mysql`, pero **no** el privilegio
`CREATE USER`/`CREATE ROLE` (ese es un privilegio global de
administracion, no de esquema). Por eso, para este ejercicio en
particular:
- `ddl/schema.sql` (crea la tabla, los roles, los usuarios y los
  `GRANT`) y las consultas 1-4 de `dql/consultas.sql` (que leen
  `mysql.role_edges` e `information_schema.table_privileges`) deben
  ejecutarse como **root**.
- `dml/inserts.sql` (solo inserta datos) si puede ejecutarse con
  `campus` normalmente, porque el `ALL PRIVILEGES` de `campus` sobre el
  esquema aplica a cualquier tabla existente o futura dentro de
  `campuslands_mysql`, la haya creado quien la haya creado.

```bash
mysql -h 127.0.0.1 -P 3307 -u root -proot123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot123 < dql/consultas.sql
```

## Verificacion real del limite de privilegios
Ademas de crear los roles, probe que el limite se cumple de verdad
conectandome como cada usuario:

```bash
mysql -u renata_lectora -p'Lectora#2026' -e "SELECT COUNT(*) FROM campuslands_mysql.maquetas_roles_avanzado;"
# -> funciona, devuelve 8

mysql -u renata_lectora -p'Lectora#2026' -e "INSERT INTO campuslands_mysql.maquetas_roles_avanzado (nombre, cliente, tipo_construccion, presupuesto) VALUES ('x','y','residencial',1000);"
# -> ERROR 1142 (42000): INSERT command denied to user 'renata_lectora'@'...'
#    for table 'maquetas_roles_avanzado'
```

Confirma que el rol de solo lectura efectivamente no puede escribir,
sin depender de que la aplicacion "se porte bien": la base de datos lo
impide.

## Decisiones tecnicas
- Los `GRANT` son sobre la tabla especifica
  (`campuslands_mysql.maquetas_roles_avanzado`), no sobre todo el
  esquema, para practicar permisos realmente acotados.
- `SET DEFAULT ROLE` evita que cada usuario tenga que activar su rol a
  mano con `SET ROLE` despues de conectarse.
- Las contraseñas son solo de practica local, no aptas para produccion.

## Consultas incluidas
1. Rol asignado a cada usuario (`mysql.role_edges`).
2. Privilegios exactos que otorga cada rol sobre la tabla.
3. `SHOW GRANTS` completo de cada usuario.
4. Roles del ejercicio que existen en el servidor.
5. Consulta normal sobre los datos (ejecutable como `campus`).
6. Presupuesto total por tipo de construccion.
