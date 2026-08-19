# ejercicio 029 - vistas simples para marketplace de accesorios

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

* se utilizo la base de datos `marketplace_accesorios_db`.
* creacion de vistas simples (`vw_accesorios_disponibles` y `vw_resumen_inventario_categorias`) para encapsular consultas frecuentes de negocio.
* aplicacion de restricciones de dominio (`check`) para garantizar que los precios y los niveles de stock no contengan valores negativos.

## salida y resultados esperados

* listado filtrado mediante vista de accesorios disponibles ordenados por precio.
* reporte de resumen de inventario, stock y promedios por categoría mediante vista relacional.
* filtrado de accesorios exclusivos de alto valor comercial.
* auditoría de productos agotados o descontinuados en el marketplace.
* cálculo financiero del valor total del inventario agrupado por categoría.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de tablas normalizadas, restricciones y vistas sql reutilizables.
* dml: insercion de registros realistas abarcando diversos estados de stock y categorias.
* dql: ejecucion de consultas directas sobre vistas y tablas base con alias claros y reportes financieros.