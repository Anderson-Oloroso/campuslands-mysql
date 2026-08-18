# Ejercicio 018 - GROUP BY para viajes y turismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `destinos`.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `DEFAULT` y `CHECK`.
- Se insertaron 12 destinos.
- Se utilizaron `GROUP BY`, `COUNT`, `AVG`, `MIN`, `MAX` y `HAVING`.
- Las consultas agrupan destinos por país, tipo y disponibilidad.

## Estructura 
intermedio/ejercicio-018/
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