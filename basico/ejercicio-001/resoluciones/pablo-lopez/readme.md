# Ejercicio 001 - Crear Tabla para Torneo Esports MOBA

## Autor
Pablo Lopez

## Descripción

En este ejercicio se creó una tabla llamada `equipos` para almacenar información de los equipos participantes en un torneo de esports MOBA.

La tabla permite registrar:
- Nombre del equipo.
- Región.
- Puntaje.
- Cantidad de victorias.
- Cantidad de derrotas.
- Estado del equipo (Activo o Eliminado).

## Archivos

- `ddl/schema.sql`: Crea la estructura de la tabla.
- `dml/inserts.sql`: Inserta 8 registros de ejemplo.
- `dql/consultas.sql`: Contiene consultas para obtener información útil de la tabla.

## Cómo ejecutar

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó MySQL como sistema gestor de base de datos.
- Se creó una clave primaria con `AUTO_INCREMENT` para identificar cada equipo.
- Se utilizaron restricciones `NOT NULL` para los campos obligatorios.
- Se utilizó `ENUM` para limitar el estado del equipo a `Activo` o `Eliminado`.
- Se agregaron 8 registros para probar consultas, filtros, ordenamientos y cálculos.

## Resultado

La solución permite almacenar información de equipos y realizar consultas como:
- Mostrar todos los equipos.
- Filtrar equipos activos.
- Mostrar el ranking por puntaje.
- Calcular el promedio de puntaje por región.
- Mostrar el Top 5 de equipos.