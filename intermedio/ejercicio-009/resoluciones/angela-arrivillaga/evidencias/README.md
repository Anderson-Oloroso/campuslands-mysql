ejercicio 009 - foreign key para kickboxing

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
* se implementaron restricciones de llaves foraneas (foreign key) estrictas para conectar las entidades: categorias_peso, luchadores_kickboxing y combates_kickboxing.
* se aplicaron reglas de integridad referencial como on delete restrict para evitar eliminar categorias con atletas activos, y on delete set null en combates para conservar el historial en caso de que un ganador sea modificado o eliminado.
* se anadieron validaciones mediante constraints chk para verificar pesos validos, contadores de peleas no negativos y evitar que un luchador combata contra si mismo.

salida y resultados esperados
* consulta 1: muestra la lista de deportistas vinculada con su respectiva categoria y peso mediante uniones sql.
* consulta 2: despliega el historial detallado de los combates cruzando las esquinas azul y roja, junto con el ganador evaluando empates mediante funciones condicionales.
* consulta 3: retorna el podio de los 3 kickboxers con mas victorias profesionales.
* consulta 4: agrupa y cuenta los atletas activos según su categoria de peso.
* consulta 5: filtra y lista los enfrentamientos desarrollados bajo la modalidad de k1.

evidencias de ejecucion
- ddl: creacion exitosa de las tablas con relaciones de llaves foraneas robustas.
- dml: insercion de registros coherentes que respetan las dependencias relacionales de las fk.
- dql: validacion correcta de consultas multitabla con joins, funciones de agregacion y manejo de nulos.