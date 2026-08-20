# Ejercicio 053 - Roles y permisos para arquitectura 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `proyectos_arquitectura` con restricciones para área, presupuesto y estado.
- Se insertaron 10 registros con diferentes proyectos, arquitectos, presupuestos y estados.
- Se crearon los roles `arquitectura_lector` y `arquitectura_gestor`.
- El rol lector tiene permiso `SELECT` y el rol gestor tiene permisos `SELECT`, `INSERT`, `UPDATE` y `DELETE`.
- Se utilizaron agregaciones, filtros, ordenamientos, ranking y `SHOW GRANTS` para verificar los permisos.

## Estructura 
avanzado/ejercicio-053/
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