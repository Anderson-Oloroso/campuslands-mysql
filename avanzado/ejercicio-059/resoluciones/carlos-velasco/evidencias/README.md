# Ejercicio 059 - event scheduler para marketplace de accesorios

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `productos`, `movimientos_inventario` y `alertas_inventario`.
- Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `NOT NULL`, `UNIQUE` y `ENUM`.
- Se insertaron 8 productos y 15 movimientos.
- Se creó el evento `ev_revisar_productos_sin_movimiento` con ejecución diaria.
- El evento registra alertas para productos activos sin movimiento durante más de 30 días.
- Las consultas permiten verificar el scheduler, el evento, inventario, movimientos y alertas generadas.