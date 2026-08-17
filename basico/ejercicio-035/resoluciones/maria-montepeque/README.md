# Resolucion - Ejercicio 035 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `repuestos_basico` para el catalogo de un taller
mecanico de motos y escribi seis `SELECT` que cubren distintas
herramientas: `WHERE`, `LIKE`, `DISTINCT`, `IN`, `BETWEEN`, `ORDER BY`
y `LIMIT`.

## Decisiones tecnicas
- `categoria ENUM(...)` para restringir las categorias validas de
  repuesto.
- `precio DECIMAL(10,2)` con `CHECK (precio > 0)`.
- `disponible BOOLEAN` para practicar filtros logicos ademas de los de
  texto y rango.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Catalogo completo ordenado por precio.
2. Repuestos con "Freno" en el nombre (`LIKE`).
3. Categorias distintas (`DISTINCT`).
4. Repuestos disponibles de motor o frenos (`IN`).
5. Repuestos con precio en un rango (`BETWEEN`).
6. Top 3 repuestos mas caros (`LIMIT`).
