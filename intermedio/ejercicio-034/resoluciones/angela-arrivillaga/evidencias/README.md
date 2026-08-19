# Ejercicio 034 - HAVING para Garaje de Motos

## Estructura del Proyecto

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

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones Técnicas

* Se diseñó el esquema relacional `garaje_motos_db` separando el catálogo de marcas y el inventario de motocicletas.
* Enfoque centrado en la aplicación correcta y avanzada de la cláusula **HAVING** para filtrar grupos ya agregados (por ejemplo, mediante funciones `AVG`, `SUM` y `COUNT`).
* Uso de restricciones de integridad (`CHECK` en cilindrada y costos) y tipos de datos estrictos (`ENUM` para estados operativos).

## Salida y Resultados Esperados

* Reportes filtrados de marcas con costos promedio de mantenimiento elevados (>150.00).
* Análisis de estados operativos con umbrales de cantidad (>2 motos).
* Filtrado de marcas con alta cilindrada promedio (>500 cc).
* Control presupuestario combinando `WHERE` y `HAVING` para sumar costos de mantenimiento excluyendo motos dadas de baja.
* Identificación de marcas con múltiples unidades registradas en el garaje.

## Evidencias

Para demostrar la correcta ejecución:

* DDL: Definición de tablas normalizadas con claves foráneas estrictas.
* DML: Inserción de 12 registros de motocicletas con variedad de marcas, cilindrajes y estados.
* DQL: Consultas analíticas profesionales utilizando `GROUP BY` y `HAVING`.