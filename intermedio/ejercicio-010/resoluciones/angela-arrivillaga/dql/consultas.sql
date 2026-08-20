use campuslands_mysql;

-- 1. listado de inscripciones mostrando detalles de la carrera y el corredor mediante joins
select 
    c.codigo_carrera,
    c.nombre_evento as evento,
    co.nombre_completo as corredor,
    ic.numero_dorsal,
    ic.estado_pago
from inscripciones_carrera ic
join carreras_urbanas c on ic.carrera_id = c.id
join corredores co on ic.corredor_id = co.id
order by c.id asc, ic.numero_dorsal asc;

-- 2. total de corredores inscritos agrupados por cada carrera urbana
select 
    c.nombre_evento as evento,
    c.distancia_km,
    count(ic.corredor_id) as total_inscritos
from carreras_urbanas c
left join inscripciones_carrera ic on c.id = ic.carrera_id
group by c.id, c.nombre_evento, c.distancia_km
order by total_inscritos desc;

-- 3. listado de corredores cuyo estado de pago de inscripcion sea pagado
select 
    co.nombre_completo as corredor,
    co.correo_electronico,
    c.nombre_evento as evento,
    ic.estado_pago
from inscripciones_carrera ic
join corredores co on ic.corredor_id = co.id
join carreras_urbanas c on ic.carrera_id = c.id
where ic.estado_pago = 'pagado'
order by co.nombre_completo asc;

-- 4. top carreras con mayor distancia de recorrido registradas en el sistema
select 
    nombre_evento,
    distancia_km,
    fecha_evento
from carreras_urbanas
order by distancia_km desc
limit 3;

-- 5. reporte de corredores filtrados por genero femenino ordenados por anio de nacimiento
select 
    nombre_completo,
    correo_electronico,
    anio_nacimiento,
    genero
from corredores
where genero = 'femenino'
order by anio_nacimiento desc;