use playlist_musical_db;

-- 1. uso de row_number() para rankear las canciones segun reproducciones dentro de cada genero musical
select 
    row_number() over (partition by g.nombre_genero order by c.reproducciones desc) as ranking_genero,
    c.titulo_cancion,
    c.artista,
    g.nombre_genero,
    c.reproducciones,
    c.calificacion
from canciones c
join generos_musicales g on c.id_genero = g.id_genero;

-- 2. uso de rank() para identificar posiciones basadas en la calificacion general de las canciones
select 
    rank() over (order by c.calificacion desc) as posicion_ranking,
    c.titulo_cancion,
    c.artista,
    g.nombre_genero,
    c.calificacion,
    c.reproducciones
from canciones c
join generos_musicales g on c.id_genero = g.id_genero;

-- 3. uso de sum() como funcion de ventana para calcular acumulados de reproducciones ordenados por duracion de pista
select 
    c.titulo_cancion,
    c.artista,
    c.duracion_segundos,
    c.reproducciones,
    sum(c.reproducciones) over (order by c.duracion_segundos rows between unbounded preceding and current row) as reproducciones_acumuladas_por_duracion
from canciones c;

-- 4. uso de avg() como funcion de ventana para comparar la calificacion de cada cancion frente al promedio de su genero
select 
    c.titulo_cancion,
    c.artista,
    g.nombre_genero,
    c.calificacion,
    round(avg(c.calificacion) over (partition by g.id_genero), 2) as promedio_calificacion_genero,
    round(c.calificacion - avg(c.calificacion) over (partition by g.id_genero), 2) as diferencia_con_promedio
from canciones c
join generos_musicales g on c.id_genero = g.id_genero;

-- 5. uso de dense_rank() combinado con filtro de estado para ordenar las canciones activas segun su nivel de reproducciones
select 
    dense_rank() over (order by c.reproducciones desc) as posicion_activa,
    c.titulo_cancion,
    c.artista,
    g.nombre_genero,
    c.reproducciones,
    c.estado_cancion
from canciones c
join generos_musicales g on c.id_genero = g.id_genero
where c.estado_cancion = 'activa';