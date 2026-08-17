# Ejercicio 002 - Tipos de datos para Ranking Battle Royale

## Autor
Pablo Lopez

## Descripción

Se creó una tabla llamada `ranking_battle_royale` para almacenar información de jugadores de un ranking Battle Royale.

Se utilizaron diferentes tipos de datos de MySQL como `INT`, `VARCHAR`, `DECIMAL`, `DATE`, `BOOLEAN` y `ENUM`.

## Archivos

- `ddl/schema.sql`: Crea la tabla.
- `dml/inserts.sql`: Inserta 8 jugadores.
- `dql/consultas.sql`: Contiene 5 consultas.

## Cómo ejecutar

1. Ejecutar `schema.sql`.
2. Ejecutar `inserts.sql`.
3. Ejecutar `consultas.sql`.

## Decisiones técnicas

- Se utilizó `AUTO_INCREMENT` para el identificador.
- Se aplicó `NOT NULL` en los campos obligatorios.
- Se usó `ENUM` para controlar el estado del jugador.
- Se emplearon distintos tipos de datos para representar correctamente la información del ranking.

## Resultado

La solución permite consultar rankings, filtrar jugadores, calcular promedios y obtener el Top 5.