# Kickboxing Club - Base de Datos en MySQL

## Alumno
**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en el mundo del kickboxing. El objetivo fue diseñar una estructura organizada que permitiera almacenar información sobre gimnasios, peleadores, torneos y peleas, aplicando buenas prácticas de modelado de bases de datos. Además, la solución se organizó en los tres componentes principales del lenguaje SQL: DDL para la creación de la estructura, DML para la inserción de datos de prueba y DQL para realizar operaciones utilizando la sentencia **DELETE**, eliminando registros de manera controlada y verificando los resultados.

## Solución General

La solución consiste en la creación de una base de datos llamada **kickboxing_club**, conformada por cuatro tablas relacionadas mediante claves primarias y foráneas: **gyms**, **fighters**, **tournaments** y **fights**. Posteriormente se insertaron registros realistas que representan gimnasios, peleadores, torneos y peleas. Finalmente, se desarrolló un conjunto de instrucciones SQL enfocadas en el uso de **DELETE**, eliminando registros de forma segura y respetando las relaciones entre tablas, verificando cada operación mediante consultas **SELECT**.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y de las tablas.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Eliminación controlada de registros utilizando **DELETE** y consultas de verificación.

**Estructura del proyecto:**

```text
kickboxing_club/
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
- Registros eliminados correctamente mediante **DELETE** respetando la integridad referencial.
- Consultas de verificación mostrando el estado final de la información almacenada.