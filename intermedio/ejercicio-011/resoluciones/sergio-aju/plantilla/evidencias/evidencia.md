# Resolución Ejercicio 011 - Ping Pong

## Descripción
Solución para practicar la restricción `CHECK`. Modelé una tabla para registrar los resultados de partidos de ping pong, asegurando que los sets no tengan valores ilógicos.

## Decisiones Técnicas
* Utilicé `CHECK` para garantizar que los sets ganados por cada jugador siempre estén entre 0 y 3 (pensando en partidos al mejor de 5 sets). 
* Discutiendo las validaciones numéricas con Byron Ajcet para asegurar que los scripts no fallen en producción, decidimos agregar un campo `estado` para poder filtrar los partidos en curso de los terminados.
* El código se mantiene compacto y separado por responsabilidades como indican las buenas prácticas de Campuslands.