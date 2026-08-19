use soldadura_bloqueos_db;

-- 1. Demostración de Bloqueo Exclusivo de Escritura (SELECT ... FOR UPDATE) para actualizar estado de juntas pendientes
start transaction;
select id_junta, codigo_junta, resultado_inspeccion 
from juntas_soldadas 
where resultado_inspeccion = 'pendiente' 
for update;

update juntas_soldadas 
set resultado_inspeccion = 'aprobado_radiografia' 
where resultado_inspeccion = 'pendiente';
commit;

-- 2. Demostración de Bloqueo Compartido de Lectura (SELECT ... LOCK IN SHARE MODE / FOR SHARE) para auditoría de inventario de consumibles
start transaction;
select 
    nombre_consumible,
    tipo_consumible,
    stock_kg
from consumibles
where stock_kg < 200.00
lock in share mode;
commit;

-- 3. Reporte analítico de juntas soldadas por soldador, mostrando totales y estado de inspección
select 
    s.nombre_completo as soldador,
    s.certificacion,
    count(j.id_junta) as total_juntas_procesadas,
    sum(case when j.resultado_inspeccion = 'aprobado_radiografia' then 1 else 0 end) as aprobadas,
    sum(case when j.resultado_inspeccion = 'rechazado' then 1 else 0 end) as rechazadas
from soldadores s
left join juntas_soldadas j on s.id_soldador = j.id_soldador
group by s.id_soldador, s.nombre_completo, s.certificacion
order by total_juntas_procesadas desc;

-- 4. Reporte analítico de consumo de materiales por proceso de soldadura en los equipos utilizados
select 
    e.proceso_soldadura,
    count(distinct j.id_junta) as total_juntas,
    round(sum(jc.consumo_kg), 2) as consumo_total_material_kg
from equipos_soldadura e
join juntas_soldadas j on e.id_equipo = j.id_equipo
join juntas_consumibles jc on j.id_junta = jc.id_junta
group by e.proceso_soldadura
order by consumo_total_material_kg desc;

-- 5. Consulta de Ranking (Top 3) de juntas con mayor espesor de material soldado (Trabajo pesado)
select 
    j.codigo_junta,
    s.nombre_completo as soldador,
    j.material_base,
    j.espesor_mm,
    j.resultado_inspeccion
from juntas_soldadas j
join soldadores s on j.id_soldador = s.id_soldador
order by j.espesor_mm desc
limit 3;