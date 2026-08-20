# Music Playlist Window Functions - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en una plataforma de playlists musicales. El objetivo fue almacenar información sobre artistas, álbumes, canciones y playlists, y posteriormente aplicar **Window Functions** para realizar análisis sobre las reproducciones de las canciones.

Las funciones de ventana permiten realizar cálculos sobre un conjunto de registros relacionados sin perder el detalle individual de cada fila. Esto resulta útil para generar rankings, acumulados, comparaciones y estadísticas sin necesidad de agrupar completamente los resultados.

## Solución General

La solución consiste en la creación de una base de datos llamada **music_playlist_windows**, conformada por cinco tablas: **artists**, **albums**, **songs**, **playlists** y **playlist_songs**.

Las tablas permiten representar la relación entre artistas y álbumes, álbumes y canciones, y canciones y playlists. La tabla `playlist_songs` funciona como tabla intermedia para representar la relación entre playlists y canciones.

Para practicar Window Functions se implementaron diferentes consultas utilizando funciones como:

- `RANK()` para generar rankings.
- `PARTITION BY` para generar rankings separados por género.
- `LAG()` para comparar una canción con la canción anterior.
- `SUM() OVER()` para calcular un acumulado de reproducciones.
- `AVG() OVER()` para calcular el promedio general y compararlo con cada canción.

## Decisiones técnicas

- Se utilizaron claves primarias para identificar cada registro.
- Se utilizaron claves foráneas para mantener la integridad referencial.
- Se implementó una tabla intermedia `playlist_songs` para representar la relación entre playlists y canciones.
- Se utilizaron Window Functions para realizar análisis sin perder el detalle individual de cada canción.
- `RANK()` permite ordenar las canciones según sus reproducciones.
- `PARTITION BY` permite realizar análisis independientes por género musical.
- `LAG()` permite comparar los valores actuales con registros anteriores.
- `SUM() OVER()` permite obtener un acumulado de reproducciones.
- `AVG() OVER()` permite obtener el promedio general manteniendo cada canción como registro independiente.
- La solución requiere **MySQL 8.0 o superior**.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y las tablas.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Consultas utilizando Window Functions.

**Estructura del proyecto:**

```text
lester-garcia/plantilla
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

## Resultado esperado

- Base de datos creada correctamente.
- Relaciones entre las tablas funcionando mediante claves foráneas.
- Datos de artistas, álbumes, canciones y playlists insertados correctamente.
- Rankings de canciones generados mediante `RANK()`.
- Comparaciones entre canciones realizadas mediante `LAG()`.
- Acumulados calculados mediante `SUM() OVER()`.
- Promedios y diferencias calculados mediante `AVG() OVER()`.
- Consultas ejecutadas correctamente mostrando información útil para analizar el comportamiento de las canciones.