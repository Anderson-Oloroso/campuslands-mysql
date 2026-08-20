# ejercicio 027 - window functions para videojuego de accion y aventura

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

1. ejecutar el script `ddl/schema.sql` para crear la base de datos relacional del videojuego de accion y aventura, tablas normalizadas, llaves foraneas y restricciones de validacion.
2. ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de regiones, facciones, personajes, estados y artefactos recolectados.
3. ejecutar el script `dql/consultas.sql` para validar el uso avanzado de funciones de ventana (`window functions`) en mysql, incluyendo `dense_rank`, `partition by`, `lag`, `lead`, sumas acumulativas y `row_number`.

## decisiones tecnicas

* se diseño el esquema relacional `accion_aventura_db` enfocado en el seguimiento de heroes, mundos explorados, pertenencia a facciones y misiones de recoleccion.
* **estrategia con window functions:**
  - se implementaron 5 consultas analiticas aprovechando marcos y particiones por rangos de experiencia, regiones y gremios de facciones.
* se estructuraron reportes que responden a requerimientos complejos de analitica de videojuegos, como ranking general de tesoros, desviaciones de experiencia por region, comparaciones relativas entre compañeros de faccion y totales acumulados en orden cronologico.
* cumplimiento estricto de la regla de comentarios (cero mayusculas y cero tildes en todo el codigo sql).

## salida y resultados esperados

* base de datos completamente funcional y relacional para el modulo de accion y aventura.
* insercion exitosa de datos con restricciones de integridad y validaciones numéricas.
* consultas dql avanzadas ejecutadas con exito mediante funciones de ventana estructuradas limpiamente.