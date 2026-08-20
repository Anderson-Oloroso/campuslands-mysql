use marketplace_accesorios_db;

-- asegurar que el event scheduler este habilitado en la sesion de mysql para la automatizacion
set global event_scheduler = on;

-- definicion del evento programado (event scheduler) que se ejecuta diariamente para actualizar automaticamente a 'agotado' los accesorios con stock en cero
delimiter //

create event if not exists ev_actualizar_accesorios_agotados
on schedule every 1 day
starts current_timestamp
do
begin
    -- actualizar estado a agotado cuando el stock es cero y aun no estan marcados como agotados o archivados
    update accesorios
    set estado_publicacion = 'agotado'
    where stock = 0 and estado_publicacion not in ('agotado', 'archivado');
    
    -- registrar en la tabla de auditoria los accesorios que pasaron a agotado recientemente
    insert into auditoria_eventos_stock (id_accesorio, evento_realizado, detalle_cambio)
    select id_accesorio, 'actualizacion automatica por event scheduler', 'cambio automatico a estado agotado por stock en cero'
    from accesorios
    where stock = 0 and estado_publicacion = 'agotado'
      and id_accesorio not in (select id_accesorio from auditoria_eventos_stock where evento_realizado like '%scheduler%');
end//

delimiter ;

-- 1. consulta analitica para verificar el estado de los accesorios agrupados por categoria y su valor total de inventario potencial
select 
    c.nombre_categoria,
    count(a.id_accesorio) as total_accesorios,
    sum(a.stock) as stock_total_unidades,
    round(sum(a.precio * a.stock), 2) as valor_total_inventario
from categorias c
left join accesorios a on c.id_categoria = a.id_categoria
group by c.id_categoria, c.nombre_categoria
order by valor_total_inventario desc;

-- 2. consulta para identificar accesorios con stock critico (menor o igual a 5 unidades) que requieren reabastecimiento urgente
select 
    a.nombre_accesorio,
    c.nombre_categoria,
    a.precio,
    a.stock,
    a.estado_publicacion
from accesorios a
join categorias c on a.id_categoria = c.id_categoria
where a.stock <= 5 and a.estado_publicacion != 'archivado'
order by a.stock asc, a.precio desc;

-- 3. consulta con ranking (dense_rank) de los accesorios mas caros dentro de cada categoria del marketplace
with ranking_precios as (
    select 
        c.nombre_categoria,
        a.nombre_accesorio,
        a.precio,
        a.stock,
        dense_rank() over (partition by c.id_categoria order by a.precio desc) as ranking_categoria
    from accesorios a
    join categorias c on a.id_categoria = c.id_categoria
)
select 
    nombre_categoria,
    nombre_accesorio,
    precio,
    stock,
    ranking_categoria
from ranking_precios
where ranking_categoria <= 2
order by nombre_categoria asc, ranking_categoria asc;

-- 4. reporte de auditoria automatica mostrando los eventos registrados por el programador de tareas y las acciones sobre los accesorios
ae:
select 
    ae.id_auditoria,
    a.nombre_accesorio,
    ae.evento_realizado,
    ae.detalle_cambio,
    ae.fecha_evento
from auditoria_eventos_stock ae
join accesorios a on ae.id_accesorio = a.id_accesorio
order by ae.fecha_evento desc;

-- 5. consulta resumen para evaluar la distribucion porcentual de accesorios segun su estado de publicacion actual
with conteo_estados as (
    select 
        estado_publicacion,
        count(*) as cantidad_accesorios
    from accesorios
    group by estado_publicacion
),
total_general as (
    select sum(cantidad_accesorios) as global_total from conteo_estados
)
select 
    ce.estado_publicacion,
    ce.cantidad_accesorios,
    concat(round((ce.cantidad_accesorios * 100.0) / tg.global_total, 2), '%') as porcentaje_catalogo
from conteo_estados ce
cross join total_general tg
order by ce.cantidad_accesorios desc;