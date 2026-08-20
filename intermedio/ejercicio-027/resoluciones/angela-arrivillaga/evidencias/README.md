# ejercicio 027 - consultas de reportes para videojuego de accion y aventura

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

* se utilizo la base de datos `juego_accion_db`.
* desarrollo de consultas de reportes avanzados:
  - se estructuraron consultas de negocio enfocadas en indicadores clave de rendimiento (kpis), promedios financieros, agrupaciones relacionales y filtrados por estado y dificultad.
* se aplicaron restricciones de dominio (`check`) para asegurar niveles de región válidos y valores monetarios no negativos.

## salida y resultados esperados

* reporte detallado de misiones completadas ordenadas por recompensa.
* filtrado de misiones de alta rentabilidad economica.
* analisis estadistico de misiones y experiencia acumulada por tipo de arma.
* seguimiento de misiones activas en curso o disponibles.
* consolidado analitico de dificultad y carga por region del mapa.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de tablas normalizadas con restricciones de dominio y llaves foraneas.
* dml: insercion de registros realistas para pruebas de filtros y agregaciones.
* dql: consultas de reportes ejecutadas con alias claros y resultados esperados.