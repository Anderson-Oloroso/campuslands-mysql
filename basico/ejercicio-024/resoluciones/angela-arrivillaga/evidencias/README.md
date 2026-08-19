# Ejercicio 024 - DELETE controlado para soldadura

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

* Se utilizó la base de datos `soldadura_industrial_db`.
* Se implementó el uso profesional y seguro de la sentencia de eliminación **DELETE** utilizando filtros condicionales estrictos (`WHERE`), evitando eliminaciones masivas accidentales y garantizando la integridad de los datos en procesos industriales.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el amperaje sea positivo y que el porcentaje de calidad de inspección se mantenga dentro del rango lógico de 0.00 a 100.00.
* Se estructuraron 8 registros iniciales de cordones de soldadura con procesos especializados (GTAW, SMAW, GMAW, FCAW) y diversos estados (`aprobado`, `rechazado`, `revision_pendiente`, `obsoleto`) para simular escenarios reales de depuración de registros en control de calidad.

## Salida y resultados esperados

* Depuración de registros obsoletos: Eliminación de historiales descartados por la planta técnica.
* Eliminación por umbral crítico: Supresión de cordones con porcentajes de calidad deficientes (< 50%).
* Eliminación por clave específica: Remoción puntual de un registro erróneo mediante su código único.
* Reporte de control remanente: Listado ordenado de los cordones vigentes que superaron los filtros de calidad.
* Resumen analítico agrupado: Estadísticas de totales y promedios de calidad agrupados por estado actual.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM registros_soldadura;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL / DELETE:** Salida en consola de las sentencias de eliminación ejecutadas de forma segura y verificación mediante reportes tabulares estructurados.