# Evidencias - Ejercicio 058

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `cursos_academia`.
- Se utilizó una columna `JSON` para almacenar información flexible del curso.
- Se aplicó una validación `CHECK` sobre la información JSON y el precio.
- Se insertaron 10 cursos con instructor, duración, modalidad, tecnologías, requisitos y cupo.
- Se utilizaron `JSON_EXTRACT`, `JSON_UNQUOTE` y `JSON_CONTAINS`.

## Evidencias

Guardar evidencias de:

- Creación correcta de la tabla.
- Inserción de los 10 registros.
- Ejecución de las 6 consultas.
- Extracción y filtrado de información almacenada en JSON.

## Estructura 
avanzado/ejercicio-058/
└── resoluciones/
    └── joseluis-herrera/
        ├── ddl/
        │   └── schema.sql
        ├── dml/
        │   └── inserts.sql
        ├── dql/
        │   └── consultas.sql
        └── evidencias/
            └── README.md