# Ejercicio 015 - Carga de datos para biblioteca gamer

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

* Se utilizó la base de datos `biblioteca_gamer_db`.
* Se implementó una robusta carga inicial de datos con restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el precio del videojuego no sea negativo y que el contador de horas jugadas sea siempre mayor o igual a cero.
* Se estructuraron 4 plataformas de gaming principales y 8 videojuegos con diversos estados operativos (`completado`, `jugando`, `pendiente`, `abandonado`) para permitir pruebas exhaustivas de consultas relacionales con `JOIN`, funciones de agregación financiera y estadísticas de rendimiento.

## Salida y resultados esperados

* Reporte general de biblioteca: Listado detallado que relaciona cada título con su respectiva plataforma de hardware, mostrando formato monetario en dólares, horas invertidas y estado.
* Consolidado por plataforma: Reporte estadístico que calcula el volumen de títulos, la inversión financiera acumulada y el promedio de horas de entretenimiento por fabricante.
* Filtro de juegos activos y completados: Selección precisa de los títulos en curso o finalizados ordenados por nivel de compromiso del usuario.
* Top 5 de mayor dedicación gamer: Ranking de los 5 videojuegos con más horas de juego acumuladas en la biblioteca.
* Análisis por estado operativo: Resumen cuantitativo agrupado por la condición del juego evaluando cantidad de registros, costo promedio y horas totales invertidas.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de tablas, claves primarias, foráneas y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM videojuegos;` confirmando el cumplimiento del requisito mínimo de 8 registros insertados de alta calidad.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando proyecciones avanzadas, formato monetario y análisis estadístico.