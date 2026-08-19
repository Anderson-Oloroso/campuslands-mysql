# Ejercicio 018 - GROUP BY para viajes y turismo

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

* Se utilizó la base de datos `viajes_turismo_db`.
* Se implementó el uso intensivo de la cláusula **GROUP BY** combinada con funciones de agregación (`COUNT`, `AVG`, `SUM`, `MIN`, `MAX`) para extraer indicadores gerenciales y analíticos sobre destinos turísticos internacionales.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el costo promedio diario sea estrictamente positivo y que la calificación se mantenga en el rango válido de 0.00 a 5.00.
* Se estructuraron 8 registros de destinos turísticos diversos distribuidos en múltiples continentes, países y categorías (Aventura, Playa y Sol, Cultural, Ecoturismo y Urbano) para permitir pruebas robustas de filtrado con `HAVING`, agrupaciones compuestas y formateo de datos.

## Salida y resultados esperados

* Reporte por categoría turística: Análisis agrupado que calcula el volumen de destinos, el costo diario promedio con formato monetario y la calificación media por segmento vacacional.
* Consolidado por continente: Resumen geográfico que detalla la cantidad de destinos, rangos de inversión (mínimo y máximo) y el promedio de gasto diario por región.
* Categorías destacadas (`HAVING`): Consulta filtrada que aisla exclusivamente aquellas categorías que cuentan con más de un destino registrado.
* Ranking por país: Evaluación agrupada por nación y continente mostrando la calificación máxima obtenida y el costo medio asociado.
* Análisis por estado operativo: Resumen cuantitativo y financiero agrupado por el estado del destino (activo, próximamente, suspendido).

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM destinos_turisticos;` confirmando la inserción exacta de los 8 registros requeridos.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando el dominio avanzado de agrupaciones condicionales, funciones agregadas y formateo de resultados.