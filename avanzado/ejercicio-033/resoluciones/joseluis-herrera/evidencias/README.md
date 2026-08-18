# Ejercicio 033 - funciones SQL para inventario de skins shooter

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `inventario_skins` con restricciones para precio, estado y rareza.
- Se insertaron 12 registros.
- Se utilizaron funciones de texto, numéricas y agregación como `UPPER`, `CHAR_LENGTH`, `ROUND`, `CONCAT`, `FORMAT`, `MIN`, `MAX`, `AVG`, `SUM` y `COUNT`.
- Se utilizó `CASE` para clasificar las skins según su precio.

## Estructura 
avanzado/ejercicio-033/
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