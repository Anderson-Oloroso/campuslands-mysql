# Resolucion - Ejercicio 041 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `jugadores_pingpong_basico` para un club de pingpong con
validaciones simples: `NOT NULL`, `UNIQUE`, `DEFAULT`, `ENUM` y `CHECK`
de rango sobre ranking y partidos ganados.

## Decisiones tecnicas
- `nombre UNIQUE` porque cada jugador debe ser identificable sin
  ambiguedad.
- `CHECK (ranking_puntos BETWEEN 0 AND 3000)` para no permitir puntos
  fuera del rango del sistema de ranking del club.
- `CHECK (partidos_ganados >= 0)`: nunca puede haber partidos ganados
  negativos.
- `ranking_puntos` y `partidos_ganados` tienen `DEFAULT` (1000 y 0)
  para simplificar el registro de un jugador nuevo.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Jugadores activos ordenados por ranking.
2. Jugadores de una categoria especifica.
3. Jugadores con ranking alto (1800 o mas).
4. Ranking promedio por categoria.
5. Top 3 jugadores con mas partidos ganados.
6. Cantidad de jugadores por estado.
