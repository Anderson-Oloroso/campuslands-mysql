# ejercicio 041 - validaciones simples para pingpong

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

1. ejecutar el script `ddl/schema.sql` para crear la base de datos relacional del club de pingpong, tablas normalizadas, llaves foraneas y restricciones de validacion (*check constraints* en edad y puntaje).
2. ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de categorias de nivel, jugadores, correos unicos, edades, puntajes de ranking y estados operativos.
3. ejecutar el script `dql/consultas.sql` para realizar consultas analiticas, filtros por estado, calculos de promedios, listados ordenados y el top 3 de mejores jugadores del club.

## decisiones tecnicas

* se diseño el esquema relacional `pingpong_club_db` orientado a la gestion de deportistas, categorias y control de rendimiento en tenis de mesa.
* **estrategia de validacion simple:**
  - se incorporo una restricción `chk_edad_minima` para asegurar que ningun jugador registrado sea menor de 12 años.
  - se implemento una restricción `chk_puntaje_positivo` para garantizar que los puntos de ranking nunca sean valores negativos.
  - se utilizo un campo `enum` para controlar de forma estricta los estados del jugador (*activo*, *lesionado*, *suspendido*, *retirado*).
* cumplimiento estricto de la regla de comentarios (cero mayusculas y cero tildes en todo el codigo sql).

## salida y resultados esperados

* base de datos plenamente funcional y validada mediante restricciones integrales en mysql.
* insercion correcta de registros con casos normales y limites.
* consultas dql estructuradas con alias claros, funciones de agregacion y ordenamientos utiles para la administracion del club de pingpong.