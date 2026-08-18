-- ============================================================ 
-- 16. CONSULTAR TABLAS PRINCIPALES -- ============================================================ 

SELECT * FROM categorias; 

SELECT * FROM directores; 

SELECT * FROM peliculas; 

SELECT * FROM actores; 

SELECT * FROM plataformas; 

-- ============================================================ 
-- 17. CONSULTAR TABLA PUENTE PELICULA_ACTOR
-- ============================================================ 
SELECT * FROM pelicula_actor; 


-- ============================================================ 
-- 18. CONSULTAR TABLA PUENTE PELICULA_PLATAFORMA 
-- ============================================================ 
SELECT * FROM pelicula_plataforma; 

-- ============================================================ 
-- 19. CONSULTA: PELICULAS CON SUS ACTORES 
-- ============================================================
 SELECT p.titulo_pelicula, a.nombre_actor, pa.personaje 
 FROM peliculas p 
 INNER JOIN pelicula_actor pa ON p.id = pa.id_pelicula 
 INNER JOIN actores a ON pa.id_actor = a.id 
 ORDER BY p.titulo_pelicula; 
 
 -- ============================================================ 
 -- 20. CONSULTA: PELICULAS Y SUS PLATAFORMAS -- ============================================================ 
 SELECT p.titulo_pelicula, pl.nombre_plataforma, pp.fecha_disponibilidad 
 FROM peliculas p INNER JOIN pelicula_plataforma pp ON p.id = pp.id_pelicula 
 INNER JOIN plataformas pl ON pp.id_plataforma = pl.id 
 ORDER BY p.titulo_pelicula;
 
 -- ============================================================ 
 -- 21. CONSULTA: CANTIDAD DE ACTORES POR PELICULA 
 -- ============================================================
 
  SELECT p.titulo_pelicula, COUNT(pa.id_actor) AS cantidad_actores FROM peliculas p LEFT JOIN pelicula_actor pa ON p.id = pa.id_pelicula GROUP BY p.id, p.titulo_pelicula ORDER BY cantidad_actores DESC; 
  
  -- ============================================================ 
  -- 22. CONSULTA: CANTIDAD DE PLATAFORMAS POR PELICULA 
  -- ============================================================ 

  SELECT p.titulo_pelicula, COUNT(pp.id_plataforma) AS cantidad_plataformas FROM peliculas p LEFT JOIN pelicula_plataforma pp ON p.id = pp.id_pelicula GROUP BY p.id, p.titulo_pelicula ORDER BY cantidad_plataformas DESC;
  
  -- ============================================================ 
  -- 23. CONSULTA: ACTORES QUE PARTICIPAN EN MAS DE UNA PELICULA 
  -- ============================================================ 

  SELECT a.nombre_actor, COUNT(pa.id_pelicula) AS peliculas_participadas FROM actores a INNER JOIN pelicula_actor pa ON a.id = pa.id_actor GROUP BY a.id, a.nombre_actor HAVING COUNT(pa.id_pelicula) > 1 ORDER BY peliculas_participadas DESC; 

  
  -- ============================================================ 
  -- 24. CONSULTA GENERAL CON CATEGORIA Y DIRECTOR 
  -- ============================================================ 

  SELECT p.id, p.titulo_pelicula, c.nombre_categoria, d.nombre_director, p.duracion_minutos, p.anio_publicacion FROM peliculas p INNER JOIN categorias c ON p.id_categoria = c.id INNER JOIN directores d ON p.id_director = d.id ORDER BY p.anio_publicacion DESC;
