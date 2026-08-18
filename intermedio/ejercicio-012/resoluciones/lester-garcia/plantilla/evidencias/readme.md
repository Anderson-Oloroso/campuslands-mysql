# Playlist Musical

## Nombre del alumno
**Lester Garcia**
_____________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para administrar playlists musicales, usuarios, canciones, artistas y géneros.

La solución está organizada mediante los archivos DDL, DML y DQL, permitiendo ejecutar el proyecto desde cero y mantener separadas las responsabilidades de creación, manipulación y consulta de información.

## Objetivo

Practicar la creación de consultas de reportes en MySQL utilizando relaciones entre diferentes tablas, funciones de agregación, agrupamiento y ordenamiento de información.

## Estructura del proyecto

- `ddl.sql`: creación de la base de datos, tablas, relaciones y restricciones.
- `dml.sql`: inserción de datos de prueba.
- `dql.sql`: consultas destinadas a generar reportes.
- `README.md`: documentación del proyecto y decisiones técnicas.

## Explicación general de la solución

La base de datos está compuesta por las siguientes entidades:

- Usuarios
- Playlists
- Canciones
- Artistas
- Géneros
- Playlist_Canciones

La tabla `playlist_canciones` funciona como tabla intermedia entre playlists y canciones, permitiendo que una playlist contenga múltiples canciones y que una canción pueda pertenecer a diferentes playlists.

Las consultas fueron diseñadas como reportes orientados al análisis de la información.

## Reportes implementados

### Reporte 1: Playlists

Permite conocer cuántas canciones contiene cada playlist y quién es su propietario.

### Reporte 2: Géneros musicales

Permite conocer la cantidad de canciones por género y su duración promedio.

### Reporte 3: Artistas más utilizados

Permite identificar qué artistas aparecen con mayor frecuencia dentro de las playlists.

### Reporte 4: Detalle de playlists

Presenta información detallada de cada playlist, incluyendo usuario, canción, posición, artista, género y duración.

## Decisiones técnicas

Se utilizaron claves primarias para identificar cada entidad y claves foráneas para garantizar la integridad referencial.

Se creó la tabla intermedia `playlist_canciones` para representar correctamente la relación muchos a muchos entre playlists y canciones.

Se utilizaron `INNER JOIN` para construir reportes donde se requiere información relacionada y `LEFT JOIN` cuando se desea conservar registros aunque no tengan canciones asociadas.

También se utilizaron funciones de agregación como `COUNT()` y `AVG()` para generar indicadores útiles.


## Ejecución

Los archivos deben ejecutarse en el siguiente orden:

1. `ddl.sql`
2. `dml.sql`
3. `dql.sql`

De esta manera se garantiza que la estructura y los datos existan antes de ejecutar los reportes.