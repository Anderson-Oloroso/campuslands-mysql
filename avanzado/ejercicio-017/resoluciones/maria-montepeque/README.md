# Resolucion - Ejercicio 017 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele el inventario (`productos_avanzado`) y las ventas
(`ventas_avanzado`) de una tienda de ropa, y cree tres procedimientos
almacenados en `ddl/schema.sql`:

1. **`sp_registrar_venta(p_id_producto, p_cantidad)`**: valida que el
   producto exista y que haya stock suficiente, inserta la venta y
   descuenta el inventario dentro de una transaccion. Si algo falla,
   hace `ROLLBACK` y propaga el error con `RESIGNAL` (usa
   `DECLARE EXIT HANDLER FOR SQLEXCEPTION`).
2. **`sp_productos_bajo_stock(p_umbral)`**: lista los productos en o
   por debajo de un umbral de stock, para decidir reabastecimiento.
3. **`sp_resumen_ventas()`**: devuelve el numero de ventas, unidades
   vendidas e ingresos totales.

`dml/inserts.sql` siembra el inventario y registra 8 ventas llamando a
`sp_registrar_venta`, todas con stock suficiente para que el script se
ejecute de principio a fin sin interrupciones.

## Decisiones tecnicas
- `ENGINE=InnoDB` en ambas tablas (necesario para transacciones).
- `CHECK (stock >= 0)` y `CHECK (precio > 0)` como restricciones de
  negocio.
- La logica de venta vive en el procedimiento (no en `INSERT`/`UPDATE`
  sueltos) para garantizar que la validacion de stock y el descuento de
  inventario ocurran siempre juntos, de forma atomica.
- El caso de error (`stock insuficiente`) no se ejecuta dentro de
  `inserts.sql` para no interrumpir el script; se documenta como prueba
  manual en `dql/consultas.sql`.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Como probar el manejo de errores
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
  -e "USE campuslands_mysql; CALL sp_registrar_venta(7, 999);"
```
Debe devolver el error controlado `Stock insuficiente para completar la
venta` y dejar el inventario sin cambios.

## Consultas incluidas
1. `CALL sp_productos_bajo_stock(6)`.
2. `CALL sp_resumen_ventas()`.
3. Ingresos totales por categoria.
4. Productos que aun no registran ninguna venta.
5. Historial de ventas con detalle de producto.
6. Producto mas vendido por unidades acumuladas.
