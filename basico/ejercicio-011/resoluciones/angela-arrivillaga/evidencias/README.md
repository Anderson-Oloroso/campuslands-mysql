# Ejercicio 011 - Validaciones simples para pingpong

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

* Se utilizó la base de datos `pingpong_db`.
* Se implementaron restricciones de validación simples (`CHECK`) para asegurar que los puntos de ranking y el conteo de sets en los partidos nunca sean valores negativos.
* Se estructuró una tabla de `jugadores` con un campo de estado (`activo`) para practicar filtros de negocio y una tabla relacional de `partidos`.
* Se incorporaron exactamente 8 registros de jugadores y 8 registros de partidos para permitir pruebas completas de ordenamientos, filtros y agregaciones.

## Salida y resultados esperados

* Ranking general: Listado ordenado de los atletas activos según su puntuación de ranking de manera descendente.
* Conteo por nivel: Resumen numérico de la cantidad de competidores agrupados por categoría de habilidad.
* Promedio de ranking: Cálculo estadístico del puntaje medio entre los competidores activos.
* Historial de partidos: Consulta relacional con nombres legibles y marcadores detallados de cada encuentro.
* Filtro de alto rendimiento: Selección de jugadores que superan o igualan los 1800 puntos en el ranking.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `SHOW TABLES;` y validando la correcta aplicación de restricciones en las tablas creadas.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM jugadores;` y `SELECT COUNT(*) FROM partidos;` confirmando el cumplimiento del mínimo de 8 registros requeridos.
* **DQL:** Salida estructurada en consola de las 5 consultas requeridas demostrando filtros, funciones agregadas y cruces relacionales.