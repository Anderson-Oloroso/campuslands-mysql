# Resolucion - Ejercicio 036 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele encargos de un concesionario de autos hiperdeportivos en
`encargos_avanzado` (24 filas, mas de lo usual para que el
optimizador tenga un dataset real sobre el que decidir) con dos
indices, y escribi seis consultas con `EXPLAIN`/`EXPLAIN ANALYZE` para
leer e interpretar el plan de ejecucion. Todo lo que sigue son los
resultados **reales** que obtuve al ejecutar `dql/consultas.sql`, no
una prediccion:

1. `WHERE marca = 'Ferrari'` → `type: ref`, `key:
   idx_encargos_avanzado_marca_fecha`. Usa el indice directamente.
2. `WHERE UPPER(marca) = 'FERRARI'` → `type: ALL`, `key: NULL`.
   Envolver la columna indexada en una funcion impide que MySQL use el
   indice: tendria que calcular `UPPER(marca)` fila por fila antes de
   poder comparar, asi que prefiere el escaneo completo.
3. `WHERE marca = ... AND fecha_encargo BETWEEN ...` → `type: range`,
   usa el indice compuesto completo (`Using index condition`).
4. `WHERE marca = ... ORDER BY fecha_encargo` → `type: ref`, sin
   `Using filesort`: como el indice ya trae `(marca, fecha_encargo)`
   en ese orden, las filas de una misma marca ya salen ordenadas por
   fecha.
5. `WHERE marca = ... ORDER BY cliente` → `type: ref` pero con
   `Extra: Using filesort`: `cliente` no forma parte de este indice,
   asi que MySQL filtra usando el indice y despues ordena aparte.
6. `EXPLAIN ANALYZE` sobre un `GROUP BY cliente` confirma con tiempos
   reales que se usa `idx_encargos_avanzado_cliente` (`Index lookup
   ... rows=5 loops=1`).

## Decisiones tecnicas
- Indice compuesto `(marca, fecha_encargo)`: cubre tanto el filtro por
  marca solo como el filtro por marca + rango de fechas, y ademas
  evita el `filesort` cuando se ordena por fecha dentro de una misma
  marca.
- Indice simple en `cliente` para reportes agregados por cliente.
- Se uso un volumen de 24 filas (en vez de las 8 tipicas) para que el
  optimizador tenga motivos reales para preferir el indice sobre un
  escaneo completo; con muy pocas filas MySQL suele ignorar el indice
  aunque exista, porque el escaneo completo sale mas barato.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. `EXPLAIN` de un filtro directo por marca (usa el indice).
2. `EXPLAIN` del mismo filtro envuelto en `UPPER()` (no usa el indice).
3. `EXPLAIN` de marca + rango de fechas (`type: range`).
4. `EXPLAIN` de marca + `ORDER BY fecha_encargo` (sin filesort).
5. `EXPLAIN` de marca + `ORDER BY cliente` (con filesort).
6. `EXPLAIN ANALYZE` de un `GROUP BY cliente` con tiempos reales.
