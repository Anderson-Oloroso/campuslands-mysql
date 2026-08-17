# Resolucion - Ejercicio 047 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `productos_ropa_basico` para una tienda de ropa usando
varios tipos de datos de MySQL a proposito: `ENUM`, `DECIMAL`,
`SMALLINT UNSIGNED`, `BOOLEAN`, `DATE`, `DATETIME` y `TEXT`.

## Decisiones tecnicas
- `categoria ENUM(...)` para restringir las categorias validas del
  catalogo.
- `stock SMALLINT UNSIGNED` porque nunca es negativo y no necesita el
  rango completo de un `INT`.
- `en_oferta BOOLEAN` para practicar filtros logicos.
- `ultima_venta DATETIME` (fecha y hora) frente a `fecha_ingreso DATE`
  (solo fecha): cada columna usa el tipo que realmente necesita.
- `descripcion TEXT NULL`: es opcional, no todos los productos la
  tienen.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado ordenado por precio.
2. Productos actualmente en oferta.
3. Valor total de inventario por producto.
4. Cantidad de productos por categoria.
5. Productos vendidos en los ultimos 3 dias.
6. Productos que tienen una descripcion.
