-- ============================================================ 
-- EJERCICIO 013 -- TABLAS PUENTE PARA CATALOGO DE PELICULAS DE MIEDO -- ============================================================ 

-- ============================================================
 -- 1. CREACION DE LA BASE DE DATOS -- ============================================================ 
 DROP DATABASE IF EXISTS catalogo_peliculas_miedo_013; 
 CREATE DATABASE catalogo_peliculas_miedo_013; 
 USE catalogo_peliculas_miedo_013; 
 -- ============================================================ 
 -- 2. TABLA CATEGORIAS 
 -- ============================================================ 
 
 CREATE TABLE categorias (
     id INT AUTO_INCREMENT PRIMARY KEY, 
     nombre_categoria VARCHAR(100) NOT NULL UNIQUE ); 
     
-- ============================================================ 
-- 3. TABLA DIRECTORES -- ============================================================
 CREATE TABLE directores ( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_director VARCHAR(100) NOT NULL );
    
 -- ============================================================ 
 -- 4. TABLA PELICULAS 
 -- ============================================================
 
  CREATE TABLE peliculas ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    titulo_pelicula VARCHAR(150) NOT NULL, 
    id_categoria INT NOT NULL, 
    id_director INT NOT NULL, 
    duracion_minutos INT NOT NULL CHECK (duracion_minutos > 0), 
    anio_publicacion YEAR NOT NULL,
    
     CONSTRAINT fk_pelicula_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id),
     
     CONSTRAINT fk_pelicula_director FOREIGN KEY (id_director) REFERENCES directores(id) ); 
     
     -- ============================================================ 
     -- 5. TABLA ACTORES 
     -- ============================================================ 
     
     CREATE TABLE actores (
         id INT AUTO_INCREMENT PRIMARY KEY, 
         nombre_actor VARCHAR(100) NOT NULL, 
         nacionalidad VARCHAR(80) NOT NULL );
         
 -- ============================================================ 
 -- 6. TABLA PLATAFORMAS
 -- ============================================================
  CREATE TABLE plataformas (
     id INT AUTO_INCREMENT PRIMARY KEY,
     nombre_plataforma VARCHAR(100) NOT NULL UNIQUE ); -- ============================================================ 
     -- 7. TABLA PUENTE PELICULA_ACTOR -- ============================================================ 
    CREATE TABLE pelicula_actor (
         id_pelicula INT NOT NULL,
        id_actor INT NOT NULL, 
        personaje VARCHAR(100) NOT NULL, 
        PRIMARY KEY (id_pelicula, id_actor), 
        
        CONSTRAINT fk_pa_pelicula FOREIGN KEY (id_pelicula) REFERENCES peliculas(id) ON DELETE CASCADE ON UPDATE CASCADE, 
        CONSTRAINT fk_pa_actor FOREIGN KEY (id_actor) REFERENCES actores(id) ON DELETE CASCADE ON UPDATE CASCADE ); 
        
        -- ============================================================ -- 8. TABLA PUENTE PELICULA_PLATAFORMA -- ============================================================
        
         CREATE TABLE pelicula_plataforma ( 
            id_pelicula INT NOT NULL, 
            id_plataforma INT NOT NULL, 
            fecha_disponibilidad DATE NOT NULL, 
            PRIMARY KEY (id_pelicula, id_plataforma), 
            
            CONSTRAINT fk_pp_pelicula FOREIGN KEY (id_pelicula) REFERENCES peliculas(id) ON DELETE CASCADE ON UPDATE CASCADE,
            
             CONSTRAINT fk_pp_plataforma FOREIGN KEY (id_plataforma) REFERENCES plataformas(id) ON DELETE CASCADE ON UPDATE CASCADE );