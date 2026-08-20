# Ejercicio 051 - Módulo de Análisis EXPLAIN: Dibujo Digital

## Descripción de la Solución
Este módulo implementa un esquema de base de datos para proyectos de **dibujo digital**, diseñado para practicar el análisis de rendimiento mediante la sentencia `EXPLAIN` (y variantes como `EXPLAIN FORMAT=JSON` y `EXPLAIN ANALYZE`) en MySQL.

## Análisis de Rendimiento e Índices
- `idx_ilustraciones_artista_estado`: Permite reducir el tipo de acceso de `ALL` (Full Table Scan) a `ref` al filtrar las obras por artista y su estado actual.
- `idx_ilustraciones_software_tiempo`: Optimiza las agrupaciones e intersecciones de proyectos analizando el tiempo invertido y la herramienta utilizada.
- `idx_ilustraciones_fecha`: Facilita la ordenación rápida por fecha sin incurrir en operaciones costosas de `Filesort`.

## Estructura del Proyecto
```text
basico/ejercicio-051/resoluciones/tu-nombre-apellido/
├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql