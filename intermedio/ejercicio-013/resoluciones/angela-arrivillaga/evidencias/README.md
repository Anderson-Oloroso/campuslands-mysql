# Ejercicio 013 - Tablas puente para catálogo de películas de miedo

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

* Se utilizó la base de datos `peliculas_miedo_db`.
* Se implementó una **tabla puente** (`pelicula_categoria`) para gestionar una relación de Muchos a Muchos (N:M) entre las entidades `peliculas` y `categorias_terror`, permitiendo que una película pertenezca a múltiples subgéneros de terror (por ejemplo, *El Conjuro* o *Talk to Me* combinando Sobrenatural y Psicológico).
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el año de estreno se encuentre en un rango lógico (1900-2026), la duración en minutos sea positiva y la calificación IMDb se mantenga dentro del estándar de la industria (0.0 a 10.0).
* Se estructuraron 8 registros de películas, 4 categorías de terror y múltiples asociaciones en la tabla puente para garantizar la correcta ejecución de consultas con `JOIN` múltiples, funciones agregadas (`COUNT`, `AVG`, `ROUND`) y filtros analíticos.

## Salida y resultados esperados

* Reporte general de cartelera: Listado detallado que relaciona cada película con sus respectivas categorías de terror a través de la tabla puente, mostrando año, puntuación IMDb y estado operativo.
* Consolidado por subgénero: Reporte estadístico que calcula el volumen de producciones por categoría, la calificación media y la duración promedio.
* Filtro de obras maestras del terror: Selección de películas con calificación IMDb superior o igual a 7.5 ordenadas por prestigio crítico.
* Top 5 de cine de terror: Ranking de las 5 películas mejor puntuadas en la plataforma.
* Análisis por estado operativo: Resumen cuantitativo agrupado por la disponibilidad de las cintas evaluando volumen y calidad promedio.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de la clave primaria compuesta y las claves foráneas en cascada.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM pelicula_categoria;` confirmando la correcta inserción de relaciones cruzadas.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando cruces relacionales avanzados y análisis estadístico.