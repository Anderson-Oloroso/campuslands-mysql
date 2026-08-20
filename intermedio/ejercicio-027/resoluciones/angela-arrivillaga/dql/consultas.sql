use juego_accion_db;

-- reporte de misiones completadas con detalles de region y arma requerida
select m.codigo_mision, m.titulo_mision, r.nombre_region, t.nombre_tipo, m.recompensa_oro, m.estado_mision
from misiones_aventura m
join regiones_mapa r on m.id_region = r.id_region
join tipos_arma t on m.id_tipo_arma = t.id_tipo_arma
where m.estado_mision = 'completada'
order by m.recompensa_oro desc;

-- reporte de misiones de alta recompensa economica superior a cuatro mil de oro
select m.codigo_mision, m.titulo_mision, m.recompensa_oro, m.puntos_experiencia
from misiones_aventura m
where m.recompensa_oro > 4000.00
order by m.recompensa_oro desc;

-- reporte estadistico de rendimiento y ganancias agrupadas por tipo de arma
select 
    t.nombre_tipo,
    count(m.id_mision) as total_misiones,
    round(avg(m.recompensa_oro), 2) as oro_promedio,
    sum(m.puntos_experiencia) as experiencia_total
from tipos_arma t
left join misiones_aventura m on t.id_tipo_arma = m.id_tipo_arma
group by t.id_tipo_arma, t.nombre_tipo
order by total_misiones desc;

-- reporte de misiones que se encuentran en curso o disponibles para el jugador
select m.codigo_mision, m.titulo_mision, r.nombre_region, m.estado_mision
from misiones_aventura m
join regiones_mapa r on m.id_region = r.id_region
where m.estado_mision in ('disponible', 'en_curso')
order by m.codigo_mision asc;

-- reporte analitico de dificultad y carga de misiones agrupadas por region del mapa
select 
    r.nombre_region,
    r.nivel_recomendado,
    count(m.id_mision) as total_misiones_region,
    round(avg(m.puntos_experiencia), 0) as experiencia_promedio
from regiones_mapa r
left join misiones_aventura m on r.id_region = m.id_region
group by r.id_region, r.nombre_region, r.nivel_recomendado
order by r.nivel_recomendado asc;