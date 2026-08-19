# ejercicio 016 - transacciones para restaurante de comida urbana

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

* se utilizo la base de datos relacional `restaurante_urbano_db`.
* especialización en la implementación de **Transacciones ACID en MySQL** (`START TRANSACTION`, `COMMIT`, `ROLLBACK`) para garantizar la atomicidad y consistencia en la creación de órdenes de pedidos complejos que involucran múltiples tablas relacionadas (cabecera de orden, detalles y actualización de inventarios).
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar stocks e importes monetarios no negativos con precisión `DECIMAL`.

## salida y resultados esperados

* registro transaccional seguro y validado de pedidos de comida urbana.
* listado general de órdenes detalladas con nombres de clientes y productos asociados.
* filtrado de productos económicos disponibles en el menú.
* reporte estadístico agrupado por categorías culinarias con promedios y máximos.
* top de platos más costosos y resumen de ventas acumuladas por cliente.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquema relacional con restricciones de integridad y llaves foráneas en cascada/restricción.
* dml: inserción robusta de ingredientes, menús y ejecución de bloques transaccionales controlados.
* dql: consultas avanzadas de reporte, agregación y análisis financiero del restaurante.