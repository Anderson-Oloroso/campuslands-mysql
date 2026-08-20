# Ejercicio 011 - CHECK para pingpong

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

* Se utilizó la base de datos `pingpong_torneo_db`.
* Se implementaron restricciones de validación estrictas mediante reglas `CHECK` a nivel de esquema DDL para asegurar la integridad reglamentaria del deporte: los sets ganados por el jugador uno y dos deben encontrarse dentro del rango lógico del formato competitivo (entre 0 y 4 sets), y la duración en minutos debe ser estrictamente positiva.
* Se estructuraron exactamente 4 registros de categorías de torneo y 8 registros de partidos diversos para permitir pruebas exhaustivas de restricciones de validación, funciones de agregación estadística y consultas relacionales con `JOIN`.

## Salida y resultados esperados

* Cuadro general de partidos: Listado detallado que relaciona cada enfrentamiento con su respectiva categoría, marcador en formato de sets, duración temporal y estado operativo.
* Consolidado por categoría: Reporte estadístico que calcula el volumen de encuentros disputados, la duración media y el tiempo acumulado por división de competencia.
* Filtro de partidos finalizados: Selección precisa de los encuentros concluidos ordenados por exigencia temporal.
* Top 5 de maratones de tenis de mesa: Ranking de los 5 partidos con mayor duración en minutos dentro del torneo.
* Análisis por estado del encuentro: Resumen cuantitativo agrupado por la condición del partido evaluando la cantidad de registros, el promedio de sets totales disputados y la duración media.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para comprobar la correcta aplicación de constraints `CHECK` y claves foráneas.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM partidos_pingpong;` confirmando el cumplimiento del requisito mínimo de 8 registros insertados.
* **DQL:** Salida en consola de las 5 consultas requeridas demostrando operaciones con funciones agregadas, concatenación de cadenas y filtros avanzados.