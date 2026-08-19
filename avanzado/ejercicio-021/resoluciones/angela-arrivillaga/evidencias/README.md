# Ejercicio 021 - Uso de EXPLAIN para Dibujo Digital

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

1. Ejecutar el script `ddl/schema.sql` para crear la base de datos, las tablas normalizadas y los índices optimizados para `EXPLAIN`.
2. Ejecutar el script `dml/inserts.sql` para poblar con datos realistas e íntegros.
3. Ejecutar el script `dql/consultas.sql` para analizar los planes de ejecución de consultas mediante la instrucción `EXPLAIN` y `EXPLAIN FORMAT=TREE`.

## Decisiones Técnicas

* Se diseñó el esquema relacional `dibujo_digital_explain_db` enfocado en el análisis de rendimiento de consultas SQL mediante la herramienta **`EXPLAIN`**.
* **Estrategia de Indexación:** 
  - Se crearon índices estratégicos como `idx_obras_estado` (sobre el estado de publicación) y el índice compuesto `idx_obras_artista_fecha` (sobre `id_artista` y `fecha_creacion`) para optimizar filtros y ordenamientos analizados con `EXPLAIN`.
  - Se relacionaron correctamente las tablas de artistas, software, obras y pinceles asegurando claves foráneas con acciones en cascada o restricción.
* Se estructuraron 5 consultas DQL orientadas a medir el costo, uso de índices (`possible_keys`, `key`), tipos de acceso (`ref`, `range`, `ALL`) y planes de ejecución estructurados (`EXPLAIN FORMAT=TREE`).

## Salida y Resultados Esperados

* Modelo relacional robusto con trazabilidad de rendimiento optimizada para motores MySQL.
* Inserción exitosa de artistas, software de dibujo profesional, obras digitales con resoluciones y pesos reales, y relación con pinceles digitales.
* Sentencias `EXPLAIN` preparadas para verificar el impacto de los índices en consultas de filtrado, agregación y uniones múltiples.