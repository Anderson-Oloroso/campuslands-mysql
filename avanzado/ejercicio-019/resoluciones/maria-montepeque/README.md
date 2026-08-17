# Resolucion - Ejercicio 019 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele instructores (`instructores_avanzado`) y saltos
(`saltos_avanzado`) de una escuela de paracaidismo, y cree dos triggers
en `ddl/schema.sql`:

1. **`trg_saltos_avanzado_after_insert`** (`AFTER INSERT`): si el salto
   se registra como `completado`, suma 1 al contador `total_saltos` del
   instructor; en cualquier caso, deja un registro en
   `bitacora_saltos_avanzado`.
2. **`trg_saltos_avanzado_after_update`** (`AFTER UPDATE`): cuando el
   `estado` de un salto cambia, ajusta el contador del instructor
   (suma si pasa a `completado`, resta si deja de estarlo) y registra
   el cambio en la bitacora.

`dml/inserts.sql` siembra 3 instructores y 8 saltos, y luego hace dos
`UPDATE` (un salto reprogramado que se completa, y uno completado que
se cancela) para demostrar el segundo trigger en accion.

## Decisiones tecnicas
- `ENGINE=InnoDB` en las tres tablas.
- Los triggers son la unica forma de mantener `total_saltos`
  actualizado sin depender de que cada aplicacion recuerde hacerlo:
  el contador nunca puede quedar desincronizado de la tabla de saltos.
- `bitacora_saltos_avanzado` funciona como tabla de auditoria: registra
  automaticamente cada insercion y cada cambio de estado, sin que el
  codigo que inserta o actualiza tenga que saberlo.
- La consulta 5 de `dql/consultas.sql` verifica la consistencia:
  la suma de los contadores debe ser igual a la cantidad real de
  saltos en estado `completado`.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Nota sobre permisos para crear triggers
Con el `docker-compose.yml` del repo, el usuario `campus` tiene todos los
privilegios sobre `campuslands_mysql`, pero **no** el privilegio `SUPER`.
Como el binlog viene activado (`log_bin=ON`) y
`log_bin_trust_function_creators` viene en `OFF`, `CREATE TRIGGER` falla
con `ERROR 1419 (HY000)`. Esto no es un error del script: es una
restriccion de MySQL para proteger la replicacion basada en sentencias.

Para crear los triggers en local, ejecuta una sola vez como `root`:
```bash
mysql -h 127.0.0.1 -P 3307 -u root -proot123 \
  -e "SET GLOBAL log_bin_trust_function_creators = 1;"
```
Con esto, `ddl/schema.sql` crea los triggers sin problema. Ya validé
este flujo completo (con la variable activada) y los contadores y la
bitacora quedan consistentes.

## Consultas incluidas
1. Contador de saltos completados por instructor (mantenido por los triggers).
2. Bitacora completa generada automaticamente.
3. Solo los cambios de estado registrados por el trigger de UPDATE.
4. Saltos completados actuales, con el nombre del instructor.
5. Verificacion de consistencia entre contadores y saltos reales.
6. Ingresos por tipo de salto (solo completados).
