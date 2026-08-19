use arquitectura_3d_db;

-- consulta 1
select p.codigo_proyecto, p.nombre_proyecto, c.nombre_cliente, e.nombre_estilo, p.presupuesto_estimado
from proyectos_arquitectura p
join clientes c on p.id_cliente = c.id_cliente
join estilos_arquitectonicos e on p.id_estilo = e.id_estilo
where p.estado_proyecto = 'entregado'
order by p.presupuesto_estimado desc;

-- consulta 2
select p.codigo_proyecto, p.nombre_proyecto, p.area_construccion_m2, p.presupuesto_estimado
from proyectos_arquitectura p
where p.area_construccion_m2 > 200.00
order by p.area_construccion_m2 asc;

-- consulta 3
select 
    p.codigo_proyecto,
    p.nombre_proyecto,
    count(et.id_etapa) as total_fases_render,
    sum(et.horas_invertidas) as total_horas_invertidas
from proyectos_arquitectura p
join etapas_render et on p.id_proyecto = et.id_proyecto
group by p.id_proyecto, p.codigo_proyecto, p.nombre_proyecto
order by total_horas_invertidas desc;

-- consulta 4
select p.codigo_proyecto, p.nombre_proyecto, c.nombre_cliente, p.estado_proyecto
from proyectos_arquitectura p
join clientes c on p.id_cliente = c.id_cliente
where p.estado_proyecto not in ('anteproyecto', 'entregado')
order by p.codigo_proyecto asc;

-- consulta 5
select 
    e.nombre_estilo,
    count(p.id_proyecto) as total_proyectos,
    round(avg(p.presupuesto_estimado), 2) as presupuesto_promedio
from estilos_arquitectonicos e
left join proyectos_arquitectura p on e.id_estilo = p.id_estilo
group by e.id_estilo, e.nombre_estilo
order by total_proyectos desc;