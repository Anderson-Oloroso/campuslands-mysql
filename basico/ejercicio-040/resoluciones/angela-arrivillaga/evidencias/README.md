# ejercicio 040 - count y sum para carreras urbanas

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

* se utilizo la base de datos relacional `carreras_urbanas_db`.
* especialización absoluta en el uso de las funciones de agregación `COUNT` para conteo de registros y agrupamientos, y `SUM` para cálculo acumulativo de ingresos monetarios por inscripciones.
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar distancias kilométricas positivas, costos de inscripción con precisión `DECIMAL` y tiempos de meta no negativos.

## salida y resultados esperados

* métrica global del total de corredores y recaudación bruta general.
* reporte agrupado por categoría con conteo de participantes y suma total de ingresos.
* análisis filtrado de atletas finalizados por modalidad de carrera.
* top de categorías con mayores ingresos acumulados.
* listado detallado de corredores ordenados por estado y tiempo de llegada.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquema relacional estructurado con llaves primarias y foráneas protegidas.
* dml: inserción de múltiples registros realistas para eventos deportivos urbanos.
* dql: consultas optimizadas orientadas al uso de `COUNT`, `SUM`, `GROUP BY` y reportes financieros y operativos.