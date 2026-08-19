# Ejercicio 032 - LEFT JOIN para Ranking Battle Royale

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

* Se utilizó la base de datos relacional `ranking_battle_royale_db`.
* Énfasis en la aplicación de **LEFT JOIN** en MySQL para preservar registros de la tabla izquierda aun cuando no existan coincidencias en la tabla derecha (ej: jugadores libres sin escuadrón o escuadrones sin miembros activos).
* Uso de funciones de control condicional como `COALESCE` para manejar valores nulos (`NULL`) de manera profesional y limpia en los reportes resultantes.

## Salida y Resultados Esperados

* Estructura relacional optimizada con llaves foráneas configuradas con `ON DELETE SET NULL` para mantener la integridad ante eliminaciones de escuadrones.
* Inserción de registros variados que incluyen casos límite (jugadores sin escuadrón asignado).
* Consultas profesionales que responden a necesidades de negocio: listado completo de jugadores con o sin escuadrón, conteo de miembros por escuadrón, ratios de eliminaciones por partida, top 5 de jugadores y detección de escuadrones vacíos.

## Evidencias

Para demostrar la correcta ejecución:

* DDL: Diseño de esquema relacional con restricciones y tipos de datos estrictos.
* DML: Inserción de datos coherentes con la temática de Battle Royale y casos límite de prueba.
* DQL: Consultas con `LEFT JOIN`, funciones de agregación, ordenamientos y filtrados de nulos (`IS NULL`).