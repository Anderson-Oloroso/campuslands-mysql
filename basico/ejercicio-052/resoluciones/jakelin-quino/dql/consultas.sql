-- 1. Personajes ordenados por polígonos (mayor a menor)
SELECT nombre, pelicula, poligonos FROM `ejercicio-052-bas-personajes` 
ORDER BY poligonos DESC;

-- 2. Personajes ordenados por tiempo de animación
SELECT nombre, pelicula, tiempo_animacion FROM `ejercicio-052-bas-personajes` 
ORDER BY tiempo_animacion DESC;

-- 3. Personajes ordenados por película y nombre
SELECT nombre, pelicula, poligonos FROM `ejercicio-052-bas-personajes` 
ORDER BY pelicula ASC, nombre ASC;