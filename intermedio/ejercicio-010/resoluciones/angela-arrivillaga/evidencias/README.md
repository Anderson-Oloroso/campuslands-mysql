ejercicio 010 - unique para carreras urbanas

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
* se aplicaron restricciones unique clave para garantizar la integridad de los datos: codigo_carrera unico en carreras_urbanas, numero_documento y correo_electronico unicos en corredores.
* se implemento un indice unique compuesto (uk_carrera_corredor) en la tabla intermedia inscripciones_carrera para evitar que un mismo corredor se inscriba dos veces al mismo evento, asi como un unique compuesto (uk_carrera_dorsal) para impedir la duplicidad de dorsales dentro de una misma carrera.
* se agregaron llaves foraneas con cascada y validaciones mediante constraints chk.

salida y resultados esperados
* consulta 1: muestra la relacion detallada de los atletas inscritos en cada carrera cruzando las tablas mediante joins.
* consulta 2: agrupa y cuenta el total de corredores registrados por cada evento deportivo.
* consulta 3: filtra las inscripciones cuyo estado de pago sea exitoso (pagado).
* consulta 4: retorna el top de eventos ordenados por su distancia kilométrica en orden descendente.
* consulta 5: lista los corredores filtrados por genero femenino ordenandolos por su ano de nacimiento.

evidencias de ejecucion
- ddl: creacion exitosa de las tablas carreras_urbanas, corredores e inscripciones_carrera utilizando restricciones unique simples y compuestas.
- dml: carga correcta de 4 eventos, 8 corredores y 8 inscripciones respetando las reglas de unicidad.
- dql: verificacion del funcionamiento optimo de joins, funciones de agregacion y filtros especificos.