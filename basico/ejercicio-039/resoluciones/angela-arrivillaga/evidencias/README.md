# ejercicio 039 - delete controlado para kickboxing

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

* se utilizo la base de datos relacional `kickboxing_db`.
* especialización en la aplicación de la instrucción `DELETE` de forma controlada mediante condiciones estrictas de estado y rendimiento deportivo para depurar registros inútiles o históricos obsoletos.
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar límites de peso positivos, estadísticas de combate no negativas y precisión monetaria en cuotas con `DECIMAL`.

## salida y resultados esperados

* listado completo del roster actual de la academia ordenado por nivel de victorias.
* filtrado estratégico de atletas activos con trayectoria superior a diez victorias.
* resumen estadístico analítico de nocauts promedio e ingresos por cuotas agrupados por categoría de peso.
* top 5 de los luchadores más contundentes por cantidad de nocauts.
* reporte de auditoría posterior al borrado controlado para verificar la integridad de los datos vigentes.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño relacional normalizado con llaves primarias y foráneas protegidas.
* dml: inserción robusta de registros y ejecución precisa de sentencias `DELETE` bajo criterios lógicos seguros.
* dql: consultas avanzadas orientadas al reporte, agrupamiento y análisis de indicadores clave de rendimiento.