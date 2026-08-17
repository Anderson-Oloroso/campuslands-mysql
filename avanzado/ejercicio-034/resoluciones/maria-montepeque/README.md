# Resolucion - Ejercicio 034 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele mecanicos (`mecanicos_avanzado`) y servicios
(`servicios_avanzado`) de un garaje de motos, y cree dos triggers en
`ddl/schema.sql`:

1. **`trg_servicios_avanzado_after_insert`** (`AFTER INSERT`): si el
   servicio se registra como `completado`, suma 1 al contador
   `total_servicios` del mecanico; en cualquier caso, deja un registro
   en `bitacora_servicios_avanzado`.
2. **`trg_servicios_avanzado_after_update`** (`AFTER UPDATE`): cuando
   el `estado` de un servicio cambia, ajusta el contador del mecanico
   (suma si pasa a `completado`, resta si deja de estarlo) y registra
   el cambio en la bitacora.

`dml/inserts.sql` siembra 3 mecanicos y 8 servicios, y luego hace dos
`UPDATE` (un servicio en proceso que se completa, y uno completado que
se cancela) para demostrar el segundo trigger en accion.

## Nota sobre permisos para crear triggers
Igual que en el [ejercicio-019](../../../avanzado/ejercicio-019/resoluciones/maria-montepeque/README.md),
con el `docker-compose.yml` del repo el usuario `campus` no tiene el
privilegio `SUPER`, y como el binlog viene activado, `CREATE TRIGGER`
falla con `ERROR 1419 (HY000)` a menos que se ejecute antes, una sola
vez, como `root`:
```bash
mysql -h 127.0.0.1 -P 3307 -u root -proot123 \
  -e "SET GLOBAL log_bin_trust_function_creators = 1;"
```
Con esto, `ddl/schema.sql` crea los triggers sin problema con el
usuario `campus` normal. Ya valide este flujo completo y los
contadores y la bitacora quedan consistentes.

## Decisiones tecnicas
- `ENGINE=InnoDB` en las tres tablas.
- Los triggers son la unica forma de mantener `total_servicios`
  actualizado sin depender de que la aplicacion recuerde hacerlo: el
  contador nunca puede quedar desincronizado de la tabla de servicios.
- `bitacora_servicios_avanzado` registra automaticamente cada
  insercion y cada cambio de estado.
- La consulta 5 de `dql/consultas.sql` verifica la consistencia: la
  suma de los contadores debe ser igual a la cantidad real de
  servicios en estado `completado` (confirmado: 6 = 6).

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Contador de servicios completados por mecanico (mantenido por los triggers).
2. Bitacora completa generada automaticamente.
3. Solo los cambios de estado registrados por el trigger de UPDATE.
4. Servicios completados actuales, con el nombre del mecanico.
5. Verificacion de consistencia entre contadores y servicios reales.
6. Ingresos por tipo de servicio (solo completados).
