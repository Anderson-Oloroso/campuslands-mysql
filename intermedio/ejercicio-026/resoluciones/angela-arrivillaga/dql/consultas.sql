use videojuego_rpg_db;

-- consulta 1
select p.codigo_personaje, p.nombre_personaje, c.nombre_clase, f.nombre_faccion, p.nivel, p.estado_jugador
from personajes_rpg p
join clases_personaje c on p.id_clase = c.id_clase
join facciones f on p.id_faccion = f.id_faccion
where p.estado_jugador = 'activo'
order by p.nivel desc;

-- consulta 2
select p.codigo_personaje, p.nombre_personaje, p.nivel, p.puntos_vida, p.puntos_mana
from personajes_rpg p
where p.nivel > 75
order by p.puntos_vida desc;

-- consulta 3
select 
    c.nombre_clase,
    count(p.id_personaje) as total_personajes,
    round(avg(p.nivel), 1) as nivel_promedio,
    max(p.experiencia) as max_experiencia
from clases_personaje c
left join personajes_rpg p on c.id_clase = p.id_clase
group by c.id_clase, c.nombre_clase
order by total_personajes desc;

-- consulta 4
select p.codigo_personaje, p.nombre_personaje, c.nombre_clase, p.estado_jugador
from personajes_rpg p
join clases_personaje c on p.id_clase = c.id_clase
where p.estado_jugador not in ('activo', 'retirado')
order by p.codigo_personaje asc;

-- consulta 5
select 
    f.nombre_faccion,
    f.alineacion,
    count(p.id_personaje) as total_miembros,
    round(avg(p.puntos_vida), 0) as vida_promedio
from facciones f
left join personajes_rpg p on f.id_faccion = p.id_faccion
group by f.id_faccion, f.nombre_faccion, f.alineacion
order by total_miembros desc;