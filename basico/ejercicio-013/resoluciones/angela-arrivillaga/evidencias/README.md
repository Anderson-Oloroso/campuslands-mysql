# Ejercicio 013 - Filtros por estado para catalogo de peliculas de miedo

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
* Se implementó una entidad principal `peliculas` dotada de restricciones de integridad (`CHECK`) para validar rangos lógicos en el año de estreno, duración en minutos y calificación de IMDB en formato decimal preciso.
* Se incorporó el campo `estado_catalogo` mediante un tipo `ENUM` para clasificar rigurosamente las películas en estados operativos (`disponible`, `proximamente`, `agotado`, `archivado`) y practicar filtrados de negocio eficientes.
* Se incluyeron exactamente 8 registros variados que abarcan distintos subgéneros y estados para permitir la correcta ejecución de filtros por conjunto, agrupaciones estadísticas y rankings.

## Salida y resultados esperados

* Disponibles de alta calidad: Listado filtrado de títulos activos ordenados de mayor a menor según su puntuación en IMDB.
* Resumen por subgénero: Conteo volumétrico y promedio de calificación agrupado por las distintas corrientes del cine de terror.
* Control de estados múltiples: Consulta utilizando operadores de conjunto (`IN`) para evaluar películas operativas fuera del archivo histórico.
* Top 5 de la crítica: Ranking de las películas con mejor puntuación histórica dentro de toda la plataforma.
* Auditoría de estados: Reporte de inventario agrupado por estado que contrasta la cantidad de títulos y el año de estreno más antiguo de cada categoría.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `DESCRIBE peliculas;` y comprobando las restricciones restrictivas incorporadas.
* **DML:** Verificación mediante `SELECT COUNT(*) FROM peliculas;` confirmando el cumplimiento del mínimo de 8 registros solicitados.
* **DQL:** Salida en consola de las 5 consultas requeridas demostrando filtrado por estado, funciones de agregación y ordenamiento avanzado.