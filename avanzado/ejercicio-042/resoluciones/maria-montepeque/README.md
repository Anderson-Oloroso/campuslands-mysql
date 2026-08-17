# Resolucion - Ejercicio 042 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele el historial de reproducciones de canciones en una playlist
musical (`reproducciones_avanzado`, con los segundos escuchados
subiendo en cada intento, simulando que el usuario se engancha cada
vez mas con la cancion) y escribi seis consultas con funciones de
ventana:

1. **`RANK() OVER`**: posicion de cada usuario segun sus segundos
   totales escuchados en todas sus reproducciones.
2. **`ROW_NUMBER() OVER (PARTITION BY usuario, cancion ...)`**: la
   reproduccion con mas segundos escuchados de cada usuario para cada
   cancion.
3. **`SUM() OVER (... ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)`**:
   segundos escuchados acumulados de cada usuario a lo largo del
   tiempo.
4. **`LAG() OVER`**: compara los segundos escuchados de cada
   reproduccion contra la reproduccion anterior del mismo usuario.
5. **`NTILE(4) OVER`**: divide todas las reproducciones en cuatro
   cuartiles segun los segundos escuchados.
6. **`AVG() OVER (... ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)`**:
   promedio movil de segundos escuchados en las ultimas 2
   reproducciones de cada usuario.

## Decisiones tecnicas
- `PARTITION BY usuario` en la mayoria de las consultas: las funciones
  de ventana comparan cada reproduccion contra las demas reproducciones
  DEL MISMO usuario, no contra todos los usuarios mezclados.
- La consulta 1 combina un CTE (`WITH tiempo_total AS (...)`) con
  `RANK() OVER`, porque la funcion de ventana necesita operar sobre el
  tiempo ya agregado por usuario, no sobre cada fila individual.
- `CHECK (segundos_escuchados > 0)` y `CHECK (duracion_total_seg > 0)`
  como restricciones minimas de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Ranking de usuarios por segundos totales escuchados (`RANK`).
2. Reproduccion con mas segundos escuchados por usuario y cancion (`ROW_NUMBER`).
3. Segundos escuchados acumulados por usuario (suma corrida).
4. Segundos escuchados comparados con la reproduccion anterior (`LAG`).
5. Cuartiles de reproducciones segun los segundos escuchados (`NTILE`).
6. Promedio movil de segundos escuchados en las ultimas 2 reproducciones.
