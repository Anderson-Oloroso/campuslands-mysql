# Resolucion - Ejercicio 017 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele el catalogo y las ventas de una tienda de ropa con
`productos_intermedio` y `ventas_intermedio`. Dejé dos productos sin
ninguna venta a proposito (`Pantalon Jogger Negro` y `Chaqueta
Impermeable`) para que el LEFT JOIN tenga sentido: con INNER JOIN esos
productos desaparecerian del reporte.

## Decisiones tecnicas
- `LEFT JOIN` desde `productos_intermedio` hacia `ventas_intermedio` en
  todas las consultas, para no perder productos sin ventas.
- `COALESCE(..., 0)` en los agregados para mostrar 0 en vez de `NULL`
  cuando un producto no tiene ventas.
- `CHECK (cantidad > 0)` y `CHECK (precio > 0)` como restricciones de
  negocio minimas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Todos los productos con sus ventas (o sin ellas).
2. Productos que nunca se han vendido.
3. Unidades e ingresos totales por producto (0 si no se ha vendido).
4. Ingresos totales por categoria.
5. Historial de ventas con detalle de producto.
6. Ranking de productos por unidades vendidas.
