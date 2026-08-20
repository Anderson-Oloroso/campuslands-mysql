# Evidencias - Ejercicio 060

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `categorias` y `equipos_streaming`.
- Se relacionaron mediante una clave foránea.
- Se aplicaron restricciones `UNIQUE`, `CHECK`, `PRIMARY KEY` y `FOREIGN KEY`.
- Se cargaron 5 categorías y 10 equipos.
- Se utilizaron `JOIN`, `GROUP BY`, `COUNT`, `AVG`, filtros y ordenamientos.

## Evidencias

Guardar evidencias de:

- Creación de las tablas.
- Inserción de categorías y equipos.
- Resultados de las consultas.
- Funcionamiento de la relación entre equipos y categorías.

## Estructura 
basico/ejercicio-060/
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