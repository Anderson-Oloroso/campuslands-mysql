# ejercicio 030 - carga de datos para equipo de streaming

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

* se utilizo la base de datos `equipo_streaming_db`.
* diseño relacional con tablas normalizadas para categorias de equipo, marcas de hardware y dispositivos de streaming.
* se aplicaron restricciones de dominio (`check`) para asegurar precios de equipos no negativos y validación de unicidad en seriales y nombres.

## salida y resultados esperados

* inventario detallado de equipos de streaming con relaciones de categoria y marca.
* filtrado de dispositivos operativos listos para transmision.
* estadisticas de promedios de precios y conteo de equipos por categoria.
* seguimiento de equipos en mantenimiento o retirados del estudio.
* analisis financiero de inversion total agrupada por marca de hardware.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de esquemas relacionales con integridad referencial y tipos de datos estrictos.
* dml: insercion robusta de datos masivos iniciales cubriendo multiples escenarios de estado y marcas.
* dql: consultas de reportes con uniones relacionales, agregaciones y filtros de negocio.