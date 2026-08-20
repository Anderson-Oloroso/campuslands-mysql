# ejercicio 047 - LEFT JOIN para tienda de ropa

## estructura del proyecto
angela-arrivillaga/
├── ddl/schema.sql
├── dml/inserts.sql
├── dql/consultas.sql
└── evidencias/README.md

## decisiones tecnicas
* Se utilizó `LEFT JOIN` para asegurar que las categorías sin productos asignados también aparezcan en los reportes de inventario.
* Se implementó `IFNULL` en las consultas para gestionar adecuadamente los valores nulos resultantes de productos sin categoría.
* Las restricciones `CHECK` garantizan la integridad de los datos financieros y de stock.
* La relación entre `categorias` y `productos` permite la eliminación de categorías manteniendo los productos (`ON DELETE SET NULL`), permitiendo probar casos donde el `categoria_id` es `NULL`.

## evidencias de ejecucion
* Se confirmó que las consultas `LEFT JOIN` detectan correctamente tanto los productos categorizados como los "huérfanos".
* Los reportes de valor de inventario manejan correctamente el resultado de cero para categorías sin productos.