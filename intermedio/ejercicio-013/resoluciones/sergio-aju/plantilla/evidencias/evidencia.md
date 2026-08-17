# Resolución Ejercicio 013 - Catálogo de Terror (Tablas Puente)

## Descripción
Solución para practicar tablas puente (N:M). Adapté la tabla base `intermedio_ejercicio_013` para que funcione como el catálogo de películas, y creé una tabla de `etiquetas_miedo` para clasificar los sustos.

## Decisiones Técnicas
* Se respetó la estructura y datos iniciales requeridos en la plantilla base (`id`, `nombre`, `categoria`, `puntaje`, `estado`).
* Se implementó la tabla puente `pelicula_etiqueta` con llaves foráneas compuestas para evitar duplicados exactos (una película no puede tener dos veces la misma etiqueta).
* Scripts minimizados para lectura rápida.