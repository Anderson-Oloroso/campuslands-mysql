# Resolucion - Ejercicio 037 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `jugadores_basico` para una liga de futbol y escribi
seis `SELECT` centrados en `ORDER BY`: orden simple ascendente y
descendente, orden combinado con `WHERE`, `LIMIT` para un top N y
orden por multiples columnas.

## Decisiones tecnicas
- `posicion ENUM(...)` para restringir los roles validos dentro de la
  cancha.
- `CHECK (edad > 0)`, `CHECK (salario > 0)` y `CHECK (goles >= 0)` como
  restricciones minimas de negocio.
- Cada consulta usa una variante distinta de `ORDER BY` (una columna,
  varias columnas, ascendente/descendente combinado con `LIMIT`) para
  cubrir varias formas de ordenar resultados.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Jugadores ordenados por goles descendente.
2. Jugadores ordenados por salario ascendente.
3. Jugadores de un equipo ordenados por edad.
4. Top 5 goleadores (`ORDER BY` + `LIMIT`).
5. Jugadores ordenados por posicion y luego por goles descendente.
6. Jugadores activos ordenados por salario descendente.
