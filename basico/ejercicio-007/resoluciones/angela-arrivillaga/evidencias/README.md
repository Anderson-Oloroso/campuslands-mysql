Ejercicio 007 - ORDER BY para liga de futbol

Estructura del proyecto
angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

Ejecución
1. Ejecutar ddl/schema.sql.
2. Ejecutar dml/inserts.sql.
3. Ejecutar dql/consultas.sql.

Decisiones técnicas
* Se utilizó la base de datos campuslands_mysql.
* Se creó la tabla equipos_liga con restricciones para asegurar que los partidos y puntos no sean negativos.
* Se incorporaron 8 registros de equipos con diferentes estadísticas de puntos, goles y estados para probar ordenamientos múltiples y filtros.
* Se implementaron consultas con ORDER BY simple, múltiple (por columnas y expresiones calculadas), orden ascendente y descendente, y restricciones con LIMIT y WHERE.

Salida y resultados esperados
* Consulta 1: Muestra la tabla de posiciones oficial ordenada por puntos y diferencia de goles de mayor a menor.
* Consulta 2: Retorna el podio de los 3 equipos más goleadores del torneo.
* Consulta 3: Muestra el listado de equipos ordenado alfabéticamente.
* Consulta 4: Filtra los equipos activos y los ordena de menor a mayor según sus goles en contra.
* Consulta 5: Presenta un ranking detallado priorizando puntos, diferencia de goles y goles a favor.

Evidencias - Ejercicio 007

Este archivo documenta las validaciones realizadas:
* Ejecución del DDL: Comprobación de que la tabla equipos_liga y sus restricciones CHECK se crearon correctamente.
* Inserción de datos: Verificación de la inserción exitosa de los 8 registros mediante conteo de filas.
* Ejecución de consultas: Prueba de todas las sentencias DQL para validar el correcto funcionamiento de ORDER BY ascendente y descendente.
* Resultados: Confirmación de que los cálculos de diferencia de goles y los ordenamientos múltiples devuelven reportes coherentes.