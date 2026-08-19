# Ejercicio 020 - Índices para Estudio de Tatuajes

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

* Se utilizó la base de datos relacional `estudio_tatuajes_db`.
* Implementación de **Índices en MySQL** (`INDEX` y `UNIQUE INDEX`) para optimizar el rendimiento de consultas frecuentes, tales como búsquedas por rango de fechas, filtros combinados de estado y tatuador, filtrado por especialidad artística y búsquedas ágiles de clientes por correo electrónico.
* Aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar precios de tatuajes positivos y años de experiencia no negativos.

## Salida y Resultados Esperados

* Creación de esquemas relacionales robustos con claves foráneas protegidas y optimización con índices.
* Inserción de catálogos profesionales de tatuadores, clientes y registro de citas.
* Consultas analíticas de rendimiento de ingresos por tatuador, listados cronológicos optimizados y reportes del top 5 de artistas según su experiencia.

## Evidencias

Para demostrar la correcta ejecución:

* DDL: Diseño de esquema relacional con restricciones e índices estratégicos explicados.
* DML: Inserción de datos variados que permiten probar filtros, ordenamientos y análisis de negocio.
* DQL: Consultas con alias claros, funciones de agregación y aprovechamiento de los índices creados.