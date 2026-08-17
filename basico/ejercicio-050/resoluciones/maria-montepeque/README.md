# Resolucion - Ejercicio 050 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `disenos_basico` para el catalogo de un estudio de
tatuajes y escribi seis `SELECT` que cubren distintas herramientas:
`WHERE`, `LIKE`, `DISTINCT`, `IN`, `BETWEEN`, `ORDER BY` y `LIMIT`.

## Decisiones tecnicas
- `estilo ENUM(...)` para restringir los estilos validos del estudio.
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
2. Disenos con "Dragon" en el nombre (`LIKE`).
3. Estilos distintos (`DISTINCT`).
4. Disenos disponibles de tradicional o realismo (`IN`).
5. Disenos con precio en un rango (`BETWEEN`).
6. Top 3 disenos mas caros (`LIMIT`).
