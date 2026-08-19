# ejercicio 021 - normalizacion 1fn para dibujo digital

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

* se utilizo la base de datos `dibujo_digital_db`.
* cumplimiento de la primera forma normal (1fn):
  - se aseguro que todos los dominios contengan valores atomicos e indivisibles.
  - se eliminaron grupos repetitivos creando una tabla relacional satelite (`etiquetas_lienzo`).
* se aplicaron restricciones de validacion estrictas (`check`) en el esquema ddl.
* se estructuraron 8 registros principales de obras de arte digital y multiples registros de etiquetas atomicas.

## salida y resultados esperados

* consulta de obras terminadas.
* filtrado de alta complejidad.
* consulta relacional 1fn (`join`).
* filtrado operativo (`not in`).
* reporte analitico por software.

## evidencias

para demostrar la correcta ejecucion:

* ddl: captura de consola ejecutando comandos descriptivos de esquema.
* dml: comprobacion mediante conteo confirmando la insercion exacta de registros.
* dql: salida en consola de las consultas analiticas.