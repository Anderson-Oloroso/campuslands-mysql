use garaje_motos_db;

-- 1. Filtrar marcas que tienen un promedio de costo de mantenimiento superior a 150.00 usando HAVING
select 
    m.nombre_marca as marca,
    count(mg.id_moto) as total_motos,
    round(avg(mg.costo_mantenimiento_mensual), 2) as promedio_mantenimiento
from motos_garaje mg
join marcas_moto m on mg.id_marca = m.id_marca
group by m.id_marca, m.nombre_marca
having avg(mg.costo_mantenimiento_mensual) > 150.00
order by promedio_mantenimiento desc;

-- 2. Agrupar por estado operativo y mostrar solo aquellos estados que acumulen más de 2 motos en el garaje
select 
    mg.estado_operativo as estado,
    count(*) as cantidad_motos,
    sum(mg.costo_mantenimiento_mensual) as gasto_total_estado
from motos_garaje mg
group by mg.estado_operativo
having count(*) > 2
order by cantidad_motos desc;

-- 3. Identificar marcas con una cilindrada promedio superior a 500 cc aplicando HAVING sobre la función AVG
select 
    m.nombre_marca as marca,
    count(mg.id_moto) as cantidad_modelos,
    round(avg(mg.cilindrada_cc), 1) as cilindrada_promedio_cc
from motos_garaje mg
join marcas_moto m on mg.id_marca = m.id_marca
group by m.id_marca, m.nombre_marca
having avg(mg.cilindrada_cc) > 500.0
order by cilindrada_promedio_cc desc;

-- 4. Filtrar marcas que tengan un costo total de mantenimiento mensual superior a 200.00 combinando WHERE y HAVING
select 
    m.nombre_marca as marca,
    count(mg.id_moto) as motos_activas,
    sum(mg.costo_mantenimiento_mensual) as costo_total_mantenimiento
from motos_garaje mg
join marcas_moto m on mg.id_marca = m.id_marca
where mg.estado_operativo != 'baja'
group by m.id_marca, m.nombre_marca
having sum(mg.costo_mantenimiento_mensual) > 200.00
order by costo_total_mantenimiento desc;

-- 5. Agrupar por marca y obtener aquellas que posean 2 o más motocicletas registradas en el inventario general del garaje
select 
    m.nombre_marca as marca,
    count(mg.id_moto) as total_registradas,
    max(mg.cilindrada_cc) as mayor_cilindrada
from motos_garaje mg
join marcas_moto m on mg.id_marca = m.id_marca
group by m.id_marca, m.nombre_marca
having count(mg.id_moto) >= 2
order by total_registradas desc;