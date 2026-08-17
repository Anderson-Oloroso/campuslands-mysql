# Resolucion - Ejercicio 044 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `peliculas_saga_basico` para una saga de ciencia ficcion
y escribi seis consultas centradas en fechas basicas: `DATEDIFF`,
`BETWEEN` sobre fechas, extraccion con `YEAR`/`MONTH`, `DATE_ADD` y
ordenamientos por fecha.

## Decisiones tecnicas
- `CHECK (fecha_estreno >= fecha_inicio_rodaje)`: el estreno nunca
  puede estar programado antes de que empiece el rodaje.
- La consulta 4 usa `DATE_ADD` para simular un margen de 30 dias extra
  sobre la fecha de estreno, un calculo tipico de planificacion de
  postproduccion.
- La consulta 3 agrupa por `YEAR`/`MONTH` en vez de por la fecha
  completa, para un reporte mensual real.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Peliculas con dias de produccion calculados (`DATEDIFF`).
2. Peliculas con rodaje iniciado en enero de 2026 (`BETWEEN`).
3. Peliculas agrupadas por año y mes.
4. Fecha limite con margen de 30 dias (`DATE_ADD`).
5. Peliculas con la produccion mas larga.
6. Peliculas en produccion o post produccion, ordenadas por fecha de estreno.
