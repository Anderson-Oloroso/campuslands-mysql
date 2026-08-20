use campuslands_mysql;

-- consulta 1: reporte de promedio de duracion y reproducciones agrupado por estado de la cancion
select 
    estado_cancion, 
    avg(duracion_segundos) as promedio_duracion_segundos, 
    avg(reproducciones) as promedio_reproducciones,
    count(*) as total_canciones
from canciones
group by estado_cancion;

-- consulta 2: top 3 canciones mas reproducidas en toda la plataforma musical
select 
    c.titulo, 
    c.artista, 
    p.nombre_playlist, 
    c.reproducciones, 
    c.estado_cancion
from canciones c
join playlists p on c.playlist_id = p.id
order by c.reproducciones desc
limit 3;

-- consulta 3: listado de canciones filtradas por una playlist especifica (lo-fi beats para estudiar)
select 
    c.titulo, 
    c.artista, 
    c.duracion_segundos, 
    c.reproducciones, 
    c.estado_cancion
from canciones c
join playlists p on c.playlist_id = p.id
where p.nombre_playlist = 'lo-fi beats para estudiar'
order by c.reproducciones desc;

-- consulta 4: reporte analitico con el total de reproducciones y duracion acumulada por playlist
select 
    p.nombre_playlist, 
    p.creador, 
    count(c.id) as total_canciones, 
    sum(c.reproducciones) as reproducciones_totales,
    sum(c.duracion_segundos) as duracion_total_segundos
from playlists p
left join canciones c on p.id = c.playlist_id
group by p.id, p.nombre_playlist, p.creador;

-- consulta 5: listado general cruzado de canciones y playlists con formato de reporte detallado
select 
    c.titulo, 
    c.artista, 
    p.nombre_playlist, 
    p.genero_principal, 
    c.reproducciones, 
    c.estado_cancion
from canciones c
join playlists p on c.playlist_id = p.id
order by c.reproducciones desc, c.titulo asc;