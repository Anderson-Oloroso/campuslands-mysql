# Ejercicio 019 - Triggers para paracaidismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `saltos` y `auditoria_saltos`.
- Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `DEFAULT` y `CHECK`.
- Se insertaron 10 registros.
- Se implementaron triggers `AFTER INSERT` y `BEFORE UPDATE`.
- El primer trigger registra automáticamente los saltos insertados.
- El segundo impide cancelar un salto que ya fue completado.

## Estructura 
avanzado/ejercicio-019/
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