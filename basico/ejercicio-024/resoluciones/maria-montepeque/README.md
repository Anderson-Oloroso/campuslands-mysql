# Resolucion - Ejercicio 024 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `pedidos_soldadura_basico` para un taller de soldadura y
practique tres formas de `DELETE` controlado: por `PRIMARY KEY`, por
condicion multi-fila con `WHERE` explicito, y con `ORDER BY` + `LIMIT`
como red de seguridad adicional.

## Decisiones tecnicas
- Cada `DELETE` en `dml/inserts.sql` va acompañado de un comentario con
  el `SELECT` equivalente que se deberia correr antes, para verificar
  que se va a borrar exactamente lo esperado.
- Ningun `DELETE` se ejecuta sin `WHERE`: el ejercicio es justamente
  sobre borrar con criterio, no sobre vaciar tablas.
- `ORDER BY ... LIMIT 1` en el tercer `DELETE` limita el radio de
  accion aunque el `WHERE` hubiera coincidido con mas filas de las
  esperadas.
- `CHECK (costo > 0)` como restriccion minima de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Estado final de la tabla, tras los tres `DELETE`.
2. Confirmar que no quedan pedidos cancelados.
3. Confirmar que el registro de prueba ya no existe.
4. Pedidos completados, ordenados por costo.
5. Ingresos por tipo de soldadura (solo completados).
6. Pedidos pendientes o en proceso.
