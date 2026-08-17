# Resolucion - Ejercicio 042 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele el historial de reproducciones de una playlist musical en
`reproducciones_intermedio` y escribi seis consultas de reporte:
resumen por usuario, un reporte con `ROLLUP`, una metrica calculada
(ratio completadas/saltadas), un reporte mensual, un porcentaje sobre
el total, y un ranking.

## Decisiones tecnicas
- La consulta 2 usa `GROUP BY genero WITH ROLLUP` para agregar una
  fila de total general sin tener que escribir una segunda consulta
  con `UNION`.
- La consulta 3 usa `NULLIF(SUM(...), 0)` para evitar division por
  cero si algun usuario nunca salta una cancion.
- La consulta 6 arma un ranking con una subconsulta (contando cuantos
  usuarios tienen mas tiempo escuchado que el actual), sin usar
  funciones de ventana, que se reservan para el ejercicio avanzado.
- `CHECK (duracion_seg > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Resumen por usuario (reproducciones, tiempo total, duracion promedio).
2. Segundos escuchados por genero, con total general (`ROLLUP`).
3. Ratio reproducciones completadas / saltadas por usuario.
4. Reporte mensual de tiempo escuchado.
5. Porcentaje de reproducciones completadas.
6. Ranking de usuarios por tiempo total escuchado.
