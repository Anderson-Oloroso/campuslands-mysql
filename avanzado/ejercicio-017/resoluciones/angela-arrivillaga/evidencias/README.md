# ejercicio 017 - procedimientos almacenados para tienda de ropa

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

* se utilizo la base de datos relacional `tienda_ropa_db`.
* especialización en la creación y uso de **Procedimientos Almacenados (Stored Procedures)** en MySQL para encapsular la lógica transaccional compleja (ej. `sp_registrar_venta_prenda` con validaciones de stock mediante señales de error SQL y registros de auditoría automáticos).
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar stocks e importes monetarios no negativos con precisión `DECIMAL`.

## salida y resultados esperados

* gestión automatizada de transacciones de inventario mediante procedimientos almacenados.
* listado general detallado del inventario de ropa ordenado por precios.
* filtrado de prendas con bajo stock para procesos de reabastecimiento.
* reporte estadístico agrupado por categorías con stock total y promedios de precios.
* top 5 de prendas más costosas y reporte de auditoría de cambios en el inventario.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquema relacional con claves foráneas protegidas y tabla de auditoría.
* dml: inserción de categorías, prendas, definición de procedimientos almacenados con control de flujo (`IF`/`SIGNAL`) e invocación de prueba.
* dql: consultas avanzadas de reporte, filtrado de stock crítico y validación de la tabla de auditoría.