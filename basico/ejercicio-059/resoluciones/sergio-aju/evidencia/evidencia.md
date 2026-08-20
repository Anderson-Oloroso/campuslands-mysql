# Ejercicio 059 - Fechas Básicas para Marketplace de Accesorios

Solución centrada en la manipulación de tipos de datos temporales (`DATETIME`) para realizar análisis de antigüedad de pedidos, segmentación de ventas mensuales y reportes de estado logístico.

## Estructura
- `ddl/schema.sql`: Definición de la tabla `pedidos_accesorios` con campos temporales.
- `dml/inserts.sql`: 8 registros con fechas distribuidas entre mayo y agosto de 2026 para probar cálculos de fechas.
- `dql/consultas.sql`: Consultas que utilizan funciones nativas de MySQL como `DATEDIFF`, `MONTH`, `YEAR` y `MONTHNAME`.

## Decisiones Técnicas
- **Tipado Temporal**: Se utilizó `DATETIME` para permitir análisis tanto de fecha como de hora.
- **Funciones de Agregación**: Uso estratégico de `MONTHNAME` para facilitar la lectura de reportes mensuales en comparación con el número entero del mes.
- **Lógica de Negocio**: La consulta de antigüedad (`DATEDIFF`) es vital para la logística, permitiendo al marketplace identificar pedidos rezagados.