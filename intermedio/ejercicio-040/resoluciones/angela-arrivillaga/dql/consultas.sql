use carreras_urbanas_unique_db;

-- 1. Listado completo de atletas inscritos con detalles de la carrera, número de dorsal y categoría (Demostración de integridad relacional)
select 
    a.nombre_completo as atleta,
    a.correo_electronico,
    c.nombre_carrera,
    c.edicion,
    i.numero_dorsal,
    cat.nombre_categoria,
    i.estado_pago,
    i.fecha_inscripcion
from inscripciones i
join atletas a on i.id_atleta = a.id_atleta
join carreras c on i.id_carrera = c.id_carrera
join categorias cat on i.id_categoria = cat.id_categoria
order by c.nombre_carrera asc, i.numero_dorsal asc;

-- 2. Reporte oficial de tiempos y podio de la Maratón Nocturna Bogotá (id_carrera = 1)
select 
    r.posicion_general,
    a.nombre_completo as atleta,
    i.numero_dorsal,
    cat.nombre_categoria,
    r.tiempo_oficial,
    r.estado_llegada
from resultados r
join inscripciones i on r.id_inscripcion = i.id_inscripcion
join atletas a on i.id_atleta = a.id_atleta
join categorias cat on i.id_categoria = cat.id_categoria
where i.id_carrera = 1
order by r.posicion_general asc;

-- 3. Consulta de atletas agrupados por género con conteo total de participaciones y validación de correos únicos
select 
    a.genero,
    count(i.id_inscripcion) as total_inscripciones_carreras,
    count(distinct a.id_atleta) as atletas_unicos_registrados
from atletas a
left join inscripciones i on a.id_atleta = i.id_atleta
group by a.genero;

-- 4. Reporte financiero y de estado de pagos por cada carrera urbana registrada
select 
    c.nombre_carrera,
    c.edicion,
    count(i.id_inscripcion) as total_inscritos,
    sum(case when i.estado_pago = 'pagado' then 1 else 0 end) as inscripciones_pagadas,
    sum(case when i.estado_pago = 'cortesia' then 1 else 0 end) as inscripciones_cortesia
from carreras c
left join inscripciones i on c.id_carrera = i.id_carrera
group by c.id_carrera, c.nombre_carrera, c.edicion
order by total_inscritos desc;

-- 5. Consulta analítica de rendimiento general por categoría de competencia (Promedio de tiempos en segundos aproximados o listado ordenado)
select 
    cat.nombre_categoria,
    count(r.id_resultado) as total_finalistas,
    min(r.tiempo_oficial) as mejor_tiempo,
    max(r.tiempo_oficial) as tiempo_mas_lento
from resultados r
join inscripciones i on r.id_inscripcion = i.id_inscripcion
join categorias cat on i.id_categoria = cat.id_categoria
where r.estado_llegada = 'finalizado'
group by cat.id_categoria, cat.nombre_categoria
order by mejor_tiempo asc;