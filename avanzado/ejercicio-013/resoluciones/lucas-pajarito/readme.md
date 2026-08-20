# Ejercicio 013 - JSON en MySQL para catálogo de películas de miedo

## Dificultad

Avanzado inicial

## Temática

Catálogo de películas de miedo

## Descripción

Este ejercicio implementa una base de datos en MySQL para administrar un catálogo de películas de miedo utilizando el tipo de dato `JSON`. El objetivo es almacenar información flexible de cada película y realizar consultas sobre los datos contenidos dentro de documentos JSON.

## Objetivo

Practicar la creación, almacenamiento, consulta y modificación de información JSON en MySQL mediante funciones específicas.

## Estructura

La base de datos contiene:

* `categorias`: almacena los géneros.
* `directores`: registra los directores.
* `peliculas`: almacena la información principal y una columna `informacion_json`.

El campo JSON contiene datos como clasificación, país, idioma, presupuesto, recaudación, calificación, premios, plataformas y reparto.

## Funciones utilizadas

El script utiliza diferentes funciones de MySQL:

* `JSON_OBJECT()` para crear objetos.
* `JSON_ARRAY()` para crear arreglos.
* `JSON_EXTRACT()` para extraer información.
* `JSON_UNQUOTE()` para obtener valores sin comillas.
* `JSON_CONTAINS()` para buscar elementos.
* `JSON_LENGTH()` para contar elementos.
* `JSON_TABLE()` para convertir datos JSON en filas.
* `JSON_SET()` para modificar o agregar información.
* `JSON_VALID()` para comprobar JSON válido.

## Consultas realizadas

El ejercicio permite:

* Consultar información almacenada en JSON.
* Filtrar películas por calificación.
* Buscar películas disponibles en una plataforma.
* Buscar actores dentro del reparto.
* Contar actores almacenados en un arreglo.
* Convertir arreglos JSON en registros mediante `JSON_TABLE()`.
* Actualizar información dentro del documento JSON.
* Combinar datos JSON con `INNER JOIN`.

## Resultado esperado

Al ejecutar el script se crea la base de datos `catalogo_peliculas_json_013` con categorías, directores y 10 películas. Cada película contiene información adicional almacenada en formato JSON.

El ejercicio demuestra cómo MySQL puede trabajar con información estructurada y flexible mediante JSON, permitiendo realizar consultas y análisis sin necesidad de crear una tabla para cada atributo adicional.
