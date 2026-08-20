use arquitectura_3d_roles_db;

-- 1. Consulta para verificar los privilegios asignados a los roles creados en la base de datos del sistema MySQL
select 
    user as rol_o_usuario,
    host,
    select_priv,
    insert_priv,
    update_priv,
    delete_priv
from mysql.user
where user like 'rol_%';

-- 2. Reporte general de proyectos de arquitectura ordenados por presupuesto en formato monetario claro
select 
    p.nombre_proyecto,
    a.nombre_completo as arquitecto_lider,
    s.nombre_software as software_principal,
    p.superficie_m2,
    concat('$', format(p.presupuesto_usd, 2)) as presupuesto_formateado,
    p.estado_proyecto
from proyectos_arquitectura p
join arquitectos a on p.id_arquitecto = a.id_arquitecto
join software_cad s on p.id_software = s.id_software
order by p.presupuesto_usd desc;

-- 3. Análisis de inversión por categoría de software CAD y BIM utilizado
select 
    s.categoria,
    count(p.id_proyecto) as total_proyectos,
    sum(p.superficie_m2) as superficie_total_construible_m2,
    concat('$', format(sum(p.presupuesto_usd), 2)) as inversion_total_acumulada
from software_cad s
join proyectos_arquitectura p on s.id_software = p.id_software
group by s.categoria
order by sum(p.presupuesto_usd) desc;

-- 4. Reporte analítico de componentes 3D más utilizados en los proyectos de arquitectura
select 
    c.nombre_componente,
    c.tipo_elemento,
    sum(pc.cantidad) as total_instancias_usadas,
    round(avg(c.peso_archivo_mb), 2) as peso_promedio_mb
from componentes_3d c
join proyectos_componentes pc on c.id_componente = pc.id_componente
group by c.id_componente, c.nombre_componente, c.tipo_elemento
order by total_instancias_usadas desc;

-- 5. Consulta de Ranking (Top 3) de proyectos con mayor superficie en metros cuadrados (m²)
select 
    p.nombre_proyecto,
    a.nombre_completo as arquitecto,
    p.superficie_m2,
    p.estado_proyecto
from proyectos_arquitectura p
join arquitectos a on p.id_arquitecto = a.id_arquitecto
order by p.superficie_m2 desc
limit 3;