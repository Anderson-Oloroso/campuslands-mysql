# Resolucion - Ejercicio 038 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele equipos y jugadores de una liga de futbol sala aplicando la
Tercera Forma Normal (3FN). El diseño que la violaria (comentado en
`ddl/schema.sql`, no se crea) guardaria `equipo_nombre` y
`equipo_ciudad` directamente en la tabla de jugadores: esos atributos
no dependen de `id_jugador` (la llave primaria), sino de `id_equipo`,
que a su vez es un atributo de la tabla de jugadores. Esa cadena
`id_jugador -> id_equipo -> equipo_ciudad` es la dependencia transitiva
que prohibe la 3FN.

La solucion separa `equipos_futsal_intermedio` de
`jugadores_futsal_intermedio`: cada atributo del equipo vive una sola
vez, y los jugadores solo guardan la referencia (`id_equipo`).

## Beneficio demostrado con datos reales
`dml/inserts.sql` cambia la ciudad de "Rayo Interior" con un solo
`UPDATE` sobre la tabla de equipos. La consulta 6 confirma que sus dos
jugadores muestran la ciudad nueva (`Palmira`) automaticamente al hacer
`JOIN`, sin haber tocado la tabla de jugadores. Con el diseño que viola
3FN, ese mismo cambio habria requerido actualizar la ciudad repetida en
cada fila de jugador del equipo, con riesgo real de dejar alguna
desactualizada.

## Decisiones tecnicas
- `CHECK (goles >= 0)` como restriccion minima de negocio.
- "Pumas Salon" tiene tres jugadores registrados (los demas equipos
  tienen dos), para que la consulta de `HAVING COUNT(*) > 2` tenga un
  resultado real y no vacio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Jugadores con nombre y ciudad del equipo (`JOIN`).
2. Total de goles por equipo.
3. Equipos con mas de dos jugadores registrados (`HAVING`).
4. Jugadores de equipos ubicados en Bogota.
5. Equipo con mayor total de goles acumulado.
6. Jugadores de "Rayo Interior" con la ciudad ya actualizada.
