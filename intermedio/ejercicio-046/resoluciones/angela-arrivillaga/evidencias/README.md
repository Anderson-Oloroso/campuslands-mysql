# ejercicio 046 - INNER JOIN para restaurante de comida urbana

## estructura del proyecto
angela-arrivillaga/
├── ddl/schema.sql
├── dml/inserts.sql
├── dql/consultas.sql
└── evidencias/README.md

## decisiones tecnicas
* se aplicó una relación 1:N entre `categorias` y `productos` mediante un campo llave foránea para garantizar la integridad referencial.
* uso de restricciones `CHECK` para asegurar que el `precio_venta` y el `stock_actual` no contengan valores negativos, protegiendo la lógica financiera.
* empleo sistemático de `INNER JOIN` para consolidar reportes de negocio que vinculan la identidad del producto con su categoría.
* utilización de alias claros en las consultas para mejorar la presentación de resultados al usuario final.

## evidencias de ejecucion
* se validó la ejecución de los scripts DDL y DML sin errores.
* los reportes DQL muestran correctamente la relación entre categorías y productos, incluyendo cálculos agregados de inventario y valores financieros.