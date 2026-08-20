# ejercicio 013 - json en mysql para catalogo de peliculas de miedo

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar ddl/schema.sql.
2. ejecutar dml/inserts.sql.
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* se utilizo la base de datos relacional `peliculas_miedo_db`.
* especialización en el uso avanzado de tipos de datos `JSON` en MySQL mediante funciones especializadas como `->>`, `json_extract()`, `json_contains()`, `json_quote()` y `json_unquote()` para consultar metadatos semi-estructurados (elenco, streaming, premios y niveles de susto).
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar años de estreno válidos, presupuestos y calificaciones IMDb en escala de 0.00 a 10.00 con precisión `DECIMAL`.

## salida y resultados esperados

* listado de películas ordenadas por calificación extrayendo dinámicamente el nivel de sustos desde el JSON.
* filtro avanzado de películas que se transmiten en plataformas específicas (`netflix`) usando `json_contains`.
* extracción y ordenamiento de películas según la cantidad de premios ganados anidados en el documento JSON.
* consulta detallada de los actores principales contenidos en arreglos JSON.
* reporte analítico cruzando tablas relacionales y campos JSON para categorías de terror avanzado.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño relacional optimizado con columna JSON validada y restricciones de integridad.
* dml: inserción robusta de registros con estructuras JSON complejas y anidadas.
* dql: consultas avanzadas orientadas a la manipulación, extracción y filtrado de datos JSON en MySQL.