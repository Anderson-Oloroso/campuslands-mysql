# Resolucion - Ejercicio 045 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele 5000 registros de actividad sinteticos de una biblioteca gamer
(`actividad_biblioteca_avanzado`, generados con un CTE recursivo x5 en
`dml/inserts.sql`) y practique el ciclo completo de optimizacion:
**medir -> optimizar -> volver a medir**, con `EXPLAIN ANALYZE` en vez
de solo `EXPLAIN`, para tener tiempos reales de ejecucion, no solo el
plan estimado.

## Medicion real: antes y despues del indice
**Antes** (sin indice sobre `usuario`, solo el escaneo completo):
```
-> Table scan on actividad_biblioteca_avanzado
   (cost=499 rows=4990) (actual time=0.21..0.84 rows=5000 loops=1)
-> Filter: usuario = 'NightOwlGamer'
   (cost=499 rows=499) (actual time=0.876..1.85 rows=1000 loops=1)
Tiempo total real: ~1.93 ms
```

**Despues** (con `CREATE INDEX idx_actividad_biblioteca_avanzado_usuario`):
```
-> Covering index lookup on actividad_biblioteca_avanzado
   using idx_actividad_biblioteca_avanzado_usuario (usuario='NightOwlGamer')
   (cost=135 rows=1000) (actual time=0.0314..0.224 rows=1000 loops=1)
Tiempo total real: ~0.29 ms
```

**Mejora real: de 1.93 ms a 0.29 ms, unas 6.6 veces mas rapido.**
Ademas de ser mas rapido, el indice es "covering": MySQL responde solo
con la informacion del indice, sin tener que volver a la tabla a leer
cada fila.

## Decisiones tecnicas
- Se uso un volumen de 5000 filas (muy por encima de los ~8 registros
  tipicos de otros ejercicios) porque con pocas filas MySQL casi
  siempre prefiere el escaneo completo sin importar si hay un indice
  disponible; la mejora solo se vuelve medible con datos reales.
- El indice se crea a mitad de `dql/consultas.sql`, entre la medicion
  "antes" y la medicion "despues", para que el archivo cuente la
  historia completa en orden: diagnosticar, optimizar, confirmar.
- La consulta 6 muestra el limite de un indice de una sola columna:
  ayuda con el filtro por `usuario` (`type: ref`, `rows: 1000`), pero
  el filtro adicional por `tipo_actividad` todavia necesita revisar
  filas una por una (`Extra: Using where`, `filtered: 25.00`).

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. `EXPLAIN ANALYZE` antes de crear el indice.
2. `CREATE INDEX` (la optimizacion en si).
3. `EXPLAIN ANALYZE` despues de crear el indice.
4. Actividad de un usuario por tipo (ya usando el indice).
5. Distribucion de actividad por usuario.
6. `EXPLAIN` de un filtro compuesto que el indice solo cubre a medias.
