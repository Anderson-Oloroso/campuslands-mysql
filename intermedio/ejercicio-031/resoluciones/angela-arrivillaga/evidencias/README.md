# Ejercicio 031 - INNER JOIN para Torneo Esports MOBA

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

* Se utilizó la base de datos relacional `torneos_moba_db`.
* Énfasis en la aplicación de **INNER JOIN** en MySQL para conectar entidades relacionales clave: jugadores con sus respectivos equipos, partidas con equipos azules, rojos y ganadores, así como cruces para reportes de regiones y conteo de victorias.
* Aplicación de restricciones estrictas (`CHECK` para duraciones mayores a 10 minutos y KDA no negativos) y tipos de datos precisos para indicadores de rendimiento de eSports.

## Salida y Resultados Esperados

* Estructura relacional limpia con tablas normalizadas para equipos, jugadores y partidas oficiales de MOBA.
* Inserción de registros realistas que permiten evaluar cruces mediante `INNER JOIN`.
* Consultas enfocadas en requerimientos profesionales: listados detallados de jugadores y equipos, reportes regionales de KDA, top 5 de jugadores destacados y conteo de victorias por franquicia.

## Evidencias

Para demostrar la correcta ejecución:

* DDL: Diseño de esquema relacional con múltiples llaves foráneas y restricciones de integridad.
* DML: Inserción de datos con coherencia temática de eSports y torneos competitivos.
* DQL: Consultas con `INNER JOIN` simple y múltiple, funciones de agregación (`COUNT`, `AVG`), ordenamientos y límites de registros.