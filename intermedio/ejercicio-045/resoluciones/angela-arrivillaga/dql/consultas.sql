use campuslands_mysql;

-- consulta 1: reporte de inventario promedio y precios por plataforma
select 
    p.nombre_plataforma, 
    count(j.id) as total_juegos, 
    avg(j.precio) as precio_promedio,
    avg(j.puntaje_critica) as puntaje_promedio
from plataformas p
join juegos j on p.id = j.plataforma_id
group by p.nombre_plataforma;

-- consulta 2: ranking de juegos mejor calificados (top 5)
select titulo, puntaje_critica, precio
from juegos
order by puntaje_critica desc
limit 5;

-- consulta 3: listado de juegos próximos o agotados para revisión de inventario
select titulo, estado_juego, fecha_lanzamiento
from juegos
where estado_juego in ('agotado', 'proximamente')
order by fecha_lanzamiento desc;

-- consulta 4: juegos costosos (precio superior a 50 dolares)
select titulo, precio, plataforma_id
from juegos
where precio > 50.00
order by precio desc;

-- consulta 5: analisis de juegos lanzados por plataforma con detalles
select 
    j.titulo, 
    p.nombre_plataforma, 
    j.fecha_lanzamiento, 
    j.puntaje_critica
from juegos j
join plataformas p on j.plataforma_id = p.id
order by j.fecha_lanzamiento asc;