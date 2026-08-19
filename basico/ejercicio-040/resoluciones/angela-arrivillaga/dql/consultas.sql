use carreras_urbanas_db;

-- uso intensivo de count para obtener el total general de corredores registrados y sum para calcular la recaudación total bruta
select 
    count(id_corredor) as total_corredores_inscritos,
    sum(costo_inscripcion) as recaudacion_total_bruta
from corredores;

-- reporte analitico utilizando count y sum agrupados por categoria de carrera para evaluar participantes e ingresos por modalidad
select 
    c.nombre_categoria,
    c.distancia_km,
    count(co.id_corredor) as total_participantes,
    sum(co.costo_inscripcion) as ingresos_categoria
from categorias_carrera c
left join corredores co on c.id_categoria = co.id_categoria
group by c.id_categoria, c.nombre_categoria, c.distancia_km
order by ingresos_categoria desc;

-- consulta filtrada aplicando count y sum para medir rendimiento de corredores que finalizaron exitosamente la ruta
select 
    c.nombre_categoria,
    count(co.id_corredor) as corredores_finalizados,
    sum(co.costo_inscripcion) as ingresos_finalizados
from categorias_carrera c
join corredores co on c.id_categoria = co.id_categoria
where co.estado_participacion = 'finalizado'
group by c.id_categoria, c.nombre_categoria
order by corredores_finalizados desc;

-- top de categorias ordenadas por la suma total de ingresos generados en las inscripciones
select 
    c.nombre_categoria,
    count(co.id_corredor) as cantidad_atletas,
    sum(co.costo_inscripcion) as suma_total_recaudada
from categorias_carrera c
left join corredores co on c.id_categoria = co.id_categoria
group by c.id_categoria, c.nombre_categoria
order by suma_total_recaudada desc
limit 5;

-- reporte detallado combinando listado general con funciones de agregacion para verificar estados de participacion
select 
    co.nombre_completo,
    c.nombre_categoria,
    co.costo_inscripcion,
    co.tiempo_meta_minutos,
    co.estado_participacion
from corredores co
join categorias_carrera c on co.id_categoria = c.id_categoria
order by co.estado_participacion asc, co.tiempo_meta_minutos asc;