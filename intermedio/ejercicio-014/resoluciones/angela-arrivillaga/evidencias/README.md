# Ejercicio 014 - Vistas simples para saga de ciencia ficción

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

* Se utilizó la base de datos `sci_fi_saga_db`.
* Se implementaron **vistas simples** (`vw_misiones_activas` y `vw_resumen_facciones`) para encapsular consultas relacionales recurrentes, facilitando el acceso a reportes operativos de misiones en curso y métricas consolidadas por facción estelar.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para garantizar que el nivel de peligrosidad de las misiones se encuentre dentro de una escala táctica válida (1 a 10) y que la duración en meses sea estrictamente positiva.
* Se estructuraron 4 registros de facciones espaciales y 8 registros de misiones diversas para permitir pruebas exhaustivas de vistas, agregaciones y filtros analíticos complejos.

## Salida y resultados esperados

* Vista de misiones activas: Listado filtrado en tiempo real que muestra únicamente las misiones con estado `planificada` o `en_curso`, relacionando sus facciones y niveles de riesgo.
* Vista de resumen por facción: Indicadores estadísticos globales que calculan el volumen de misiones, la peligrosidad media y el tiempo acumulado de operaciones por cada facción estelar.
* Top 3 de operaciones de alto riesgo: Ranking analítico de las misiones más peligrosas y de mayor duración en toda la saga.
* Reporte de misiones completadas: Historial de operaciones finalizadas con éxito ordenadas por su duración temporal.
* Análisis por estado operativo: Resumen cuantitativo agrupado por la condición de la misión evaluando volumen, riesgo promedio y meses totales invertidos.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta creación de las tablas relacionales y las vistas de base de datos.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM misiones_espaciales;` confirmando el cumplimiento del requisito mínimo de 8 registros insertados.
* **DQL:** Salida en consola de las consultas sobre vistas y reportes avanzados demostrando la reutilización de lógica de negocio y análisis estadístico.