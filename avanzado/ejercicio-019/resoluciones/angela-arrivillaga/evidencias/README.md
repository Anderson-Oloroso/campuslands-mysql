# ejercicio 019 - triggers para paracaidismo

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar ddl/schema.sql.
2. ejecutar dml/inserts.sql.
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* se utilizo la base de datos relacional `paracaidismo_db`.
* especialización en la creación y gestión de **Disparadores (Triggers)** en MySQL (`AFTER INSERT`, `BEFORE UPDATE`) para automatizar la actualización de contadores de saltos, estados de equipos de paracaidismo y registros de auditoría en la bitácora ante cambios en los saltos.
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar alturas de salto mínimas seguras (>= 3000 pies) y contadores no negativos con precisión numérica.

## salida y resultados esperados

* automatización completa del inventario de equipos y sus estados mediante triggers en inserciones y actualizaciones.
* listado detallado de saltos de paracaidismo con relación de equipos e instructores.
* filtrado de equipos disponibles con alto rendimiento de saltos.
* reporte estadístico de instructores con promedios de altura y efectividad.
* top 5 de equipos con más saltos acumulados y auditoría de eventos del sistema.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquema relacional con claves foráneas protegidas y tabla de bitácora para triggers.
* dml: inserción de equipos, saltos y definición formal de triggers avanzados en MySQL.
* dql: consultas de reporte analítico, filtrado por estados y revisión de auditoría automática.