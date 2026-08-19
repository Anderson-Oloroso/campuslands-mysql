# Ejercicio 014 - Fechas basicas para saga de ciencia ficcion

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

* Se utilizó la base de datos `saga_scifi_db`.
* Se diseñó una entidad principal `eventos_saga` enfocada en la gestión de hitos temporales, integrando tipos de datos `DATE` para el manejo preciso de marcas temporales reales y campos de control de estado (`ENUM`).
* Se incorporaron restricciones de validación mediante `CHECK` para garantizar que los años en el universo de ficción sean lógicos y coherentes.
* Se estructuraron exactamente 8 registros cronológicos distribuidos en diversos tipos de eventos para permitir la aplicación de filtros por rangos de fechas, funciones de extracción temporal (`YEAR`) y cálculos analíticos de intervalos (`DATEDIFF`).

## Salida y resultados esperados

* Cronología general: Listado ordenado de manera ascendente de todos los eventos históricos y futuros dentro de la saga.
* Agrupación por hito: Resumen estadístico que cuantifica la frecuencia de los tipos de eventos y localiza el registro más antiguo de cada categoría.
* Filtro avanzado temporal: Selección estricta de eventos ocurridos con posterioridad al año 2220 que se encuentran operativamente activos.
* Extracción de año: Proyección de datos que aísla el año real mediante funciones nativas de manipulación de fechas en MySQL.
* Análisis de lapso temporal: Reporte métrico que calcula la cantidad exacta de días y años transcurridos desde cada fecha histórica registrada hasta la actualidad operativa.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `DESCRIBE eventos_saga;` para validar los tipos de datos de tipo fecha y las restricciones aplicadas.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM eventos_saga;` confirmando el cumplimiento del mínimo de 8 registros requeridos.
* **DQL:** Salida en consola de las 5 consultas requeridas demostrando ordenamiento cronológico, uso de funciones de fecha y cálculos de diferencias temporales.