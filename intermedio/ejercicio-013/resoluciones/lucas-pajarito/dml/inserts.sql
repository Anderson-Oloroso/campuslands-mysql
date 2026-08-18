- ============================================================ -- 9. INSERTAR CATEGORIAS -- ============================================================ 

INSERT INTO categorias (nombre_categoria) VALUES ('Terror sobrenatural'), ('Terror psicologico'), ('Slasher'), ('Suspenso'), ('Monstruos'), ('Zombis'), ('Gore'), ('Paranormal'); 

-- ============================================================
 -- 10. INSERTAR DIRECTORES -- ============================================================ 
 INSERT INTO directores (nombre_director) VALUES ('James Wan'), ('Jordan Peele'), ('Ari Aster'), ('Robert Eggers'), ('John Krasinski'), ('Andy Muschietti'), ('Mike Flanagan'), ('Sam Raimi');
 
 
  -- ============================================================ 
  -- 11. INSERTAR PELICULAS -- ============================================================
   INSERT INTO peliculas (titulo_pelicula, id_categoria, id_director, duracion_minutos, anio_publicacion) VALUES ('El Conjuro', 1, 1, 112, 2013), ('Nosotros', 2, 2, 116, 2019), ('Hereditary', 2, 3, 127, 2018), ('La Bruja', 1, 4, 93, 2015), ('Un Lugar en Silencio', 4, 5, 90, 2018), ('IT: Capitulo Dos', 5, 6, 169, 2019), ('Doctor Sueno', 8, 7, 152, 2019), ('Posesion Infernal', 7, 8, 97, 2013), ('El Conjuro 2', 1, 1, 134, 2016), ('Midsommar', 2, 3, 148, 2019); -- ============================================================ 
  -- 12. INSERTAR ACTORES -- ============================================================ 
  INSERT INTO actores (nombre_actor, nacionalidad) VALUES ('Patrick Wilson', 'Estados Unidos'), ('Vera Farmiga', 'Estados Unidos'), ('Lupita Nyongo', 'Mexico'), ('Toni Collette', 'Australia'), ('Anya Taylor-Joy', 'Estados Unidos'), ('Emily Blunt', 'Reino Unido'), ('John Krasinski', 'Estados Unidos'), ('James McAvoy', 'Reino Unido'), ('Ewan McGregor', 'Reino Unido'), ('Bruce Campbell', 'Estados Unidos'); -- ============================================================ 
  -- 13. INSERTAR PLATAFORMAS -- ============================================================ 
  INSERT INTO plataformas (nombre_plataforma) VALUES ('Netflix'), ('Prime Video'), ('Max'), ('Disney Plus'), ('Apple TV'), ('Paramount Plus'); -- ============================================================ -- 14. INSERTAR RELACIONES PELICULA - ACTOR -- ============================================================ 
  INSERT INTO pelicula_actor (id_pelicula, id_actor, personaje) VALUES (1, 1, 'Ed Warren'), (1, 2, 'Lorraine Warren'), (2, 3, 'Adelaide Wilson'), (3, 4, 'Annie Graham'), (3, 5, 'Charlie Graham'), (5, 6, 'Evelyn Abbott'), (5, 7, 'Lee Abbott'), (6, 8, 'Bill Denbrough'), (7, 9, 'Danny Torrance'), (8, 10, 'Ash Williams'), (9, 1, 'Ed Warren'), (9, 2, 'Lorraine Warren'), (10, 4, 'Dani Ardor'); -- ============================================================ 
  -- 15. INSERTAR RELACIONES PELICULA - PLATAFORMA 
  -- ============================================================ 
  INSERT INTO pelicula_plataforma (id_pelicula, id_plataforma, fecha_disponibilidad) VALUES (1, 1, '2024-01-10'), (1, 2, '2024-02-15'), (2, 1, '2024-03-05'), (2, 3, '2024-04-10'), (3, 2, '2024-05-12'), (3, 3, '2024-06-01'), (4, 1, '2024-02-20'), (5, 3, '2024-07-15'), (5, 5, '2024-08-01'), (6, 1, '2024-09-10'), (6, 2, '2024-09-20'), (7, 2, '2024-10-05'), (8, 3, '2024-11-12'), (9, 1, '2024-12-01'), (9, 2, '2024-12-15'), (10, 3, '2025-01-10');