# Resolucion - Ejercicio 019 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `saltos_basico` para registrar saltos de paracaidismo y
practique dos formas de `INSERT` en MySQL: un `INSERT` multi-fila con
lista de columnas explicita, y un `INSERT ... SET` para una fila
adicional.

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
2. Saltos tandem ordenados por costo.
3. Promedio de altura y duracion por tipo de salto.
4. Top 3 saltos con mayor duracion de caida libre.
5. Cantidad de saltos por nivel de paracaidista.
6. Saltos realizados en febrero de 2026.
