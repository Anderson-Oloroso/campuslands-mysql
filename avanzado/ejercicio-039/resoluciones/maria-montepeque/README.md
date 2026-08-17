# Resolucion - Ejercicio 039 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele el inventario de equipo de un gimnasio de kickboxing
(`inventario_kickboxing_avanzado`) y practique dos mecanismos de
bloqueo de MySQL/InnoDB en `dml/inserts.sql`:

1. **`SELECT ... FOR UPDATE`** dentro de una transaccion: bloquea la
   fila leida hasta el `COMMIT`, para evitar que otra conexion la
   modifique a mitad de un patron leer-modificar-escribir (evita un
   "lost update").
2. **`LOCK TABLES ... WRITE` / `UNLOCK TABLES`**: bloqueo explicito de
   toda la tabla, util para un ajuste masivo donde no se quiere
   permitir ninguna escritura de otras conexiones mientras dura.

## Prueba real de bloqueo entre dos conexiones
No basta con leer la sintaxis: verifique el bloqueo con dos conexiones
simultaneas de verdad contra la misma fila (`Guantes de kickboxing
16oz`, `id_equipo = 2`):

- **Sesion A**: abre una transaccion, hace
  `SELECT ... FOR UPDATE`, espera 4 segundos con `SELECT SLEEP(4)`,
  actualiza el stock y recien ahi hace `COMMIT`.
- **Sesion B** (arrancada 1 segundo despues de A): intenta un
  `UPDATE` sobre esa misma fila.

Resultado real observado: la sesion B quedo esperando desde las
`19:41:01.292` hasta las `19:41:04.315` (unos **3 segundos**), justo
cuando la sesion A hizo `COMMIT`. Esto confirma que `FOR UPDATE`
bloquea la fila para otras conexiones hasta que la transaccion
termina, no es solo documentacion teorica.

## Nota de privilegios
Las consultas 3 y 4 de `dql/consultas.sql` (inspeccionar
`performance_schema.data_locks` e `information_schema.innodb_trx`)
requieren el privilegio `PROCESS`, que el usuario `campus` no tiene.
`ddl/schema.sql` y `dml/inserts.sql` funcionan normalmente con
`campus`; solo `dql/consultas.sql` (por esas dos consultas de
introspeccion) necesita ejecutarse como root:

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot123 < dql/consultas.sql
```

## Decisiones tecnicas
- `ENGINE=InnoDB` (necesario para bloqueos a nivel de fila y
  transacciones; `MyISAM` solo bloquea a nivel de tabla).
- `CHECK (stock >= 0)` como restriccion minima de negocio.
- Las consultas 3 y 4 devuelven 0 filas en una corrida normal y
  secuencial del script, porque para cuando se ejecutan ya no hay
  ninguna transaccion abierta; solo muestran datos si se consultan
  MIENTRAS otra sesion tiene un lock activo, como en la prueba manual
  de arriba.

## Consultas incluidas
1. Estado actual del inventario.
2. Equipo en o por debajo de su stock minimo.
3. Locks activos en el servidor (requiere root).
4. Transacciones activas (requiere root).
5. Equipo con mayor stock.
6. Stock total agrupado por unidad de medida.
