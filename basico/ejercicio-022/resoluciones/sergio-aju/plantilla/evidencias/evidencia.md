# Ejercicio 022 - Animación 3D

Este módulo organiza la gestión de proyectos de una academia utilizando la base de datos `campuslands_mysql`.

## Ejecución
1. **DDL**: Ejecutar `schema.sql` para crear la tabla `basico_ejercicio_022`.
2. **DML**: Ejecutar `inserts.sql` para poblar la tabla con 8 proyectos de ejemplo.
3. **DQL**: Ejecutar `consultas.sql` para obtener reportes de rendimiento.

## Decisiones Técnicas
- Se utilizó `ENUM` para asegurar la consistencia en `categoria` y `estado`.
- Se aplicó `DECIMAL(10,2)` en `puntaje` para permitir cálculos precisos de promedios.
- Las consultas utilizan `ORDER BY` y `GROUP BY` para extraer indicadores de negocio relevantes.