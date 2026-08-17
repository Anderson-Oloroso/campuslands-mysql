# Resolucion - Ejercicio 019 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele los saltos de una escuela de paracaidismo en
`saltos_intermedio` y escribi seis consultas centradas en `HAVING`,
filtrando resultados ya agrupados (instructores, tipos de salto,
alumnos, fechas) segun distintos umbrales.

## Decisiones tecnicas
- `WHERE estado = 'completado'` antes de agrupar cuando el reporte solo
  debe contar saltos efectivos; `HAVING` despues para filtrar el
  resultado agregado (diferencia clave frente a `WHERE`).
- Un instructor (Mateo Duarte) registra dos saltos el mismo dia
  (2026-02-01) a proposito, para que la consulta 6 tenga un resultado
  real que mostrar.
- `CHECK (altura_metros > 0)` y `CHECK (costo > 0)` como restricciones
  minimas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Instructores con mas de 2 saltos completados.
2. Tipos de salto con ingreso total (completados) mayor a 500.
3. Alumnos repetidores (mas de un salto registrado).
4. Tipos de salto con altura promedio mayor a 3500 metros.
5. Instructores con mas de 700 facturado en saltos completados.
6. Fechas con mas de un salto registrado el mismo dia.
