# Liga de Fútbol - Base de Datos en MySQL

## Alumno
**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en una liga de fútbol. El objetivo fue diseñar una estructura organizada que permitiera almacenar información sobre equipos, jugadores, partidos y la tabla de posiciones, aplicando buenas prácticas de modelado de bases de datos. Además, la solución se organizó en los tres componentes principales del lenguaje SQL: DDL para la creación de la estructura, DML para la inserción de datos de prueba y DQL para realizar consultas utilizando la cláusula **ORDER BY**, permitiendo ordenar la información de diferentes maneras para facilitar su análisis.

## Solución General

La solución consiste en la creación de una base de datos llamada **football_league**, conformada por cuatro tablas relacionadas mediante claves primarias y foráneas: **teams**, **players**, **matches** y **standings**. Posteriormente se insertaron registros realistas que representan una liga de fútbol con sus respectivos equipos, jugadores, partidos disputados y posiciones en la clasificación. Finalmente, se desarrolló un conjunto de consultas SQL enfocadas en el uso de la cláusula **ORDER BY**, permitiendo ordenar equipos, jugadores, partidos y estadísticas según diferentes criterios, demostrando el correcto funcionamiento de la base de datos desde su creación hasta la obtención de información organizada.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y de las tablas.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Consultas para verificar y analizar la información almacenada mediante la cláusula **ORDER BY**.

**Estructura del proyecto:**

```text
football_league/
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

**Resultado esperado:**

- Base de datos creada correctamente.
- Relaciones entre tablas funcionando mediante claves foráneas.
- Datos insertados sin errores.
- Consultas ejecutadas correctamente utilizando la cláusula **ORDER BY**, mostrando información ordenada y coherente sobre los equipos, jugadores, partidos y la tabla de posiciones de la liga de fútbol.