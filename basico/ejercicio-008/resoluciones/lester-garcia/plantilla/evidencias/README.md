# Futsal League - Base de Datos en MySQL

## Alumno
**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en una liga de fútbol sala. El objetivo fue diseñar una estructura organizada que permitiera almacenar información sobre equipos, jugadores, partidos y la clasificación del torneo, aplicando buenas prácticas de modelado de bases de datos. Además, la solución se organizó en los tres componentes principales del lenguaje SQL: DDL para la creación de la estructura, DML para la inserción de datos de prueba y DQL para realizar consultas utilizando la sentencia **UPDATE**, permitiendo modificar información almacenada de forma controlada.

## Solución General

La solución consiste en la creación de una base de datos llamada **futsal_league**, conformada por cuatro tablas relacionadas mediante claves primarias y foráneas: **teams**, **players**, **matches** y **standings**. Posteriormente se insertaron registros realistas que representan una liga de fútbol sala con sus respectivos equipos, jugadores, encuentros y clasificación. Finalmente, se desarrolló un conjunto de instrucciones SQL enfocadas en el uso de **UPDATE**, permitiendo modificar datos de equipos, jugadores, partidos y tabla de posiciones, verificando posteriormente cada cambio mediante consultas **SELECT**.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y de las tablas.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Actualizaciones de registros utilizando **UPDATE** y consultas de verificación.

**Estructura del proyecto:**

```text
futsal_league/
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
- Registros modificados correctamente mediante **UPDATE**.
- Consultas de verificación mostrando los cambios realizados en equipos, jugadores, partidos y clasificación.