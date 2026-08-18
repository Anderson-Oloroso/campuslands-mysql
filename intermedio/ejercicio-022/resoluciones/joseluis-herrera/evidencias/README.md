# Ejercicio 022 - Normalizacion 2FN para animacion 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se crearon `proyectos_animacion`, `animadores` y `proyecto_animador`.
* La tabla intermedia utiliza una clave primaria compuesta para la relación entre proyectos y animadores.
* Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `ENUM` y `CHECK`.
* Se insertaron 8 proyectos, 6 animadores y 12 asignaciones.
* Se utilizaron `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `COUNT` y `LIMIT`.


## Estructura 
intermedio/ejercicio-022/
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
            