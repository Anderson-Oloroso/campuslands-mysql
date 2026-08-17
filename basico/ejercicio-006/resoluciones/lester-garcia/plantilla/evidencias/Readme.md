# Autos Hiperdeportivos - Base de Datos en MySQL

## Alumno
**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en el mundo de los autos hiperdeportivos. El objetivo fue diseñar una estructura organizada que permitiera almacenar información sobre fabricantes, modelos, clientes y ventas, aplicando buenas prácticas de modelado de bases de datos. Además, la solución se organizó en los tres componentes principales del lenguaje SQL: DDL para la creación de la estructura, DML para la inserción de datos de prueba y DQL para realizar consultas utilizando la cláusula **WHERE**, permitiendo obtener información específica del sistema.

## Solución General

La solución consiste en la creación de una base de datos llamada **autos_hiperdeportivos**, conformada por cuatro tablas relacionadas mediante claves primarias y foráneas: **fabricantes**, **modelos**, **clientes** y **ventas**. Posteriormente se insertaron registros realistas que representan fabricantes reconocidos, modelos exclusivos, clientes y ventas realizadas. Finalmente, se desarrolló un conjunto de consultas SQL enfocadas en el uso de la cláusula **WHERE**, permitiendo filtrar información como modelos según su potencia, vehículos por fabricante, clientes de una ciudad determinada, ventas superiores a un valor específico y otros criterios que demuestran el correcto funcionamiento de la base de datos desde su creación hasta la obtención de información relevante.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y de las tablas.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Consultas para verificar y analizar la información almacenada mediante la cláusula **WHERE**.

**Estructura del proyecto:**

```text
autos_hiperdeportivos/
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
- Consultas ejecutadas correctamente utilizando la cláusula **WHERE**, mostrando información coherente sobre fabricantes, modelos, clientes y ventas de autos hiperdeportivos.
```