# Resolucion - Ejercicio 034 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele los servicios de un garaje de motos en
`servicios_taller_intermedio` y escribi seis consultas centradas en
`HAVING`, filtrando resultados ya agrupados (mecanicos, tipos de
servicio, marcas, fechas) segun distintos umbrales.

## Decisiones tecnicas
- `WHERE estado = 'completado'` antes de agrupar cuando el reporte
  solo debe contar servicios efectivos; `HAVING` despues para filtrar
  el resultado agregado.
- Pedro Ariza registra dos servicios el mismo dia (2026-02-05) a
  proposito, para que la consulta 6 tenga un resultado real que
  mostrar.
- `CHECK (costo > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Mecanicos con mas de 2 servicios completados.
2. Tipos de servicio con ingreso total (completados) mayor a 200.
3. Marcas de moto atendidas mas de una vez.
4. Mecanicos con mas de 300 facturado en servicios completados.
5. Tipos de servicio con costo promedio mayor a 100.
6. Fechas con mas de un servicio registrado el mismo dia.
