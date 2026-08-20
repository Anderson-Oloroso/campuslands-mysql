# ejercicio 034 - insert para garaje de motos

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

* se utilizo la base de datos relacional `garaje_motos_db`.
* estructuracion rigurosa mediante instrucciones `INSERT` masivas para poblar tanto la tabla de tipos de motor como el catálogo principal de motocicletas.
* aplicación de validaciones estrictas con restricciones `CHECK` en rangos de años de fabricación, kilometrajes no negativos y tarifas monetarias precisas con tipo `DECIMAL`.

## salida y resultados esperados

* listado completo del inventario de motocicletas ordenado por nivel de desgaste (kilometraje).
* filtrado especializado de unidades operativas con tarifas de mantenimiento elevadas.
* resumen estadístico analítico de promedios de uso y costos acumulados por categoría de motor.
* top 5 de motos más nuevas o con menor kilometraje acumulado.
* reporte operativo de vehículos en estado de reparación o fuera de servicio.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquemas normalizados con llaves primarias y foráneas protegidas.
* dml: inserciones robustas y consistentes que simulan escenarios reales de taller mecánico.
* dql: consultas avanzadas con agrupamientos, funciones estadísticas, filtros y límites profesionales.