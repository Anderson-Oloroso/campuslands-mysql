# Resolucion - Ejercicio 049 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele instructores (`instructores_avanzado`) y saltos
(`saltos_avanzado`) de un club de paracaidismo, y cree dos triggers en
`ddl/schema.sql`:

1. **`trg_saltos_avanzado_after_insert`** (`AFTER INSERT`): si el
   salto se registra como `completado`, suma 1 al contador
   `total_saltos` del instructor; en cualquier caso, deja un registro
   en `bitacora_saltos_avanzado`.
2. **`trg_saltos_avanzado_after_update`** (`AFTER UPDATE`): cuando el
   `estado` de un salto cambia, ajusta el contador del instructor
   (suma si pasa a `completado`, resta si deja de estarlo) y registra
   el cambio en la bitacora.

`dml/inserts.sql` siembra 3 instructores y 8 saltos, y luego hace dos
`UPDATE` (un salto en proceso que se completa, y uno completado que se
cancela) para demostrar el segundo trigger en accion.

## Nota sobre permisos para crear triggers
Con el `docker-compose.yml` del repo, el usuario `campus` no tiene el
privilegio `SUPER`, y como el binlog viene activado, `CREATE TRIGGER`
falla. Lo confirme al intentarlo:
```
ERROR 1419 (HY000): You do not have the SUPER privilege and binary
logging is enabled (you *might* want to use the less safe
log_bin_trust_function_creators variable)
```
Se soluciona ejecutando esto una sola vez como **root**:
```bash
mysql -h 127.0.0.1 -P 3307 -u root -proot123 \
  -e "SET GLOBAL log_bin_trust_function_creators = 1;"
```
Con esto, `ddl/schema.sql` crea los triggers sin problema con el
usuario `campus` normal. Ya valide este flujo completo y los
contadores y la bitacora quedan consistentes.

## Decisiones tecnicas
- `ENGINE=InnoDB` en las tres tablas.
- Los triggers son la unica forma de mantener `total_saltos`
  actualizado sin depender de que la aplicacion recuerde hacerlo: el
  contador nunca puede quedar desincronizado de la tabla de saltos.
- `bitacora_saltos_avanzado` registra automaticamente cada insercion y
  cada cambio de estado.
- La consulta 5 de `dql/consultas.sql` verifica la consistencia: la
  suma de los contadores debe ser igual a la cantidad real de saltos
  en estado `completado` (confirmado: 6 = 6).

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u root -proot123 -e "SET GLOBAL log_bin_trust_function_creators = 1;"
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Contador de saltos completados por instructor (mantenido por los triggers).
2. Bitacora completa generada automaticamente.
3. Solo los cambios de estado registrados por el trigger de UPDATE.
4. Saltos completados actuales, con el nombre del instructor.
5. Verificacion de consistencia entre contadores y saltos reales.
6. Ingresos por tipo de salto (solo completados).
