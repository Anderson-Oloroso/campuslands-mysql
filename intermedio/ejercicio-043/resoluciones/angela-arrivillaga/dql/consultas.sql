use campuslands_mysql;

-- consulta 1: contar cuantas peliculas pertenecen a cada subgenero
select 
    s.nombre_subgenero, 
    count(ps.pelicula_id) as cantidad_peliculas
from subgeneros s
join peliculas_subgeneros ps on s.id = ps.subgenero_id
group by s.nombre_subgenero
order by cantidad_peliculas desc;

-- consulta 2: peliculas con mas de un subgenero (complejidad narrativa)
select 
    p.titulo, 
    count(ps.subgenero_id) as total_subgeneros
from peliculas p
join peliculas_subgeneros ps on p.id = ps.pelicula_id
group by p.id
having total_subgeneros > 1
order by total_subgeneros desc;

-- consulta 3: top 5 peliculas con mayor puntaje de terror
select 
    titulo, 
    puntaje_terror 
from peliculas
order by puntaje_terror desc
limit 5;

-- consulta 4: listado completo con subgeneros concatenados
select 
    p.titulo, 
    group_concat(s.nombre_subgenero separator ', ') as categorias
from peliculas p
join peliculas_subgeneros ps on p.id = ps.pelicula_id
join subgeneros s on ps.subgenero_id = s.id
group by p.id;

-- consulta 5: peliculas estrenadas despues del año 2000 que sean del subgenero 'sobrenatural'
select 
    p.titulo, 
    p.anio_estreno
from peliculas p
join peliculas_subgeneros ps on p.id = ps.pelicula_id
join subgeneros s on ps.subgenero_id = s.id
where s.nombre_subgenero = 'sobrenatural' and p.anio_estreno > 2000;