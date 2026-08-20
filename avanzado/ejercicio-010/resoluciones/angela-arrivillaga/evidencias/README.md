# Ejercicio 010 - Backup logico para carreras urbanas

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

* Se utilizó la base de datos `carreras_urbanas`.
* Se diseñaron tablas para gestionar categorías por rangos de edad, datos personales de corredores y registros de inscripciones con control de dorsales únicos y estados de pago.
* Se estructuraron los scripts considerando la compatibilidad óptima para operaciones de respaldo y restauración lógica mediante herramientas de línea de comandos estándar de MySQL (`mysqldump`).
* Se incluyeron 8 registros de corredores y sus respectivas inscripciones para permitir evaluar agregaciones, filtros por estado y validaciones con `HAVING`.

## Salida y resultados esperados

* Listado de inscritos: Muestra la relación completa entre corredores, categorías y números de dorsal asignados.
* Agrupación por categoría: Cuantifica el volumen de participación por cada división de la carrera urbana.
* Filtro de pagos: Identifica únicamente a los corredores con estatus de inscripción confirmado (`pagado`).
* Restricción de grupo: Filtra categorías con alta concurrencia mediante `HAVING`.
* Resumen de respaldo: Consulta agregada multinivel que verifica la integridad y conteo total de entidades antes de realizar un volcado lógico.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `SHOW TABLES;` y validando las restricciones estructurales.
* **DML:** Comprobación de integridad con `SELECT COUNT(*) FROM inscripciones;` confirmando los 8 registros mínimos requeridos.
* **DQL:** Salida estructurada de las 5 consultas DQL incluyendo el reporte de validación para backup lógico.