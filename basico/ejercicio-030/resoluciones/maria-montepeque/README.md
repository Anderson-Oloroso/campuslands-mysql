# Resolucion - Ejercicio 030 (basico)

## Autor
maria-montepeque

## Que hice
Modele una relacion simple 1 a N para un equipo de streaming:
`streamers_basico` y `transmisiones_basico`, donde cada transmision
pertenece a un solo streamer y un streamer puede tener muchas
transmisiones.

## Decisiones tecnicas
- `id_streamer` en `transmisiones_basico` es la unica forma en que se
  expresa la relacion: no se repite el nombre del canal en cada
  transmision, se consulta con `JOIN`.
- `CHECK (seguidores >= 0)`, `CHECK (duracion_min > 0)` y
  `CHECK (espectadores_pico >= 0)` como restricciones minimas.
- `nombre_canal UNIQUE` para no duplicar streamers.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Transmisiones con el nombre del canal.
2. Transmisiones de un streamer especifico.
3. Cantidad de transmisiones por streamer.
4. Pico de espectadores mas alto por streamer.
5. Streamers con mas de 50000 seguidores.
6. Duracion total transmitida por streamer, en horas.
