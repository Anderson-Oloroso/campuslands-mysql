# Resolucion - Ejercicio 037 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele jugadores, partidos y goles de una liga de futbol aplicando la
Segunda Forma Normal (2FN). El diseño que la violaria (comentado en
`ddl/schema.sql`, no se crea) usaria una clave compuesta
`(id_partido, id_jugador, minuto)` para cada gol, guardando ademas
`jugador_nombre`, `jugador_equipo`, `partido_fecha` y
`partido_estadio` en esa misma fila. Esas columnas no dependen de la
clave completa: `jugador_nombre`/`jugador_equipo` dependen solo de
`id_jugador` y `partido_fecha`/`partido_estadio` solo de `id_partido`.
Eso es una dependencia parcial y obliga a repetir esos datos en cada
gol.

La solucion separa tres tablas: `jugadores_intermedio` y
`partidos_intermedio` (cada una con su propia clave simple) y
`goles_partido_intermedio` como tabla de hechos, con su propia clave
(`id_gol`) y solo columnas que dependen del gol completo (`minuto`,
`tipo_gol`), enlazada a las otras dos por llave foranea.

## Decisiones tecnicas
- `jugadores_intermedio.nombre` es `UNIQUE` para evitar jugadores
  duplicados con el mismo nombre.
- `goles_partido_intermedio` usa su propia clave `id_gol` en vez de una
  clave compuesta, precisamente para no repetir el problema de
  dependencia parcial que se queria evitar.
- `CHECK (minuto BETWEEN 1 AND 120)` como restriccion minima de
  negocio (duracion maxima razonable de un partido con alargue).

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Goles con nombre del jugador y datos del partido (`JOIN` de las 3 tablas).
2. Ranking de goleadores.
3. Partidos con mas de 2 goles registrados (`HAVING`).
4. Goles marcados despues del minuto 80.
5. Jugadores que anotaron en mas de un partido distinto (`COUNT DISTINCT` + `HAVING`).
6. Cantidad de goles por tipo.
