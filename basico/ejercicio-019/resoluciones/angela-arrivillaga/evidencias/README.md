# Ejercicio 019 - INSERT para paracaidismo

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

* Se utilizó la base de datos `paracaidismo_db`.
* Se implementaron sentencias `INSERT INTO` optimizadas y estructuradas para poblar tanto la tabla independiente de catálogos (`tipos_salto`) como la tabla transaccional dependiente (`saltos_paracaidismo`), garantizando la integridad referencial mediante claves foráneas.
* Se incorporaron restricciones de validación estrictas (`CHECK`) para asegurar que las alturas de salto en pies sean positivas, los costos monetarios sean mayores a cero y los tiempos de caída libre en segundos no presenten valores negativos.
* Se estructuraron exactamente 4 registros de modalidades de salto y 8 registros de saltos operativos diversos para permitir pruebas exhaustivas de inserción masiva, filtros por múltiples estados, funciones de agregación y ordenamientos analíticos.

## Salida y resultados esperados

* Registro general de saltos: Listado detallado que cruza cada paracaidista con su modalidad de salto, altura asociada, costo comercial y estado operativo.
* Consolidado por modalidad: Reporte estadístico y financiero que calcula la cantidad de saltos, el costo medio y la facturación total por cada categoría de vuelo.
* Filtro operacional activo: Selección estricta de saltos que se encuentran ejecutados (`completado`) o listos en agenda (`programado`), ordenados por el tiempo de caída libre.
* Top 5 de caída libre: Ranking de los 5 saltos con mayor permanencia en caída libre dentro de la escuela.
* Análisis por estado del salto: Resumen cuantitativo agrupado por la condición del salto evaluando costos promedio y tiempos acumulados.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `DESCRIBE saltos_paracaidismo;` para verificar la estructura relacional y los tipos de datos.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM saltos_paracaidismo;` confirmando el cumplimiento del mínimo de 8 registros insertados correctamente.
* **DQL:** Salida en consola de las 5 consultas requeridas demostrando consultas multitabla con `JOIN`, funciones de agregación financieras y filtros de negocio.