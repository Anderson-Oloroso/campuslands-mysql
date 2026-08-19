# ejercicio 038 - update para futbol sala

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

* se utilizo la base de datos relacional `futbol_sala_db`.
* especialización en la aplicación de la instrucción `UPDATE` para modificar datos existentes, simular aumentos salariales por rendimiento, actualizaciones de estadísticas de goleo y cambios dinámicos en los estados operativos de los deportistas.
* aplicación de tipos de datos estrictos, restricciones `CHECK` para validar rangos de dorsales, goleo no negativo y precisión monetaria en salarios mensuales mediante `DECIMAL`.

## salida y resultados esperados

* listado completo del plantel de fútbol sala ordenado por rendimiento goleador.
* filtrado estratégico de jugadores activos con alto registro de anotaciones.
* resumen estadístico con métricas de golem, salarios promedio y nóminas totales agrupadas por posición táctica.
* top 5 de los máximos goleadores reflejando las actualizaciones aplicadas.
* reporte de control de jugadores lesionados o suspendidos.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquema relacional estructurado con llaves primarias y foráneas protegidas.
* dml: inserciones robustas de registros y aplicación correcta de sentencias `UPDATE` bajo condiciones específicas.
* dql: consultas optimizadas orientadas al análisis de datos, reportes y métricas de desempeño.