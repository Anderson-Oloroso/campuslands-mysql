# ejercicio 035 - select para taller mecanico de motos

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar ddl/schema.sql.
2. ejecutar dml/inserts.sql.
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* se utilizo la base de datos relacional `taller_mecanico_motos_db`.
* estructuracion avanzada de consultas con la sentencia `SELECT` aplicando funciones de agregación, uniones relacionales (`JOIN`), filtros especializados (`WHERE`, `IN`) y ordenamientos analíticos (`ORDER BY`, `LIMIT`).
* aplicación de tipos de datos estrictos y validaciones con restricciones `CHECK` para garantizar la integridad monetaria y evitar costos negativos.

## salida y resultados esperados

* listado general de órdenes de reparación vinculadas con sus respectivos tipos de servicio.
* filtrado estratégico de servicios pendientes o en proceso con costos elevados.
* resumen estadístico completo con conteos, promedios y sumatorias de ingresos por categoría de servicio.
* top 5 de las órdenes de mayor impacto económico en el taller.
* reporte de control operativo para órdenes completadas o entregadas.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquemas normalizados con llaves primarias y foráneas seguras.
* dml: inserción de múltiples registros detallados para simular un entorno de taller real.
* dql: consultas optimizadas y profesionales que responden a interrogantes de negocio reales.