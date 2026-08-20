# Ejercicio 022 - Vistas Avanzadas para Animación 3D

Solución avanzada que utiliza **MySQL Views** para encapsular lógica de reportes y consultas de negocio.

## Estructura
- `schema.sql`: Implementa tablas normalizadas y vistas de solo lectura para reportes.
- `inserts.sql`: Poblado de datos con fechas de entrega para simulación de gestión.
- `consultas.sql`: Uso directo de las vistas creadas para obtener métricas sin exponer las tablas base.

## Decisiones Técnicas
- **Encapsulamiento**: Se crearon `vista_reporte_rendimiento_categorias` y `vista_proyectos_prioritarios` para desacoplar la lógica de visualización de la estructura de tablas.
- **Normalización**: Se mantiene la relación entre `proyectos` y `categorias` para asegurar integridad.
- **Eficiencia**: Las vistas permiten a otros desarrolladores consultar indicadores (como promedios) de forma rápida y segura.