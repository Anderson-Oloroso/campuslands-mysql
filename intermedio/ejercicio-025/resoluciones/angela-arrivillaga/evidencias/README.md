# ejercicio 025 - unique para laboratorio de formulas quimicas

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

* se utilizo la base de datos `laboratorio_quimico_db`.
* aplicacion estricta de restricciones `unique`:
  - se incorporaron restricciones unicas en columnas criticas como `nombre_categoria`, `codigo_empleado`, `correo_institucional`, `codigo_formula` y `formula_molecular` para prevenir duplicidad de registros quimicos o identidades institucionales.
* se implementaron restricciones de dominio (`check`) para garantizar que los porcentajes de rendimiento se mantengan en el rango valido de 0 a 100.

## salida y resultados esperados

* listado de formulas patentadas con mayor porcentaje de rendimiento.
* filtrado de formulas quimicas de alto rendimiento superior al 85%.
* reporte de productividad y rendimiento promedio por investigador.
* filtrado de formulas en fases activas de prueba y verificacion.
* analisis estadistico de formulas y rendimientos agrupados por categoria de reactivo.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de tablas con restricciones `unique` y llaves foraneas.
* dml: insercion exitosa de datos coherentes sin violar las restricciones unicas.
* dql: consultas relacionales y de agregacion ejecutadas sin errores.