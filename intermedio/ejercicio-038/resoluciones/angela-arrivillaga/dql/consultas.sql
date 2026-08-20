use futbol_sala_3fn_db;

-- 1. Listado completo de equipos con su respectiva sede y ciudad de origen (Validación de normalización 3FN con múltiples JOINs)
select 
    e.nombre_equipo,
    s.nombre_sede,
    c.nombre_ciudad,
    c.departamento_estado,
    s.capacidad,
    e.fecha_fundacion
from equipos e
join sedes s on e.id_sede_principal = s.id_sede
join ciudades c on s.id_ciudad = c.id_ciudad
order bY c.nombre_ciudad asc;

-- 2. Historial de partidos finalizados con desglose de equipos, sede del encuentro y diferencia de goles
select 
    p.id_partido,
    cat.nombre_categoria,
    el.nombre_equipo as equipo_local,
    ev.nombre_equipo as equipo_visitante,
    p.goles_local,
    p.goles_visitante,
    s.nombre_sede,
    p.fecha_hora,
    abs(p.goles_local - p.goles_visitante) as diferencia_goles
from partidos p
join categorias cat on p.id_categoria = cat.id_categoria
join equipos el on p.id_equipo_local = el.id_equipo
join equipos ev on p.id_equipo_visitante = ev.id_equipo
join sedes s on p.id_sede = s.id_sede
where p.estado_partido = 'finalizado'
order by p.fecha_hora desc;

-- 3. Tabla de goleadores destacados de la liga con su respectivo equipo y posición en la cancha
select 
    j.nombre_completo as jugador,
    j.posicion,
    j.dorsal,
    e.nombre_equipo,
    j.goles_anotados,
    j.tarjetas_amarillas,
    j.tarjetas_rojas
from jugadores j
join equipos e on j.id_equipo = e.id_equipo
order by j.goles_anotados desc, j.tarjetas_amarillas asc;

-- 4. Reporte analítico de capacidad de asistencia y sedes registradas por ciudad
select 
    c.nombre_ciudad,
    count(s.id_sede) as total_sedes,
    sum(s.capacidad) as capacidad_total_ciudad,
    round(avg(s.capacidad), 0) as promedio_capacidad_sede
from ciudades c
left join sedes s on c.id_ciudad = s.id_ciudad
group by c.id_ciudad, c.nombre_ciudad
order by capacidad_total_ciudad desc;

-- 5. Consulta de partidos programados pendientes de disputarse
select 
    p.id_partido,
    cat.nombre_categoria,
    el.nombre_equipo as local,
    ev.nombre_equipo as visitante,
    s.nombre_sede,
    c.nombre_ciudad,
    p.fecha_hora
from partidos p
join categorias cat on p.id_categoria = cat.id_categoria
join equipos el on p.id_equipo_local = el.id_equipo
join equipos ev on p.id_equipo_visitante = ev.id_equipo
join sedes s on p.id_sede = s.id_sede
join ciudades c on s.id_ciudad = c.id_ciudad
where p.estado_partido = 'programado'
order by p.fecha_hora asc;