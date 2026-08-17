# Resolucion - Ejercicio 032 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele jugadores y partidas de un ranking de battle royale con
`jugadores_intermedio` y `partidas_br_intermedio`. Dejé a
`PixelRaven` y `MysticArrow` sin ninguna partida a proposito, para que
el `LEFT JOIN` tenga sentido real: con `INNER JOIN` esos jugadores
desaparecerian de cualquier reporte.

## Decisiones tecnicas
- `LEFT JOIN` desde `jugadores_intermedio` hacia `partidas_br_intermedio`
  en todas las consultas, para no perder jugadores sin partidas.
- `COALESCE(..., 0)` en los agregados de kills, y `COUNT(CASE WHEN ...)`
  para contar victorias sin que los jugadores sin partidas rompan el
  conteo.
- `CHECK (posicion_final > 0)` y `CHECK (kills >= 0)` como
  restricciones minimas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Todos los jugadores con sus partidas (o sin ellas).
2. Jugadores que nunca han jugado.
3. Total de kills por jugador (0 si no ha jugado).
4. Victorias por jugador.
5. Promedio de daño por jugador.
6. Ranking completo por kills, incluyendo los que tienen 0.
