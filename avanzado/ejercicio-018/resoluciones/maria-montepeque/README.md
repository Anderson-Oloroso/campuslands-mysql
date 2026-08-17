# Resolucion - Ejercicio 018 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele itinerarios de viaje en `itinerarios_avanzado` y escribi
consultas centradas en funciones SQL de MySQL:

- **Texto**: `UPPER`, `LOWER`, `CONCAT`, `SUBSTRING`, `LPAD`,
  `SUBSTRING_INDEX` (para extraer el dominio del correo).
- **Fecha**: `DATEDIFF` (duracion del viaje) y `MONTHNAME`.
- **Numericas**: `ROUND` (precio final tras descuento).
- **Agregacion + fecha combinadas**: `AVG(DATEDIFF(...))`.
- **Condicional**: `CASE` para clasificar el viaje en corto/medio/largo.

## Decisiones tecnicas
- `CHECK (fecha_regreso > fecha_salida)`: restriccion entre columnas
  (soportada desde MySQL 8.0.16) para evitar itinerarios con fechas
  invertidas.
- `CHECK (descuento_pct BETWEEN 0 AND 100)` para que el descuento sea
  siempre un porcentaje valido.
- El codigo de reserva de la consulta 1 se genera combinando varias
  funciones de texto (`CONCAT`, `SUBSTRING`, `LPAD`) para mostrar como
  se encadenan.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Nombre en mayusculas, correo en minusculas y codigo de reserva generado.
2. Duracion del viaje en dias y mes de salida.
3. Precio final redondeado tras aplicar el descuento.
4. Duracion promedio de todos los viajes.
5. Dominio de correo de cada viajero.
6. Clasificacion del viaje por duracion (corto/medio/largo) con CASE.
