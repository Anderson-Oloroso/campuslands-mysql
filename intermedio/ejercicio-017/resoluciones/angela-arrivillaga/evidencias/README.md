# Ejercicio 017 - LEFT JOIN para tienda de ropa

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
* Se implementó el uso estratégico de **LEFT JOIN** para garantizar que todas las filas de la tabla izquierda (`categorias_ropa`) aparezcan en los resultados, permitiendo detectar categorías que aún no cuentan con prendas asignadas (como la categoría de "Accesorios Exclusivos").
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el precio de cada prenda sea estrictamente positivo y que el stock disponible no sea negativo.
* Se estructuraron 5 categorías de ropa y 8 prendas diversas (abarcando estilos coquette, streetwear, denim y minimalista dark) para permitir pruebas exhaustivas de funciones de agregación, manejo de nulos con `COALESCE`, detección de registros huérfanos con `IS NULL` y cálculos financieros de inventario.

## Salida y resultados esperados

* Reporte general de catálogo: Listado detallado cruzado por LEFT JOIN que relaciona cada categoría con sus prendas, mostrando precios en dólares, stock y estado operativo (incluyendo categorías vacías).
* Consolidado estadístico por sección: Reporte agregado que calcula la variedad de prendas, el volumen de inventario y el precio promedio por categoría.
* Detección de categorías sin productos: Consulta especializada que filtra las secciones comerciales que actualmente no poseen artículos registrados (`IS NULL`).
* Reporte de oportunidades y stock bajo: Listado de prendas en oferta o con disponibilidad limitada.
* Valoración de inventario: Análisis financiero que calcula el capital total representado en stock por cada categoría de la tienda de ropa.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias, foráneas y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM prendas_tienda;` confirmando la correcta inserción de registros analíticos.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando el uso avanzado de `LEFT JOIN`, funciones de manejo de nulos y reportes gerenciales.