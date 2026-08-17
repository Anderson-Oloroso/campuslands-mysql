# Resolucion - Ejercicio 028 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele la relacion muchos-a-muchos entre estudiantes y cursos de una
academia tech con una tabla puente: `inscripciones_intermedio`. Un
estudiante puede tomar varios cursos y un curso puede tener varios
estudiantes; la tabla puente es la unica forma de representar eso en
un modelo relacional sin duplicar datos.

## Decisiones tecnicas
- `PRIMARY KEY (id_estudiante, id_curso)` compuesta: identifica cada
  inscripcion y de paso impide que el mismo estudiante quede inscrito
  dos veces en el mismo curso.
- `calificacion_final` es `NULL`-able porque un curso en curso todavia
  no tiene nota final (Laura Gomez y Diego Perez tienen inscripciones
  sin calificar).
- `CHECK (calificacion_final IS NULL OR calificacion_final BETWEEN 0 AND 5)`:
  el `CHECK` no puede simplemente exigir un rango, porque `NULL` es un
  valor valido mientras el curso no termine.
- Laura Gomez esta inscrita en 3 cursos a proposito, para que la
  consulta de `HAVING COUNT(*) > 2` tenga un resultado real.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Estudiantes inscritos en "React desde Cero".
2. Cursos en los que esta inscrita Laura Gomez.
3. Cantidad de estudiantes inscritos por curso.
4. Cantidad de cursos por estudiante.
5. Estudiantes inscritos en mas de 2 cursos (`HAVING`).
6. Calificacion promedio por curso (solo inscripciones ya calificadas).
