use campuslands_mysql;

-- creacion de vistas para reportes
create or replace view vista_jedi_activos as
select nombre_personaje, nivel_poder
from personajes
where rol = 'jedi' and estado_personaje = 'activo';

create or replace view vista_planetas_poblados as
select nombre_planeta, poblacion_estimada
from planetas
where poblacion_estimada > 1000000;

-- consulta 1: usar vista para listar jedis activos
select * from vista_jedi_activos order by nivel_poder desc;

-- consulta 2: usar vista para listar planetas con alta poblacion
select * from vista_planetas_poblados order by poblacion_estimada desc;

-- consulta 3: reporte de promedio de poder por planeta
select 
    p.nombre_planeta, 
    avg(per.nivel_poder) as poder_promedio
from planetas p
join personajes per on p.id = per.planeta_id
group by p.nombre_planeta;

-- consulta 4: total de personajes por estado
select 
    estado_personaje, 
    count(*) as total_personajes
from personajes
group by estado_personaje;

-- consulta 5: personajes con nivel de poder superior a 80
select nombre_personaje, nivel_poder, rol
from personajes
where nivel_poder > 80
order by nivel_poder desc;