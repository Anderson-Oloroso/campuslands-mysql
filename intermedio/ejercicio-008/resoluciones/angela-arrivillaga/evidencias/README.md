ejercicio 008 - normalizacion 3fn para futbol sala

estructura del proyecto
angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

ejecucion
1. ejecutar ddl/schema.sql.
2. ejecutar dml/inserts.sql.
3. ejecutar dql/consultas.sql.

decisiones tecnicas
* se utilizo la base de datos campuslands_mysql.
* se aplico la tercera forma normal (3fn) asegurando que no existan dependencias transitivas entre columnas que no forman parte de la clave primaria. para lograrlo, se crearon tablas independientes para posiciones_sala y equipos_sala, relacionandolas con la tabla principal de jugadores_sala mediante llaves foraneas.
* se implementaron restricciones de validacion de datos mediante constraints chk para asegurar que los dorsales y goles cumplan con rangos logicos.

salida y resultados esperados
* consulta 1: despliega el reporte completo de los jugadores cruzando sus respectivas entidades de equipos y posiciones mediante joins.
* consulta 2: retorna el podio de los 3 máximos goleadores del torneo de futbol sala.
* consulta 3: agrupa y suma los goles totales obtenidos por cada posicion tactica en la cancha.
* consulta 4: filtra los equipos en estado activo y cuenta cuantos jugadores registrados poseen.
* consulta 5: filtra aquellos jugadores cuyo rendimiento supere la marca de los 10 goles anotados.

evidencias de ejecucion
- ddl: creacion limpia de las tablas posiciones_sala, equipos_sala y jugadores_sala aplicando diseño relacional 3fn.
- dml: insercion correcta de registros independientes y dependientes con coherencia de datos.
- dql: verificacion exitosa de consultas con joins, funciones de agregacion, filtros y limites de registros.