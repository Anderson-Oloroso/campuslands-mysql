# Resolucion - Ejercicio 047 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele productos y ventas de una tienda de ropa y cree tres
procedimientos almacenados en `ddl/schema.sql`:

1. **`sp_registrar_venta_ropa(id_producto, cantidad)`**: calcula el
   total de la venta aplicando un descuento por volumen (10% si la
   cantidad es 5 o mas), inserta la venta y suma el total a los
   ingresos acumulados del producto, todo dentro de una sola
   transaccion.
2. **`sp_top_productos_ropa(limite)`**: devuelve los N productos con
   mas ingresos.
3. **`sp_resumen_producto_ropa(nombre)`**: ventas registradas,
   unidades vendidas e ingresos totales de un producto especifico.

`dml/inserts.sql` siembra 5 productos y registra 9 ventas llamando a
`sp_registrar_venta_ropa`, para que el ingreso de cada producto se
calcule siempre con la misma logica centralizada.

## Decisiones tecnicas
- `ENGINE=InnoDB` en ambas tablas (necesario para la transaccion
  dentro del procedimiento).
- La logica de descuento vive unicamente en el procedimiento, no en
  cada `INSERT` suelto: asi el calculo nunca puede quedar
  inconsistente entre una venta y otra.
- La consulta 6 de `dql/consultas.sql` verifica que la suma de
  `total_venta` de cada producto coincida exactamente con su
  `ingresos_totales` acumulado.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. `CALL sp_top_productos_ropa(3)`.
2. `CALL sp_resumen_producto_ropa('Camiseta Basica Blanca')`.
3. Tabla de ingresos completa.
4. Historial de ventas con el total de cada una.
5. Total promedio por venta, por producto.
6. Verificacion de consistencia entre ventas e ingresos totales.
