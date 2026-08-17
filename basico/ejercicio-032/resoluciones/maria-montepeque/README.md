# Resolucion - Ejercicio 032 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `jugadores_br_basico` para un ranking de battle royale
usando varios tipos de datos de MySQL a proposito: `ENUM`, `INT`,
`SMALLINT UNSIGNED`, `BOOLEAN`, `DATE`, `DATETIME` y `TEXT`.

## Decisiones tecnicas
- `plataforma ENUM(...)` para restringir las plataformas validas.
- `partidas_jugadas SMALLINT UNSIGNED` porque nunca es negativo y no
  necesita el rango completo de un `INT`.
- `tiene_pase_battle BOOLEAN` para practicar filtros logicos.
- `ultima_conexion DATETIME` (fecha y hora) frente a `fecha_registro
  DATE` (solo fecha): cada columna usa el tipo que realmente necesita.
- `bio TEXT NULL`: es opcional, no todos los jugadores la completan.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Ranking por kills totales.
2. Jugadores con pase de batalla activo.
3. Promedio de kills por partida jugada.
4. Jugadores por plataforma.
5. Jugadores conectados en los ultimos 3 dias.
6. Jugadores que dejaron una bio.
