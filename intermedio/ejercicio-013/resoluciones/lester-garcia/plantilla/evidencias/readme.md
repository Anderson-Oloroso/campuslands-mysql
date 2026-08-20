# Catálogo de Películas de Miedo

## Nombre del alumno
**Lester Garcia**
_____________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para administrar un catálogo de películas de miedo.

El sistema permite almacenar información sobre películas, actores, directores y géneros, estableciendo relaciones entre las diferentes entidades.

La solución está organizada mediante archivos DDL, DML y DQL para facilitar su ejecución, revisión y mantenimiento.

## Objetivo

Practicar el uso de **tablas puente** en MySQL mediante la implementación de relaciones muchos a muchos.

El principal caso utilizado es la relación entre películas y actores.

## Estructura del proyecto

- `ddl.sql`: creación de la base de datos, tablas, claves primarias y claves foráneas.
- `dml.sql`: inserción de datos de prueba.
- `dql.sql`: consultas para analizar las relaciones existentes.
- `README.md`: documentación del ejercicio.

## Explicación general de la solución

La base de datos contiene las siguientes entidades:

- Películas
- Actores
- Directores
- Géneros

Para resolver las relaciones muchos a muchos se utilizaron tablas puente:

- `pelicula_actores`
- `pelicula_directores`
- `pelicula_generos`

### Tabla `pelicula_actores`

Esta es la principal tabla puente del ejercicio.

Una película puede tener varios actores y un actor puede participar en varias películas.

Por esta razón, almacenar directamente `id_actor` dentro de `peliculas` no sería una solución adecuada.

La tabla puente permite representar correctamente la relación:

```text
Película 1 ──── N Película_Actores N ──── 1 Actor
```

Además, la tabla almacena el personaje interpretado por cada actor.

## Consultas realizadas

### Consulta 1

Muestra las películas junto con los actores que participan en ellas y el personaje interpretado.

### Consulta 2

Identifica los actores que participan en más de una película.

### Consulta 3

Determina la cantidad de actores que participan en cada película.

### Consulta 4

Genera un reporte completo combinando película, director, género, actor y personaje.

## Decisiones técnicas

Se utilizaron claves primarias compuestas en las tablas puente para evitar que una misma relación sea registrada dos veces.

Por ejemplo:

```sql
PRIMARY KEY (id_pelicula, id_actor)
```

Esto evita que un mismo actor sea asociado dos veces a la misma película.

También se utilizaron claves foráneas para garantizar la integridad referencial entre las entidades.

La información repetitiva no se almacena directamente en las tablas principales. Las relaciones se gestionan mediante tablas puente, manteniendo una estructura normalizada y fácil de mantener.


## Ejecución

Los archivos deben ejecutarse en el siguiente orden:

1. `ddl.sql`
2. `dml.sql`
3. `dql.sql`

De esta forma, primero se crea la estructura, posteriormente se cargan los datos y finalmente se ejecutan las consultas.