# Resolucion - Ejercicio 040 (avanzado)

## Autor
maria-montepeque

## Que hice
Cree la tabla `resultados_avanzado` con los resultados de corredores
en distintas carreras urbanas y practique un backup logico completo
con `mysqldump`. El proceso esta documentado paso a paso en
`dql/consultas.sql`, y lo verifique de verdad (no es solo teoria):

1. Genere el backup de la tabla:
   ```bash
   mysqldump -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
     --single-transaction campuslands_mysql resultados_avanzado \
     > backup_resultados.sql
   ```
2. Simule una perdida de datos real:
   ```bash
   mysql -u campus -pcampus123 -e "DROP TABLE campuslands_mysql.resultados_avanzado;"
   ```
3. Restaure desde el backup:
   ```bash
   mysql -u campus -pcampus123 campuslands_mysql < backup_resultados.sql
   ```

**Resultado real observado**: la tabla tenia 8 filas antes del backup;
despues del `DROP TABLE`, consultarla daba
`ERROR 1146 (42S02): Table 'campuslands_mysql.resultados_avanzado'
doesn't exist`; despues de restaurar el backup, la tabla volvio a
existir con exactamente las mismas 8 filas.

## Advertencia real de mysqldump (no es un error fatal)
Con MySQL 8.4 (la version del `docker-compose` de este repo), el
cliente `mysqldump` intenta ademas volcar informacion de tablespaces y
muestra esta advertencia en la salida de error estandar, aunque el
backup de la tabla se genera igual y queda completo:
```
mysqldump: Error: 'Access denied; you need (at least one of) the
PROCESS privilege(s) for this operation' when trying to dump tablespaces
```
Lo confirme revisando que el archivo generado si contenia la
estructura completa de la tabla, el `INSERT` con las 8 filas, y
terminaba con `-- Dump completed on ...` (la marca que deja `mysqldump`
cuando termina sin errores reales).

## Decisiones tecnicas
- `--single-transaction` en el `mysqldump`: evita bloquear la tabla
  InnoDB mientras dura la exportacion, tomando una foto consistente
  sin frenar otras conexiones.
- El archivo de backup generado durante la validacion **no** se subio
  al repositorio, siguiendo la regla del proyecto de no subir dumps.
- `CHECK (tiempo_minutos > 0)` y `CHECK (posicion > 0)` como
  restricciones minimas de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo de resultados.
2. Resultados por categoria.
3. Ganadores (posicion 1) de cada carrera.
4. Corredor con el mejor tiempo registrado.
5. Tiempo promedio por categoria.
6. Resultados de la Maraton de Bogota.

Ademas, comentarios con el procedimiento completo de backup logico y
restauracion (backup de una tabla, backup de la base completa).
