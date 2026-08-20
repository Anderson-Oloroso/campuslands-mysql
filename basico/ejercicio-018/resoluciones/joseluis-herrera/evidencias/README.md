# Ejercicio 018 - PRIMARY KEY para viajes y turismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `destinos`.
- Se utilizó `id_destino` como `PRIMARY KEY` con `AUTO_INCREMENT`.
- Se aplicaron `NOT NULL`, `DEFAULT` y `CHECK` para validar los datos.
- Se insertaron 10 destinos.
- Se utilizaron filtros, ordenamientos, `AVG`, `COUNT`, `GROUP BY` y `LIMIT`.

## Estructura 
basico/ejercicio-018/
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