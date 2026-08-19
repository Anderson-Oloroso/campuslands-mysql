# Ejercicio 037 - Normalización 2FN para Liga de Fútbol

## Estructura del Proyecto

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

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones Técnicas

* Se estructuró la base de datos relacional `liga_futbol_2fn_db` cumpliendo estrictamente con la **Segunda Forma Normal (2FN)**.
* Se eliminaron dependencias parciales: la tabla relacional `participaciones_torneo` maneja exclusivamente atributos que dependen de toda la clave compuesta (`id_torneo` + `id_equipo`), mientras que las entidades de `equipos` y `torneos` se mantienen independientes con sus propias llaves primarias unívocas.
* Se implementaron restricciones de integridad con claves foráneas, restricciones de unicidad (`UQ_torneo_equipo`) y validaciones mediante `CHECK`.

## Salida y Resultados Esperados

* Estructura relacional robusta que evita redundancias y anomalías de actualización.
* Inserción de 6 equipos, 2 torneos, registros de participación histórica y futbolistas destacados con sus respectivos goles.
* Consultas DQL avanzadas para tablas de posición, promedios de rendimiento, goleadores y estadísticas defensivas.

## Evidencias

Para demostrar la correcta ejecución:

* DDL: Definición limpia de tablas normalizadas en 2FN.
* DML: Inserción de datos coherentes para simular una temporada completa de liga de fútbol.
* DQL: Consultas con uniones múltiples (`JOIN`), filtros lógicos y cálculos analíticos precisos.