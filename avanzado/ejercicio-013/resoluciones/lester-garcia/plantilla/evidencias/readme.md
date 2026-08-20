# Horror Movie Catalog JSON - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en un catálogo de películas de miedo. El objetivo fue almacenar información estructurada de las películas y utilizar el tipo de dato **JSON** para guardar atributos adicionales que pueden variar entre registros.

El ejercicio permite practicar la creación, almacenamiento, extracción y filtrado de información JSON directamente desde MySQL.

## Solución General

La solución consiste en la creación de una base de datos llamada **horror_movie_catalog**, conformada por tres tablas: **movies**, **directors** y **movie_directors**.

La tabla `movies` contiene los datos principales de cada película y una columna `movie_data` de tipo `JSON`. En esta columna se almacenan datos adicionales como:

- Calificación.
- País.
- Presupuesto.
- Actores.
- Temáticas de la película.

La tabla `directors` almacena la información de los directores y `movie_directors` permite relacionar las películas con sus respectivos directores.

Para trabajar con la información JSON se utilizaron funciones propias de MySQL como:

- `JSON_EXTRACT()` para obtener valores específicos.
- `JSON_UNQUOTE()` para convertir valores JSON de texto en valores legibles.
- `JSON_CONTAINS()` para buscar valores dentro de arreglos JSON.
- `JSON_PRETTY()` para presentar los documentos JSON de forma organizada.

## Decisiones técnicas

- Se utilizó el tipo de dato `JSON` para almacenar información adicional y semiestructurada.
- Los datos principales de las películas permanecen en columnas tradicionales para mantener una estructura relacional clara.
- La información variable como actores y temas se almacenó dentro del documento JSON.
- Se utilizaron claves primarias y foráneas para mantener la integridad referencial.
- Se utilizó una tabla intermedia `movie_directors` para representar la relación entre películas y directores.
- Las consultas JSON permiten acceder a elementos específicos sin necesidad de almacenar cada atributo como una columna independiente.
- La solución requiere **MySQL 5.7 o superior**, aunque se recomienda **MySQL 8.0 o superior**.

## Evidencia

La solución está organizada en tres archivos SQL independientes:

- **01_ddl.sql** → Creación de la base de datos y las tablas.
- **02_dml.sql** → Inserción de películas, directores y relaciones.
- **03_dql.sql** → Consultas y análisis de información almacenada en formato JSON.

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
- Películas y directores registrados correctamente.
- Información adicional almacenada mediante el tipo `JSON`.
- Valores individuales extraídos correctamente mediante `JSON_EXTRACT()`.
- Valores de texto obtenidos mediante `JSON_UNQUOTE()`.
- Búsquedas dentro de arreglos JSON realizadas mediante `JSON_CONTAINS()`.
- Documentos JSON visualizados correctamente mediante `JSON_PRETTY()`.
- Relaciones entre películas y directores funcionando mediante claves foráneas.