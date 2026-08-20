# Ejercicio 036 - Normalización 1FN para Autos Hiperdeportivos

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

* Se diseñó el esquema relacional `hiperdeportivos_1fn_db` aplicando estrictamente los principios de la **Primera Forma Normal (1FN)**.
* Se eliminaron grupos repetitivos y columnas multivaluadas (como listas de tecnologías en un solo campo) separándolos en la tabla atómica `tecnologias_hiperautos`, garantizando que cada celda contenga un valor atómico y que cada registro posea una llave primaria unívoca.
* Se implementaron restricciones de integridad (`CHECK` para potencias mínimas de hiperautos y precios positivos, así como `ENUM` para los estados de producción).

## Salida y Resultados Esperados

* Estructura relacional limpia y normalizada sin redundancias de listas de texto.
* Inserción de 6 fabricantes, 8 hiperautos y múltiples registros de tecnologías atómicas asociadas.
* Consultas analíticas eficientes utilizando `JOIN`, funciones de agregación (`COUNT`, `DISTINCT`) y filtrados avanzados.

## Evidencias

Para demostrar la correcta ejecución:

* DDL: Creación de tablas normalizadas con claves foráneas en cascada y restricciones estrictas.
* DML: Inserción de datos detallados y coherentes con el mundo de los hiperdeportivos.
* DQL: Reportes relacionales que demuestran las ventajas de la atomicidad en 1FN.