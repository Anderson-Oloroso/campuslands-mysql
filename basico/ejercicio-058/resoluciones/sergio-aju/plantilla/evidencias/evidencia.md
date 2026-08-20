# Ejercicio 058 - Filtros por Estado para Academia Tech

Solución enfocada en el control de flujo académico mediante filtros de estado (`estado_estudiante`), asegurando que la academia pueda segmentar sus datos para toma de decisiones (graduados, activos, deserciones).

## Estructura
- `ddl/schema.sql`: Tabla `estudiantes` con `ENUM` para asegurar estados válidos y restricciones de promedio.
- `dml/inserts.sql`: 8 registros que representan la diversidad de estados académicos.
- `dql/consultas.sql`: Consultas enfocadas en filtrar estados específicos (`IN`, `WHERE`) y realizar agregaciones (`AVG`, `COUNT`).

## Decisiones Técnicas
- **Tipado Fuerte**: Uso de `ENUM` para `estado_estudiante` y `programa_academico`, lo que previene errores de digitación en los filtros de búsqueda.
- **Validación**: Implementación de `CHECK` para garantizar que los promedios académicos se mantengan en el rango lógico de 0 a 10.
- **Eficiencia**: Consultas diseñadas con alias claros (`AS`) y filtros selectivos para optimizar el rendimiento del reporte.