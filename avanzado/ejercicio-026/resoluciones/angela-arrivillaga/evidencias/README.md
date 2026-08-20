# ejercicio 026 - cte para videojuego rpg

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

1. ejecutar el script `ddl/schema.sql` para crear la base de datos relacional del videojuego rpg, tablas normalizadas, llaves foraneas y restricciones de validacion.
2. ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de clases, jugadores, personajes, misiones y el historial de misiones completadas.
3. ejecutar el script `dql/consultas.sql` para validar el uso avanzado de expresiones de tabla comunes (cte y cte recursivas), subconsultas estructuradas y reportes analiticos.

## decisiones tecnicas

* se diseño el esquema relacional `rgp_videojuego_db` enfocado en la gestion de jugadores, clases de personajes, atributos dinamicos y progreso en misiones de dificultad variable.
* **estrategia con ctes:**
  - se implementaron 5 consultas complejas utilizando expresiones de tabla comunes (`with`), incluyendo ctes multiples y una cte recursiva para la generacion de rangos de niveles en el servidor.
* se estructuraron reportes analiticos que responden a preguntas de negocio reales del videojuego, tales como rendimiento de clases frente al promedio global, ranking de riqueza de jugadores y auditoria de misiones epicas.
* cumplimiento estricto de la regla de comentarios (cero mayusculas y cero tildes en todo el codigo sql).

## salida y resultados esperados

* base de datos completamente funcional y relacional para el modulo rpg.
* insercion exitosa de datos con restricciones de integridad y validaciones de nivel/oro.
* consultas dql avanzadas y ejecutables mediante ctes estructuradas limpiamente.