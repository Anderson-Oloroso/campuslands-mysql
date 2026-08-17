# Resolucion - Ejercicio 030 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele 5000 eventos de chat sinteticos de un equipo de streaming
(`eventos_chat_avanzado`, generados con un CTE recursivo x5 en
`dml/inserts.sql`) y practique el ciclo completo de optimizacion:
**medir -> optimizar -> volver a medir**, con `EXPLAIN ANALYZE` en vez
de solo `EXPLAIN`, para tener tiempos reales de ejecucion, no solo el
plan estimado.

## Medicion real: antes y despues del indice
**Antes** (sin indice sobre `streamer`, solo el escaneo completo):
```
-> Table scan on eventos_chat_avanzado
   (cost=500 rows=5000) (actual time=0.419..0.99 rows=5000 loops=1)
-> Filter: streamer = 'NightOwlGaming'
   (cost=500 rows=500) (actual time=0.576..1.5 rows=1000 loops=1)
Tiempo total real: ~1.81 ms
```

**Despues** (con `CREATE INDEX idx_eventos_chat_avanzado_streamer`):
```
-> Covering index lookup on eventos_chat_avanzado
   using idx_eventos_chat_avanzado_streamer (streamer='NightOwlGaming')
   (cost=136 rows=1000) (actual time=0.0344..0.232 rows=1000 loops=1)
Tiempo total real: ~0.31 ms
```

**Mejora real: de 1.81 ms a 0.31 ms, unas 5.8 veces mas rapido.**
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
  ayuda con el filtro por `streamer`, pero el filtro adicional por
  `tipo_evento` todavia necesita revisar filas una por una
  (`Using where`).

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
4. Eventos de un streamer por tipo (ya usando el indice).
5. Distribucion de eventos por streamer.
6. `EXPLAIN` de un filtro compuesto que el indice solo cubre a medias.
