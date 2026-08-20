# Ejercicio 015 - Relaciones simples para biblioteca gamer

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
* Se implementó un modelo relacional de uno a muchos entre la entidad `plataformas` y la entidad principal `videojuegos`, garantizando la integridad referencial mediante llaves foráneas.
* Se incorporaron restricciones de validación mediante `CHECK` para asegurar que los precios sean valores monetarios válidos y que las generaciones de consola sean estrictamente positivas.
* Se estructuraron exactamente 4 registros de plataformas y 8 registros de videojuegos variados para permitir pruebas completas de filtros por estado de inventario, funciones agregadas de promedio y conteo, y consultas de ranking (`LIMIT`).

## Salida y resultados esperados

* Inventario relacional: Listado completo que vincula de forma transparente cada videojuego con su plataforma y fabricante correspondiente.
* Agrupación por plataforma: Resumen métrico que cuantifica el volumen de títulos y calcula el precio promedio por cada consola o ecosistema.
* Filtro de disponibilidad: Selección de títulos operativos listos para préstamo con estatus `disponible`.
* Top 5 de inversión: Ranking de los 5 videojuegos con mayor valor comercial dentro del catálogo.
* Auditoría de inventario: Reporte administrativo agrupado por estado de inventario que detalla cantidad de títulos y valor acumulado.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `SHOW TABLES;` y validando las restricciones en las tablas relacionadas.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM videojuegos;` confirmando el cumplimiento del mínimo de 8 registros requeridos.
* **DQL:** Salida estructurada de las 5 consultas requeridas demostrando cruces relacionales avanzados (`JOIN`), funciones estadísticas y ordenamientos.