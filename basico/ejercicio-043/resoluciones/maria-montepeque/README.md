# Resolucion - Ejercicio 043 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `peliculas_basico` para un catalogo de peliculas de
miedo y escribi seis consultas centradas en filtrar por `estado`:
igualdad, desigualdad, combinaciones con `IN` y `AND`, y agregados
condicionados por estado.

## Decisiones tecnicas
- `estado ENUM('disponible','proximamente','retirada','en_revision')`
  como catalogo cerrado del ciclo de vida de una pelicula en el
  catalogo.
- `CHECK (calificacion_usuarios BETWEEN 0 AND 10)` para que la
  calificacion siempre sea un valor valido.
- La consulta 6 combina `WHERE estado = 'disponible'` con `GROUP BY
  subgenero`, mostrando que filtrar por estado y agregar no son
  excluyentes.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Peliculas disponibles ordenadas por calificacion.
2. Peliculas retiradas del catalogo.
3. Peliculas que no estan disponibles.
4. Peliculas disponibles o proximamente con calificacion menor a 7.
5. Cantidad de peliculas por estado.
6. Calificacion promedio de las peliculas disponibles, por subgenero.
