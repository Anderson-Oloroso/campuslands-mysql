# Resolucion - Ejercicio 032 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele jugadores y partidas de un ranking de battle royale y cree tres
procedimientos almacenados en `ddl/schema.sql`:

1. **`sp_registrar_partida_br(id_jugador, posicion_final, kills)`**:
   calcula los puntos de la partida segun la posicion final (20 pts
   por victoria, 10 pts top 5, 5 pts top 10, 1 pt el resto) mas 1 punto
   extra por cada kill, inserta la partida y suma los puntos al total
   del jugador, todo dentro de una sola transaccion.
2. **`sp_top_jugadores_br(limite)`**: devuelve los N jugadores con mas
   puntos.
3. **`sp_resumen_jugador_br(nickname)`**: partidas jugadas, kills
   totales, victorias y puntos de un jugador especifico.

`dml/inserts.sql` siembra 5 jugadores y registra 9 partidas llamando a
`sp_registrar_partida_br`, para que el puntaje de cada jugador se
calcule siempre con la misma logica centralizada.

## Decisiones tecnicas
- `ENGINE=InnoDB` en ambas tablas (necesario para la transaccion
  dentro del procedimiento).
- La logica de puntaje vive unicamente en el procedimiento, no en
  cada `INSERT` suelto: asi el calculo nunca puede quedar
  inconsistente entre una partida y otra.
- La consulta 6 de `dql/consultas.sql` verifica que la suma de puntos
  de las partidas de cada jugador coincida exactamente con su
  `puntos_temporada` acumulado.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. `CALL sp_top_jugadores_br(3)`.
2. `CALL sp_resumen_jugador_br('GhostRunner')`.
3. Tabla de puntos completa.
4. Historial de partidas con los puntos de cada una.
5. Promedio de puntos por partida, por jugador.
6. Verificacion de consistencia entre partidas y puntos totales.
