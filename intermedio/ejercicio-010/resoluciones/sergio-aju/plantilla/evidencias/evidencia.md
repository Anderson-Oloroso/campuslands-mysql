# Resolución Ejercicio 010 - Carreras Urbanas

## Descripción
Solución para practicar la restricción `UNIQUE`. Modelé una tabla de pilotos de carreras clandestinas/urbanas donde el `alias` de cada corredor debe ser único y no se puede repetir. 

## Decisiones Técnicas
* Usé `UNIQUE` en la columna `alias` porque en las carreras urbanas dos pilotos no pueden usar el mismo apodo.
* Mantuve el código corto y agrupado para facilitar la lectura. Discutiendo la lógica de los datos con mi compañero Byron Ajcet, decidimos agregar campos de categoría y estado para que las consultas tuvieran más sentido de negocio.