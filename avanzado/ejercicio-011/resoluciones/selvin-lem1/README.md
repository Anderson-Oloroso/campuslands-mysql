# Resolucion - Ejercicio 011 Intermedio - Selvin Lem

## Tematica
Pingpong

## Analisis breve
Se practica CHECK con tres restricciones sobre partidos_pingpong:
rango valido de sets (0 a 5) para local y visitante, y una
validacion cruzada para evitar que un jugador se enfrente a si
mismo (jugador_local <> jugador_visitante). Se incluyen partidos
programados y suspendidos con sets en 0 como caso limite.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear partidos_pingpong.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas.
