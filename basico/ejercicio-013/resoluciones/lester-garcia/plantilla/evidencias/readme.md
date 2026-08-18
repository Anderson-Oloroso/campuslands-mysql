# Catálogo de Películas de Miedo - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL para administrar un catálogo de películas de miedo. El sistema permite almacenar información sobre películas, directores y géneros cinematográficos, además de controlar el estado de disponibilidad de cada película. El objetivo principal es practicar el uso de filtros por estado mediante consultas SQL que permitan obtener información específica del catálogo.

## Solución General

La solución consiste en crear la base de datos **catalogo_peliculas_miedo**, compuesta por las tablas **directores**, **peliculas**, **generos** y **pelicula_genero**. La tabla `peliculas` contiene un campo `estado` que permite clasificar cada película como `Disponible`, `No disponible` o `Proximamente`, facilitando la aplicación de filtros mediante la cláusula `WHERE`. Posteriormente se insertaron diez películas, diez directores y diez géneros, estableciendo las relaciones correspondientes mediante claves primarias y foráneas. Finalmente, se desarrollaron consultas `SELECT` para filtrar películas según su estado, combinar condiciones, ordenar resultados, utilizar funciones de agregación y relacionar las películas con sus respectivos directores.

## Evidencia

La solución está organizada en archivos independientes según la responsabilidad de cada componente SQL:

* **01_ddl.sql** → Creación de la base de datos, tablas y relaciones.
* **02_dml.sql** → Inserción de datos de prueba.
* **03_dql.sql** → Consultas y filtros por estado.
* **README.md** → Documentación del ejercicio.

### Concepto principal practicado

El campo:

```sql
estado ENUM('Disponible', 'No disponible', 'Proximamente')
```

permite controlar los estados válidos que puede tener una película.

El filtro principal utilizado es:

```sql
WHERE estado = 'Disponible';
```

De esta manera se pueden recuperar únicamente los registros que cumplen con un estado específico.

### Estructura del proyecto

```text
catalogo_peliculas_miedo/
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

### Resultado esperado

* Base de datos creada correctamente.
* Películas, directores y géneros registrados.
* Relaciones entre las tablas funcionando correctamente.
* Estados de las películas almacenados de forma controlada.
* Consultas de filtrado ejecutadas correctamente.
* Información disponible para consultar películas disponibles, no disponibles y próximas.
* Código organizado para facilitar su revisión y mantenimiento.
