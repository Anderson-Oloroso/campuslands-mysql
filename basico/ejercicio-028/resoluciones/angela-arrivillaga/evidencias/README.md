# Ejercicio 028 - Filtros por estado para academia tech

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

* Se utilizó la base de datos `academia_tech_db`.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el promedio de calificación se mantenga en el rango porcentual de 0.00 a 100.00.
* Se estructuró la entidad `estudiantes_academia` con un atributo clave de estado (`estado_academico` mediante `ENUM`) con opciones acotadas ('activo', 'graduado', 'suspendido', 'retirado') para practicar filtros condicionales robustos.
* Se diseñaron 5 consultas DQL orientadas a la toma de decisiones administrativas, utilizando filtrado directo, operadores lógicos avanzados (`IN`, `NOT IN`) y reportes analíticos con funciones de agregación (`COUNT`, `AVG`, `ROUND`, `CONCAT`).

## Salida y resultados esperados

* Filtrado de estudiantes activos: Listado del alumnado en curso ordenado por desempeño académico.
* Filtrado de egresados: Extracción de estudiantes graduados para análisis de éxito institucional.
* Agrupación de talento positivo (`IN`): Combinación de estados activos y graduados para evaluar el total histórico de buen rendimiento.
* Exclusión de bajas o suspensiones (`NOT IN`): Limpieza de registros para auditorías de estudiantes en buen pie administrativo.
* Reporte consolidado por estado: Estadísticas que muestran conteos y promedios porcentuales agrupados por cada categoría de estado académico.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM estudiantes_academia;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL:** Salida en consola de las 5 consultas analíticas demostrando el dominio de filtros por estado y funciones de agregación en MySQL.