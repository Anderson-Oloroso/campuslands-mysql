ejercicio 007 - normalizacion 2fn para liga de futbol

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
* se aplico la segunda forma normal (2fn) eliminando las dependencias parciales. para ello, se separo la informacion en tres tablas independientes y relacionales: equipos_liga, estadios y partidos_liga.
* cada columna que no forma parte de las llaves depende completamente de la llave primaria de su respectiva tabla.
* se incorporaron restricciones de integridad referencial con foreign keys y validaciones de capacidad y goles mediante constraints chk.

salida y resultados esperados
* consulta 1: muestra el detalle completo de los partidos cruzando los nombres de los equipos y estadios mediante uniones sql.
* consulta 2: calcula el total de goles anotados por cada equipo jugando en condición de local mediante funciones de agregacion y agrupamiento.
* consulta 3: retorna el top 3 de los estadios con mayor capacidad de aforo.
* consulta 4: filtra los equipos cuyo estado sea activo ordenandolos alfabeticamente.
* consulta 5: genera un reporte filtrando aquellos encuentros deportivos que registraron mas de dos goles en total.

evidencias de ejecucion
- ddl: creacion exitosa de las tablas equipos_liga, estadios y partidos_liga aplicando normalización 2fn y llaves foraneas.
- dml: insercion correcta de 8 equipos, 5 estadios y 8 registros de partidos con datos coherentes.
- dql: verificacion del funcionamiento de joins, agrupaciones y filtros complejos sobre el esquema normalizado.