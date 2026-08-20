# Saga de Ciencia Ficción - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL para administrar información relacionada con diferentes sagas de ciencia ficción. El sistema permite registrar sagas, películas, personajes y lanzamientos, utilizando principalmente tipos de datos relacionados con fechas para almacenar información como fechas de inicio, finalización, estreno y creación de personajes. El objetivo principal es practicar el manejo de fechas básicas en MySQL mediante la creación, inserción y consulta de información temporal.

## Solución General

La solución consiste en crear la base de datos **saga_ciencia_ficcion**, compuesta por las tablas **sagas**, **peliculas**, **personajes** y **lanzamientos**. Para el manejo de fechas se utilizó el tipo `DATE` en los campos que representan fechas específicas y `TIME` para registrar las horas de los lanzamientos. Se insertaron diez registros en las principales entidades y posteriormente se desarrollaron consultas utilizando operadores de comparación, `BETWEEN`, `IS NULL` y `ORDER BY` para consultar películas según su fecha de estreno, identificar sagas activas, obtener personajes creados después de una fecha determinada y encontrar las películas más antiguas y recientes.

## Evidencia

La solución está organizada en archivos independientes según la responsabilidad de cada componente SQL:

* **01_ddl.sql** → Creación de la base de datos, tablas y relaciones.
* **02_dml.sql** → Inserción de datos de prueba.
* **03_dql.sql** → Consultas relacionadas con fechas.
* **README.md** → Documentación del ejercicio.

### Tipos de datos utilizados

| Tipo      | Uso                                                |
| --------- | -------------------------------------------------- |
| `DATE`    | Fechas de inicio, finalización, estreno y creación |
| `TIME`    | Hora de lanzamiento de una película                |
| `YEAR`    | Año de estreno de las películas                    |
| `DECIMAL` | Presupuesto de las producciones                    |
| `VARCHAR` | Nombres, títulos y demás información textual       |
| `INT`     | Identificadores y relaciones                       |

### Operaciones con fechas practicadas

```sql
WHERE fecha_estreno > '2015-01-01';
```

Permite buscar registros posteriores a una fecha.

```sql
WHERE fecha_estreno BETWEEN '2020-01-01' AND '2020-12-31';
```

Permite consultar registros dentro de un rango de fechas.

```sql
WHERE fecha_fin IS NULL;
```

Permite identificar sagas que todavía no tienen una fecha de finalización registrada.

### Estructura del proyecto

```text
lester-garcia/plantillas
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

### Resultado esperado

* Base de datos creada correctamente.
* Fechas almacenadas utilizando tipos de datos apropiados.
* Registros insertados sin errores.
* Relaciones entre las entidades funcionando correctamente.
* Consultas de fechas ejecutadas correctamente.
* Información organizada y lista para ser revisada por otro desarrollador.
