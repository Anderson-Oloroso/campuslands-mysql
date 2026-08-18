# Saga de Ciencia Ficción

## Nombre del alumno
**Lester Garcia**
_____________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para administrar información relacionada con una saga de ciencia ficción.

La base de datos permite almacenar películas, personajes y planetas, además de establecer relaciones entre las películas y los personajes y entre las películas y los planetas.

La solución se encuentra organizada en archivos DDL, DML y DQL.

## Objetivo

Practicar la creación y utilización de **vistas simples (`VIEW`)** en MySQL.

Las vistas permiten presentar información específica de una o más tablas mediante una consulta reutilizable.

## Estructura del proyecto

- `ddl.sql`: creación de la base de datos, tablas, claves primarias y claves foráneas.
- `dml.sql`: inserción de datos de prueba.
- `dql.sql`: creación y consulta de las vistas.
- `README.md`: documentación del ejercicio.

## Explicación general de la solución

La base de datos está compuesta por:

- Películas
- Personajes
- Planetas
- Película_Personajes
- Película_Planetas

Las tablas `pelicula_personajes` y `pelicula_planetas` funcionan como tablas puente para representar relaciones muchos a muchos.

Para el ejercicio se crearon vistas simples enfocadas en facilitar el acceso a información específica:

- `vista_peliculas`
- `vista_personajes`
- `vista_planetas`
- `vista_duracion_peliculas`

Cada vista obtiene información de una tabla y permite consultarla posteriormente utilizando `SELECT`.

## ¿Qué es una vista?

Una vista es una consulta almacenada que puede utilizarse posteriormente como si fuera una tabla.

Por ejemplo:

```sql
CREATE VIEW vista_peliculas AS
SELECT
    id_pelicula,
    titulo,
    episodio,
    anio_estreno,
    duracion_minutos
FROM peliculas;
```

Después de crearla se puede consultar mediante:

```sql
SELECT *
FROM vista_peliculas;
```

La ventaja principal es que permite reutilizar consultas y presentar únicamente la información necesaria.

## Consultas realizadas

### Consulta 1

Se creó una vista para consultar la información básica de las películas.

### Consulta 2

Se creó una vista para consultar los personajes registrados.

### Consulta 3

Se creó una vista para consultar los planetas y ordenarlos según su población.

### Consulta 4

Se creó una vista relacionada con la duración de las películas y posteriormente se utilizó para filtrar las películas que superan los 140 minutos.

## Decisiones técnicas

Las vistas fueron diseñadas de manera sencilla para mantener el objetivo del ejercicio centrado en el concepto de `VIEW`.

No se incluyeron cálculos complejos dentro de las vistas porque el objetivo es practicar vistas simples.

Las relaciones muchos a muchos fueron implementadas mediante tablas puente para mantener una estructura normalizada y evitar almacenar múltiples valores dentro de una misma columna.

Las claves primarias y foráneas garantizan la identificación única de los registros y la integridad referencial.


La evidencia debe incluir capturas de pantalla de:

1. La creación de la base de datos.
2. La creación de las tablas.
3. La inserción de los registros.
4. La creación de `vista_peliculas`.
5. La consulta de `vista_personajes`.
6. La consulta de `vista_planetas`.
7. La consulta de `vista_duracion_peliculas`.
8. Los resultados obtenidos por cada vista.

## Ejecución

Los archivos deben ejecutarse en este orden:

1. `ddl.sql`
2. `dml.sql`
3. `dql.sql`

De esta manera se crea primero la estructura, posteriormente se insertan los datos y finalmente se crean y consultan las vistas.