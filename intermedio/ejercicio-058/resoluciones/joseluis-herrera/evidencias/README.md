# Evidencias - Ejercicio 058

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `estudiantes`, `cursos` y `estudiante_curso`.
- `estudiante_curso` funciona como tabla puente para representar la relación muchos a muchos.
- Se utilizaron claves primarias, claves foráneas, `UNIQUE`, `CHECK` y `ENUM`.
- Se insertaron 8 estudiantes, 6 cursos y 15 inscripciones.
- Se utilizaron `INNER JOIN`, `GROUP BY`, `HAVING`, filtros, agregaciones y ordenamientos.

## Evidencias

Guardar evidencias de:

- Creación correcta de las tres tablas.
- Inserción de estudiantes, cursos e inscripciones.
- Ejecución de las 6 consultas.
- Resultados de estudiantes por curso y cursos por estudiante.
- Resultados de promedios y filtros principales.

## Estructura 
intermedio/ejercicio-058/
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