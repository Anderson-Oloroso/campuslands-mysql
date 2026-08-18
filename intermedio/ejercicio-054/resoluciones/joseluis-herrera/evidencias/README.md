# Ejercicio 054 - FOREIGN KEY para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `soldadores` y `trabajos_soldadura`.
- `trabajos_soldadura` utiliza `id_soldador` como `FOREIGN KEY`.
- Se aplicaron restricciones para experiencia, estado, horas y costo.
- Se insertaron 6 soldadores y 10 trabajos.
- Se utilizaron `JOIN`, `GROUP BY`, agregaciones, filtros, ordenamientos y `LIMIT`.

## Estructura 
intermedio/ejercicio-054/
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