# ejercicio 015 - optimizacion para biblioteca gamer

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar ddl/schema.sql.
2. ejecutar dml/inserts.sql.
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* se utilizo la base de datos relacional `biblioteca_gamer_db`.
* especialización en la **optimización de bases de datos relacionales en MySQL** mediante la creación estratégica de índices (`INDEX`) en columnas clave de alta consulta (`titulo_juego`, `estado_jugo`, `calificacion_meta`) para mejorar el rendimiento de los planes de ejecución (`EXPLAIN`).
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar precios no negativos y calificaciones de Metacritic válidas de 0 a 100 con precisión `DECIMAL`.

## salida y resultados esperados

* planes de ejecución optimizados mediante `EXPLAIN` para verificar el uso correcto de índices en consultas de búsqueda y filtrado.
* listado filtrado de videojuegos completados con alta calificación.
* reporte analítico de inversiones y promedios por plataforma de juego.
* top 5 de juegos con mayor cantidad de horas invertidas por el usuario.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño relacional optimizado con índices explícitos y restricciones de integridad.
* dml: inserción de múltiples registros realistas de videojuegos y plataformas.
* dql: consultas optimizadas orientadas al análisis de rendimiento y validación con `EXPLAIN`.