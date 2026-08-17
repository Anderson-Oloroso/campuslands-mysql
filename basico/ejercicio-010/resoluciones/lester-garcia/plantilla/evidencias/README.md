# Urban Races - Base de Datos en MySQL

## Alumno
**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en carreras urbanas. El objetivo fue diseñar una estructura organizada que permitiera almacenar información sobre corredores, carreras, categorías e inscripciones, aplicando buenas prácticas de modelado de bases de datos. Además, la solución se organizó en los tres componentes principales del lenguaje SQL: DDL para la creación de la estructura, DML para la inserción de datos de prueba y DQL para realizar consultas utilizando las funciones de agregación **COUNT** y **SUM**, permitiendo obtener indicadores generales del sistema.

## Solución General

La solución consiste en la creación de una base de datos llamada **urban_races**, conformada por cuatro tablas relacionadas mediante claves primarias y foráneas: **runners**, **races**, **categories** y **registrations**. Posteriormente se insertaron registros realistas que representan corredores, eventos deportivos, categorías de competencia e inscripciones. Finalmente, se desarrolló un conjunto de consultas SQL utilizando las funciones **COUNT** y **SUM**, permitiendo calcular la cantidad de registros almacenados y obtener valores acumulados como el total recaudado por inscripciones y la suma de las distancias disponibles.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y de las tablas.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Consultas utilizando **COUNT** y **SUM** para analizar la información almacenada.

**Estructura del proyecto:**

```text
urban_races/
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
- Consultas ejecutadas correctamente utilizando **COUNT** y **SUM** para obtener indicadores generales y valores acumulados del sistema.