# Ejercicio 050 - Módulo de Índices: Estudio de Tatuajes

## Descripción de la Solución
Este módulo implementa una solución optimizada en MySQL para la gestión de agenda, artistas, clientes y cotizaciones en un estudio de tatuajes. Se aplicó una estrategia de indexación técnica para reducir el costo de escaneo en tabla completa (*Full Table Scan*) a búsquedas por índice (*Index Range Scan*).

## Estrategia de Indexación
1. `idx_citas_artista_estado_fecha` (Compuesto): Optimiza el filtrado frecuente de la agenda de los artistas por estado (`programada`, `completada`) y orden cronológico.
2. `idx_citas_estilo_costo` (Compuesto): Agiliza las consultas analíticas de reportes financieros filtrados por categoría de estilo y rangos de precio.
3. `idx_citas_descripcion_ft` (`FULLTEXT`): Permite realizar búsquedas de texto completo sobre las descripciones de los diseños solicitados por los clientes sin degradación de rendimiento.

## Estructura del Proyecto
```text
avanzado/ejercicio-050/resoluciones/tu-nombre-apellido/
├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql