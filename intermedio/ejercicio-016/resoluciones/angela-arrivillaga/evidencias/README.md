# Ejercicio 016 - INNER JOIN para restaurante de comida urbana

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
* Se implementó el uso estricto de **INNER JOIN** en todas las consultas relacionales para conectar la entidad fuerte `platos_urbanos` con su respectiva categoría en `categorias_menu`, garantizando que únicamente se devuelvan registros con correspondencia directa.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el precio del plato sea estrictamente positivo y que el contenido calórico sea mayor a cero.
* Se estructuraron 4 categorías de menú y 8 platos urbanos variados (hamburguesas smash, salchipapas, tacos y bebidas) para permitir pruebas exhaustivas de funciones de agregación, formateo de moneda y filtros condicionales.

## Salida y resultados esperados

* Reporte general del menú: Listado detallado cruzado por INNER JOIN que relaciona cada platillo con su categoría, mostrando precio en formato de dólares, calorías y estado.
* Consolidado por categoría: Reporte estadístico que calcula la cantidad de platos ofertados, el precio promedio y el perfil calórico medio por categoría culinaria.
* Filtro de platos activos: Selección precisa de los productos en estado disponible o nuevo ordenados por precio.
* Top 5 de mayor valor: Ranking de los 5 platos urbanos más costosos del restaurante.
* Análisis por estado operativo: Resumen cuantitativo agrupado por condición del plato evaluando volumen, precio medio y calorías acumuladas.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias, foráneas y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM platos_urbanos;` confirmando el cumplimiento del requisito mínimo de 8 registros insertados de alta calidad.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando el uso intensivo de `INNER JOIN`, funciones agregadas y formateo avanzado.