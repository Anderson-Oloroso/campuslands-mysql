# ejercicio 036 - where para autos hiperdeportivos

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

* se utilizo la base de datos relacional `autos_hiperdeportivos_db`.
* especialización en la aplicación de filtros mediante la cláusula `WHERE` para segmentar registros según potencia, homologación y costos de mercado.
* aplicación de tipos de datos estrictos, restricciones `CHECK` para validar rangos lógicos de velocidad, potencia y precios monetarios con precisión `DECIMAL`.

## salida y resultados esperados

* listado completo del catálogo hiperdeportivo ordenado por velocidad máxima.
* filtrado selectivo de vehículos homologados para calle con más de 1500 hp de potencia.
* resumen estadístico con conteos, promedios y sumatorias agrupadas por estado de homologación.
* top 5 de los vehículos con mayor potencia en el mercado.
* reporte de hiperdeportivos exclusivos con precios superiores a los tres millones de dólares.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño relacional robusto con llaves primarias y foráneas protegidas contra actualizaciones y borrados accidentales.
* dml: inserción de múltiples registros con especificaciones técnicas detalladas y realistas.
* dql: consultas avanzadas orientadas al uso intensivo de condiciones lógicas con `WHERE`, funciones de agregación y ordenamientos profesionales.