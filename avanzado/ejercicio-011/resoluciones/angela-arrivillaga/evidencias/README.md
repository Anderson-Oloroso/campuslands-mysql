# ejercicio 011 - cte para pingpong

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

* se utilizo la base de datos relacional `pingpong_db`.
* especialización en el uso avanzado de expresiones de tabla comunes (`CTE` / cláusula `WITH`) para modularizar consultas complejas, calcular promedios dinámicos, ratios de rendimiento de sets, porcentajes de éxito y agregaciones financieras.
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar puntajes mínimos positivos, estadísticas de partidos/sets no negativas y precisión monetaria en cuotas con `DECIMAL`.

## salida y resultados esperados

* filtrado avanzado de jugadores activos cuyo rendimiento supera la media general mediante cte.
* cálculo detallado del ratio de eficiencia de sets por atleta con manejo de casos límite.
* análisis financiero agrupado de ingresos por categoría filtrando umbrales mínimos.
* top 5 de jugadores con mayor porcentaje de éxito mediante ctes encadenadas.
* resumen operativo del estado del roster de la academia.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño relacional optimizado con claves primarias y foráneas protegidas.
* dml: inserción robusta de registros y casos de prueba variados para estadísticas deportivas.
* dql: consultas avanzadas basadas exclusivamente en ctes para cumplir con el objetivo técnico del nivel avanzado inicial.