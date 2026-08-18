# Playlist Musical - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en una plataforma de playlists musicales. El sistema permite almacenar información de usuarios, artistas, canciones y playlists, además de establecer la relación entre las playlists y las canciones que contienen. El ejercicio se enfoca en el modelado de entidades, buscando representar de manera organizada las relaciones existentes entre los diferentes elementos de una plataforma musical.

## Solución General

La solución consiste en crear la base de datos **playlist_musical**, utilizando las entidades **usuarios**, **artistas**, **canciones** y **playlists**, complementadas por la tabla intermedia **playlist_canciones** para representar correctamente la relación de muchos a muchos entre playlists y canciones. Cada entidad cuenta con una clave primaria para identificar sus registros y las relaciones se establecen mediante claves foráneas. Posteriormente se insertaron datos realistas y finalmente se desarrollaron consultas `SELECT` utilizando filtros, ordenamientos, funciones de agregación e `INNER JOIN` para obtener información sobre usuarios, artistas, canciones y contenido de las playlists.

## Evidencia

La solución está organizada en archivos independientes de acuerdo con la responsabilidad de cada componente SQL:

* **01_ddl.sql** → Creación de la base de datos, entidades, claves primarias y relaciones.
* **02_dml.sql** → Inserción de datos de prueba.
* **03_dql.sql** → Consultas para verificar y analizar la información.
* **README.md** → Documentación del ejercicio.

### Modelo de entidades

Las principales entidades utilizadas son:

* **Usuarios:** almacena los datos de las personas que crean playlists.
* **Artistas:** registra los artistas y su género musical.
* **Canciones:** almacena las canciones y las relaciona con sus respectivos artistas.
* **Playlists:** contiene las listas musicales creadas por los usuarios.
* **Playlist_canciones:** establece qué canciones pertenecen a cada playlist y su posición.

### Estructura del proyecto

```text
lester-garcia/plantilla
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

### Resultado esperado

* Base de datos creada correctamente.
* Entidades y relaciones establecidas mediante claves primarias y foráneas.
* Datos insertados sin errores.
* Relación muchos a muchos entre playlists y canciones correctamente implementada.
* Consultas `SELECT` ejecutadas correctamente.
* Información organizada y lista para ser revisada por otro desarrollador.
