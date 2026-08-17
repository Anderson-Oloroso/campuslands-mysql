# Resolucion - Ejercicio 017 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `prendas_basico` para el catalogo de una tienda de ropa,
usando varios tipos de datos de MySQL a proposito: `VARCHAR`, `ENUM`,
`DECIMAL`, `SMALLINT UNSIGNED`, `BOOLEAN`, `DATE`, `TEXT` y `DATETIME`.

## Decisiones tecnicas
- `talla ENUM(...)` para restringir valores validos de talla.
- `precio DECIMAL(10,2)` con `CHECK (precio > 0)` para dinero exacto.
- `stock SMALLINT UNSIGNED` porque el inventario nunca es negativo.
- `es_temporada_alta BOOLEAN` para practicar filtros con valores logicos.
- `fecha_ingreso DATE` y `descripcion TEXT` para diferenciar tipos de
  fecha y texto largo opcional.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo por talla y precio.
2. Prendas de temporada alta ordenadas por precio.
3. Precio promedio y stock total por talla.
4. Prendas con bajo stock (menos de 10 unidades).
5. Top 3 prendas mas caras.
6. Prendas ingresadas en el primer trimestre del año.
