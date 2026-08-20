use pingpong_club_db;

-- 1. consulta para listar todos los jugadores activos ordenados por su puntaje de ranking de mayor a menor
select 
    j.nombre_completo,
    c.nombre_categoria,
    j.correo,
    j.edad,
    j.puntaje_ranking,
    j.estado_jugador
from jugadores j
join categorias_nivel c on j.id_categoria = c.id_categoria
where j.estado_jugador = 'activo'
order by j.puntaje_ranking desc;

-- 2. consulta para calcular estadisticas generales (total de jugadores, promedio de edad y promedio de puntaje) agrupadas por categoria
select 
    c.nombre_categoria,
    count(j.id_jugador) as total_jugadores,
    round(avg(j.edad), 1) as edad_promedio,
    round(avg(j.puntaje_ranking), 1) as puntaje_promedio
from categorias_nivel c
left join jugadores j on c.id_categoria = j.id_categoria
group by c.id_categoria, c.nombre_categoria
order by puntaje_promedio desc;

-- 3. consulta para identificar jugadores con puntaje de ranking superior o igual a 1500 (nivel competitivo alto)
select 
    j.nombre_completo,
    c.nombre_categoria,
    j.puntaje_ranking,
    j.estado_jugador,
    j.fecha_registro
from jugadores j
join categorias_nivel c on j.id_categoria = c.id_categoria
where j.puntaje_ranking >= 1500
order by j.puntaje_ranking desc;

-- 4. consulta para filtrar jugadores segun su estado operativo (ej. lesionados o suspendidos) que requieren seguimiento medico o disciplinario
select 
    j.nombre_completo,
    c.nombre_categoria,
    j.correo,
    j.estado_jugador,
    j.fecha_registro
from jugadores j
join categorias_nivel c on j.id_categoria = c.id_categoria
where j.estado_jugador in ('lesionado', 'suspendido')
order by j.estado_jugador asc, j.fecha_registro asc;

-- 5. consulta para obtener el top 3 de jugadores con mayor puntaje en el club de tenis de mesa
select 
    j.nombre_completo,
    c.nombre_categoria,
    j.puntaje_ranking,
    j.estado_jugador
from jugadores j
join categorias_nivel c on j.id_categoria = c.id_categoria
order by j.puntaje_ranking desc
limit 3;