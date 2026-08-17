# Resolucion - Ejercicio 016 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele el inventario de ingredientes de un restaurante de comida urbana
(`ingredientes_avanzado`), los pedidos (`pedidos_avanzado`) y sus movimientos
de stock (`movimientos_inventario_avanzado`). En `dml/inserts.sql` demuestro
tres escenarios de transacciones:

1. **Pedido exitoso** (Laura): `START TRANSACTION` ... `COMMIT`. Descuenta pan
   y carne de res y queda todo registrado.
2. **Pedido con SAVEPOINT** (Carlos): confirma los tacos, pero antes de
   aplicar el consumo del postre crea un `SAVEPOINT antes_de_postre`. El
   cliente se arrepiente del postre y se hace `ROLLBACK TO SAVEPOINT`, asi
   se deshace solo ese tramo sin perder los tacos ya aplicados. Luego
   `COMMIT`.
3. **Pedido cancelado** (Ana): antes de confirmar, el cliente cancela todo el
   pedido. Se hace `ROLLBACK` completo y no queda ningun rastro en las
   tablas (ni el pedido ni el movimiento de inventario).

## Decisiones tecnicas
- `ENGINE=InnoDB` en las tres tablas (necesario para soportar transacciones).
- `CHECK (stock_actual >= 0)` en ingredientes para evitar inventario negativo.
- `movimientos_inventario_avanzado` guarda un historial auditable de cada
  entrada o salida de stock, ligado al pedido que la origino.
- Se usa `LAST_INSERT_ID()` guardado en variables de sesion (`@id_pedido_1`,
  `@id_pedido_2`, `@id_pedido_3`) para enlazar cada movimiento con su pedido
  dentro de la misma transaccion.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Estado final del inventario (menor stock primero).
2. Ingredientes por debajo del stock minimo.
3. Pedidos confirmados tras las transacciones (deben ser 2: Laura y Carlos).
4. Historial de movimientos de inventario por pedido.
5. Total de salidas de inventario por ingrediente.
6. Verificacion de que el pedido cancelado de Ana no dejo rastro.
