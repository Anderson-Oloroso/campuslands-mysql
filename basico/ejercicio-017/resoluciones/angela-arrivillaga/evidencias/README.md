# Ejercicio 017 - Tipos de datos para tienda de ropa

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

* Se utilizó la base de datos `tienda_ropa_db`.
* Se aplicó una selección rigurosa de tipos de datos en MySQL: `DECIMAL(8,2)` para garantizar precisión absoluta en los montos monetarios de los precios unitarios, tipos `ENUM` optimizados para tallas estandarizadas y estados operativos del inventario, y campos `DATE` para el control temporal de ingresos.
* Se incorporaron restricciones de validación mediante `CHECK` para asegurar que los precios sean estrictamente positivos y que las existencias en stock nunca sean negativas.
* Se estructuraron exactamente 4 registros de categorías y 8 registros de productos variados para permitir pruebas completas de filtros por conjuntos múltiples, cálculos aritméticos de valoración de inventario y ordenamientos por precio.

## Salida y resultados esperados

* Inventario detallado: Listado completo que relaciona cada artículo con su respectiva categoría, talla, precio exacto y disponibilidad actual.
* Agrupación por categoría: Reporte estadístico que calcula el volumen de artículos, la suma del stock y el precio medio por cada división de vestimenta.
* Filtro de disponibilidad activa: Selección de prendas operativas listas para la venta que combinan estados de disponibilidad y stock físico mayor a cero.
* Top 5 de alta gama: Ranking de las 5 prendas con mayor valor comercial dentro del catálogo.
* Valorización de inventario: Consulta analítica que calcula el valor monetario total del stock disponible por cada artículo (`precio unitario * stock actual`).

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `DESCRIBE productos_ropa;` para comprobar la correcta asignación de tipos de datos y constraints.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM productos_ropa;` confirmando el cumplimiento del mínimo de 8 registros requeridos.
* **DQL:** Salida en consola de las 5 consultas requeridas demostrando operaciones aritméticas con columnas, funciones de agregación y filtros avanzados.