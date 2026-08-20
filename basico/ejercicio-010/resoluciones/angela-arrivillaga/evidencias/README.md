Ejercicio 010 - COUNT y SUM para carreras urbanas

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
* Se creó la tabla carreras_urbanas con restricciones CHECK para asegurar valores válidos en distancias, participantes y recaudación financiera.
* Se insertaron 8 registros con datos variados de distancias, estados y volúmenes de inscripción.
* Se implementaron consultas DQL haciendo uso intensivo de las funciones de agregación COUNT y SUM, combinadas con cláusulas GROUP BY, filtros WHERE, expresiones condicionales CASE y ordenamientos con LIMIT.

Salida y resultados esperados
* Consulta 1: Retorna el número total de eventos registrados y la sumatoria global de atletas inscritos.
* Consulta 2: Agrupa los datos por estado del evento mostrando cuántas carreras hay por cada categoría y su respectiva recaudación acumulada.
* Consulta 3: Calcula métricas financieras y de participación específicas para carreras de largo aliento (>= 10 km).
* Consulta 4: Segmenta los eventos en categorías personalizadas mediante CASE para contrastar el volumen y recaudación entre carreras cortas y largas.
* Consulta 5: Presenta el top 3 de eventos con mayor convocatoria de participantes.

Evidencias - Ejercicio 010

Este archivo documenta las validaciones realizadas:
* Ejecución del DDL: Verificación de la correcta estructuración de la tabla carreras_urbanas y sus validaciones en MySQL.
* Inserción de datos: Comprobación de la carga exitosa de los 8 registros iniciales con tipos DECIMAL y numéricos.
* Ejecución de consultas: Prueba exhaustiva de las sentencias DQL para validar el comportamiento correcto de COUNT y SUM ante diferentes agrupamientos y filtros.
* Resultados: Confirmación de que las funciones de agregación devuelven totales consistentes y acordes con los datos de prueba insertados.