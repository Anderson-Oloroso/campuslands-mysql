# ejercicio 026 - check para videojuego rpg

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

* se utilizo la base de datos `videojuego_rpg_db`.
* aplicacion estricta de restricciones `check`:
  - se incorporaron validaciones de dominio mediante reglas de rango (`between` y operadores logicos) para asegurar que los niveles de personaje se mantengan entre 1 y 100, la experiencia no sea negativa, y los puntos de vida y mana se encuentren dentro de limites funcionales del juego.
* se estructuraron relaciones con claves foráneas para vincular clases y facciones con la entidad principal de personajes.

## salida y resultados esperados

* listado de personajes activos ordenados por nivel de forma descendente.
* filtrado de personajes con nivel superior a 75 y su estado vital.
* reporte estadistico de nivel y experiencia agrupado por clase de personaje.
* filtrado de personajes en estados dinamicos como combate o inconsciencia.
* analisis de miembros y vida promedio agrupados por faccion.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de esquema con restricciones `check` avanzadas.
* dml: insercion de registros validos que cumplen con los rangos de validacion.
* dql: consultas relacionales y de agregacion ejecutadas correctamente.