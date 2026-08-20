# ejercicio 032 - tipos de datos para ranking battle royale

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

* se utilizo la base de datos `ranking_battle_royale_db`.
* aplicacion estricta de tipos de datos adecuados (enteros, decimales de precision para porcentajes, cadenas cortas y `datetime` para marcas de tiempo).
* uso de restricciones de dominio (`check`) para garantizar integridad en puntos de ranking, consistencia lógica entre partidas jugadas y victorias, y rangos válidos de precisión.

## salida y resultados esperados

* ranking general de jugadores ordenados por puntaje descendente.
* filtrado de jugadores con alta precisión de disparo.
* resumen estadístico de promedios de puntaje y victorias por liga.
* top 5 de jugadores con más victorias en el battle royale.
* auditoría de cuentas activas ordenadas por fecha de registro.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de tablas normalizadas con tipos de datos robustos y validaciones lógicas.
* dml: inserción de registros realistas con métricas competitivas y fechas detalladas.
* dql: ejecución de consultas de reportes con funciones de agregación, ordenamientos y límites.