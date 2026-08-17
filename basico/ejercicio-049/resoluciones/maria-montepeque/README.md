# Resolucion - Ejercicio 049 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `saltos_basico` para un club de paracaidismo y practique
dos formas de `INSERT`: un `INSERT` multi-fila con lista de columnas
explicita, y un `INSERT ... SET` para una fila adicional.

## Decisiones tecnicas
- `INSERT INTO tabla (...) VALUES (...), (...), ...` para cargar varios
  registros en una sola sentencia.
- `INSERT INTO tabla SET col = valor, ...` como forma alternativa,
  util cuando se arma la fila columna por columna.
- `CHECK (altura_metros > 0)` y `CHECK (costo > 0)` como restricciones
  minimas de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo ordenado por fecha.
2. Saltos de formacion o free fly.
3. Costo promedio por tipo de salto.
4. Saltos realizados por cada instructor.
5. Top 3 saltos mas caros.
6. Saltos realizados en la zona "La Sabana".
