# Ejercicio 025 - COUNT y SUM para laboratorio de fórmulas químicas

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

* Se utilizó la base de datos `formulas_quimicas_db`.
* Se implementó el uso analítico y avanzado de las funciones de agregación **COUNT** y **SUM**, combinadas con agrupamientos (`GROUP BY`), filtros condicionales (`WHERE` y `IN`) y funciones de formato y redondeo (`FORMAT`, `CONCAT`) para la generación de reportes financieros y de inventario químico.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que la cantidad en mililitros y el costo de producción en USD sean estrictamente positivos.
* Se estructuraron 8 registros de compuestos químicos variados clasificados por categorías técnicas (Ácido, Base, Sal, Óxido, Orgánico) y niveles de toxicidad para permitir pruebas estadísticas robustas.

## Salida y resultados esperados

* Conteo general: Obtención del número total de compuestos químicos registrados en el sistema del laboratorio.
* Sumatorias globales: Cálculo consolidado del volumen total de líquido preparado y la inversión financiera total.
* Agregación por categoría: Desglose de conteos y costos acumulados agrupados por el tipo de compuesto químico.
* Filtrado por nivel de riesgo: Análisis estadístico de volumen y costos enfocado exclusivamente en sustancias de alta peligrosidad.
* Reporte consolidado avanzado: Tabla resumen organizada por categoría con totales de compuestos, volúmenes acumulados, costos totales y promedios por unidad.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM formulas_quimicas;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL:** Salida en consola de las 5 consultas analíticas con funciones `COUNT` y `SUM` demostrando el dominio de la agregación de datos en MySQL.