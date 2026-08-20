use campuslands_mysql;

-- consulta 1: promedio de tiempo de llegada y costo de inscripcion por categoria para quienes completaron
select 
    c.nombre_categoria, 
    c.distancia_km, 
    avg(co.tiempo_llegada_minutos) as promedio_tiempo_minutos, 
    count(co.id) as total_completados
from categorias_carrera c
join corredores_urbanos co on c.id = co.categoria_id
where co.estado_participacion = 'completado'
group by c.id, c.nombre_categoria, c.distancia_km;

-- consulta 2: top 3 corredores mas veloces en general ordenados por menor tiempo de llegada
select 
    co.nombre_completo, 
    c.nombre_categoria, 
    co.tiempo_llegada_minutos, 
    co.estado_participacion
from corredores_urbanos co
join categorias_carrera c on co.categoria_id = c.id
where co.estado_participacion = 'completado'
order by co.tiempo_llegada_minutos asc
limit 3;

-- consulta 3: listado de corredores filtrados por una categoria especifica (10k express)
select 
    co.nombre_completo, 
    co.edad, 
    co.tiempo_llegada_minutos, 
    co.estado_participacion
from corredores_urbanos co
join categorias_carrera c on co.categoria_id = c.id
where c.nombre_categoria = '10k express'
order by co.tiempo_llegada_minutos asc;

-- consulta 4: reporte analitico agrupado por estado de participacion con conteo y edad promedio
select 
    estado_participacion, 
    count(*) as total_corredores, 
    avg(edad) as edad_promedio
from corredores_urbanos
group by estado_participacion;

-- consulta 5: listado completo con la relacion entre corredor, categoria e ingresos generados por inscripcion
select 
    co.nombre_completo, 
    c.nombre_categoria, 
    c.distancia_km, 
    c.costo_inscripcion, 
    co.estado_participacion
from corredores_urbanos co
join categorias_carrera c on co.categoria_id = c.id
order by c.distancia_km asc, co.nombre_completo asc;