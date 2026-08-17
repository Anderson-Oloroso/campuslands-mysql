# Resolucion - Ejercicio 047 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele productos y ventas de una tienda de ropa con
`productos_intermedio` y `ventas_intermedio`. Deje a "Chaqueta de
Cuero" y "Pantalon Cargo" sin ninguna venta a proposito, para que el
`LEFT JOIN` tenga sentido real: con `INNER JOIN` esos productos
desaparecerian de cualquier reporte.

## Decisiones tecnicas
- `LEFT JOIN` desde `productos_intermedio` hacia `ventas_intermedio`
  en todas las consultas, para no perder productos sin ventas.
- `COALESCE(..., 0)` en los agregados de unidades e ingresos, para que
  un producto sin ventas muestre `0` en vez de `NULL` en esos reportes.
- `CHECK (cantidad > 0)` y `CHECK (precio_unitario > 0)` como
  restricciones minimas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Todos los productos con sus ventas (o sin ellas).
2. Productos que nunca se han vendido.
3. Total de unidades vendidas por producto (0 si nunca se ha vendido).
4. Ingresos totales por producto.
5. Precio unitario promedio de venta por producto.
6. Ranking completo por unidades vendidas, incluyendo los que tienen 0.
