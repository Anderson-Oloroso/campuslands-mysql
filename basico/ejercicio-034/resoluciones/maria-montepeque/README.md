# Resolucion - Ejercicio 034 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `servicios_moto_basico` para un garaje de motos y
practique dos formas de `INSERT`: un `INSERT` multi-fila con lista de
columnas explicita, y un `INSERT ... SET` para una fila adicional.

## Decisiones tecnicas
- `INSERT INTO tabla (...) VALUES (...), (...), ...` para cargar varios
  registros en una sola sentencia.
- `INSERT INTO tabla SET col = valor, ...` como forma alternativa,
  util cuando se arma la fila columna por columna.
- `CHECK (costo > 0)` como restriccion minima de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo ordenado por fecha.
2. Servicios de reparacion o personalizacion.
3. Costo promedio por tipo de servicio.
4. Servicios realizados por cada mecanico.
5. Top 3 servicios mas caros.
6. Servicios realizados a motos Honda.
