# Resolucion - Ejercicio 038 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `jugadores_futsal_basico` para la plantilla de un equipo
de futbol sala y practique cuatro formas distintas de `UPDATE`: por
`PRIMARY KEY`, por condicion sobre varias filas, con una expresion
aritmetica y con `CASE` para una clasificacion masiva.

## Decisiones tecnicas
- `actualizado_en DATETIME ... ON UPDATE CURRENT_TIMESTAMP` para que
  la fecha de modificacion se actualice sola con cada `UPDATE`, sin
  tener que escribirla a mano.
- El `UPDATE` con `CASE` (UPDATE 4) clasifica a cada jugador en
  `estrella`, `regular` o `banca` segun sus goles, en una sola
  sentencia.
- `CHECK (precio_ficha > 0)`, `CHECK (goles >= 0)` y
  `CHECK (tarjetas_amarillas >= 0)` como restricciones minimas de
  negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Estado final de todos los jugadores tras los cuatro `UPDATE`.
2. Jugadores lesionados.
3. Precio de ficha de los goleadores, ya con el incremento del 10%.
4. Jugadores activos sin tarjetas amarillas.
5. Cantidad de jugadores por categoria.
6. Jugadores por equipo con su categoria asignada.
