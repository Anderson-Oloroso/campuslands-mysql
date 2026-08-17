# Resolucion - Ejercicio 043 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele la relacion muchos-a-muchos entre peliculas y actores de un
catalogo de peliculas de miedo con una tabla puente:
`reparto_intermedio`. Un actor puede aparecer en varias peliculas y una
pelicula puede tener varios actores; la tabla puente es la unica forma
de representar eso en un modelo relacional sin duplicar datos.

## Decisiones tecnicas
- `PRIMARY KEY (id_pelicula, id_actor)` compuesta: identifica cada
  participacion y de paso impide que el mismo actor quede registrado
  dos veces en la misma pelicula.
- `papel_principal BOOLEAN` para distinguir protagonistas de reparto
  secundario sin necesitar una tabla aparte.
- Elena Vidal aparece en 3 peliculas a proposito, para que la consulta
  de `HAVING COUNT(*) > 2` tenga un resultado real.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Actores en "El Legado Maldito".
2. Peliculas en las que actua Elena Vidal.
3. Cantidad de actores por pelicula.
4. Cantidad de peliculas por actor.
5. Actores que han actuado en mas de 2 peliculas (`HAVING`).
6. Papeles principales de todo el catalogo.
