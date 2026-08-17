# Resolucion - Ejercicio 049 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele los saltos de un club de paracaidismo en
`saltos_club_intermedio` y escribi seis consultas centradas en
`HAVING`, filtrando resultados ya agrupados (instructores, tipos de
salto, paracaidistas, fechas) segun distintos umbrales.

## Decisiones tecnicas
- `WHERE estado = 'completado'` antes de agrupar cuando el reporte
  solo debe contar saltos efectivos; `HAVING` despues para filtrar el
  resultado agregado.
- Pedro Ariza registra dos saltos el mismo dia (2026-02-05) a
  proposito, para que la consulta 6 tenga un resultado real que
  mostrar.
- Mateo Rivas salta dos veces, para que la consulta 3 tenga un
  resultado real.
- `CHECK (costo > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Instructores con mas de 2 saltos completados.
2. Tipos de salto con ingreso total (completados) mayor a 400000.
3. Paracaidistas con mas de un salto registrado.
4. Instructores con mas de 800000 facturado en saltos completados.
5. Tipos de salto con costo promedio mayor a 400000.
6. Fechas con mas de un salto registrado el mismo dia.
