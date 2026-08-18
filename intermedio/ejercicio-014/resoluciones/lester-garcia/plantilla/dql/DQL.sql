 USE ejercicio_14_int;
 
 -- vistas sencillas
 
 -- crear vista de peliculas
 CREATE OR REPLACE VIEW vista_peliculas AS 
 SELECT
   id_pelicula,
  titulo,
  episodio,
  anio_estreno,
  duracion_minutos
 FROM peliculas;
 
 -- probar la vista
 SELECT *
FROM vista_peliculas
ORDER BY episodio;
 
 -- CREAR VISTA DE PERSONAJES
 
 CREATE OR REPLACE VIEW vista_personaje AS
 SELECT 
     id_personaje,
     nombre,
     rol
FROM personajes;

-- prueba

SELECT * 
FROM vista_personaje
ORDER BY rol;

-- CREAR VISTA DE PLANETAS

CREATE OR REPlACE VIEW vista_planetas AS
SELECT 
nombre,
sistema,
poblacion
FROM planetas;

-- CONSULTAR VISTA DE PELICULAS POR DURACION

CREATE OR REPLACE VIEW vista_duracion_peliculas AS
SELECT
    titulo,
    episodio,
    duracion_minutos
FROM peliculas;

-- UTILIZANDI LA VISTA DENTRO DE UNA CONSULTA
-- PARA VER PELICULAS QUE SUPERAN LOS 140 MINUTOS.alter

SELECT
    titulo,
    episodio,
    duracion_minutos
FROM vista_duracion_peliculas
WHERE duracion_minutos > 140
ORDER BY duracion_minutos DESC;

 