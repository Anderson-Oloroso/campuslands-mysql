# Ejercicio 034 - Triggers para garaje de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `motos` y `auditoria_motos`.
- Se aplicaron restricciones para precio, año y estado.
- Se insertaron 10 motos y se realizaron actualizaciones de prueba.
- Se utilizaron triggers `BEFORE INSERT`, `BEFORE UPDATE` y `AFTER INSERT`.
- Se incluyeron filtros, ordenamientos, agregaciones, `GROUP BY`, `HAVING`, `JOIN` y ranking.

## Estructura 
avanzado/ejercicio-034/
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