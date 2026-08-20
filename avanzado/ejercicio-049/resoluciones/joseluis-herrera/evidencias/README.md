# Ejercicio 049 - Triggers para paracaidismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `saltos` y `auditoria_saltos`.
- Se utilizaron claves primarias, clave foránea y restricciones `CHECK`.
- Se insertaron 8 registros de saltos.
- Se implementó un trigger `AFTER INSERT` para registrar automáticamente cada salto.
- Se utilizaron filtros, ordenamientos, cálculos, `GROUP BY`, `HAVING` e `INNER JOIN`.

## Estructura 
avanzado/ejercicio-049/
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