# Ejercicio 016 - CREATE TABLE para restaurante de comida urbana

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

* Se utilizó la base de datos `restaurante_urbano_db`.
* Se implementó un diseño relacional estructurado mediante una tabla principal `productos_urbana` vinculada a una tabla de catálogos `categorias_menu` asegurando la integridad referencial.
* Se incorporaron restricciones de validación estrictas mediante `CHECK` para garantizar que los precios monetarios sean mayores a cero y que el conteo de calorías nutricionales sea lógicamente válido.
* Se estructuraron exactamente 4 registros de categorías y 8 registros de productos urbanos variados para permitir pruebas completas de filtros por disponibilidad, funciones agregadas de promedios nutricionales y listados de precios ordenados.

## Salida y resultados esperados

* Menú relacional completo: Listado detallado que cruza cada plato con su respectiva categoría y costo comercial.
* Agrupación por categoría: Reporte cuantitativo y estadístico que calcula el total de platos y el precio promedio por cada división culinaria.
* Filtro de disponibilidad: Selección estricta de los platillos listos para la venta al público con estado `disponible`.
* Top de economía: Ranking de los 5 productos más accesibles de todo el menú urbano.
* Auditoría nutricional por estado: Resumen agrupado por disponibilidad que evalúa la cantidad de platos y su carga calórica promedio.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `SHOW TABLES;` y validando la correcta aplicación de restricciones y llaves foráneas.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM productos_urbana;` confirmando el cumplimiento del mínimo de 8 registros requeridos.
* **DQL:** Salida en consola de las 5 consultas requeridas demostrando cruces relacionales eficientes, filtros y funciones de agregación.