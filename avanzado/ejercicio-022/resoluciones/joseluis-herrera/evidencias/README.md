# Ejercicio 022 - Vistas avanzadas para animacion 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se crearon las tablas `proyectos_animacion`, `animadores` y `proyecto_animador`.
* Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `ENUM` y `CHECK`.
* Se insertaron 10 proyectos, 6 animadores y 16 asignaciones.
* Se crearon 3 vistas para centralizar reportes de proyectos, equipos e indicadores por categoría.
* Se utilizaron `JOIN`, `GROUP BY`, `HAVING`, `CASE`, `COUNT`, `AVG`, `SUM`, `DISTINCT`, `ORDER BY` y `LIMIT`.

## Estructura 
avanzado/ejercicio-022/
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