# Ejercicio 012 - Consultas de reportes para playlist musical

## Estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## Ejecución

1. Ejecutar ddl/schema.sql.
2. Ejecutar dml/inserts.sql.
3. Ejecutar dql/consultas.sql.

## Decisiones técnicas

* Se utilizó la base de datos `playlist_musical_db`.
* Se implementaron consultas analíticas avanzadas orientadas a la generación de reportes de negocio (`SELECT` complejos con `JOIN`, funciones de agregación como `COUNT`, `SUM`, `AVG`, `ROUND`, manipulación de cadenas con `CONCAT`/`FLOOR`/`MOD`, y filtros por conjuntos múltiples con `IN`).
* Se aplicaron restricciones de validación estrictas (`CHECK`) para asegurar que la duración en segundos de cada pista sea estrictamente positiva y que el contador de reproducciones no presente valores negativos.
* Se estructuraron exactamente 4 registros de géneros musicales y 8 registros de canciones diversas para permitir pruebas exhaustivas de indicadores, rankings y agrupaciones por artista y categoría.

## Salida y resultados esperados

* Reporte general de pistas: Listado detallado que cruza cada canción con su respectivo género, mostrando la duración formateada en minutos y segundos, las reproducciones y el estado.
* Consolidado por género musical: Reporte estadístico que calcula el volumen de canciones, el total de reproducciones acumuladas y la duración media por cada estilo.
* Filtro de canciones preferidas y activas: Selección de pistas operativas ordenadas por su nivel de popularidad.
* Top 5 de mayor audiencia: Ranking de las 5 canciones más reproducidas en la plataforma musical.
* Reporte de productividad por artista: Análisis agregado que evalúa el repertorio de cada creador, el impacto en reproducciones y la duración promedio de sus obras.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta integración de claves primarias, foráneas y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM canciones_playlist;` confirmando el cumplimiento del requisito mínimo de 8 registros insertados.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando proyecciones avanzadas, formato de datos y análisis estadístico.