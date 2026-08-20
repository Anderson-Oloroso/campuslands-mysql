use accion_aventura_db;

-- 1. ranking global de heroes ordenados por su tesoro recaudado utilizando dense_rank()
select 
    dense_rank() over (order by tesoro_recaudado desc) as ranking_tesoro,
    nombre_heroe,
    clase_combate,
    tesoro_recaudado,
    estado_mision
from personajes
order by ranking_tesoro asc;

-- 2. funcion de ventana partition by para calcular el promedio de experiencia y la diferencia respecto al promedio de su region
select 
    r.nombre_region,
    p.nombre_heroe,
    p.experiencia_acumulada,
    round(avg(p.experiencia_acumulada) over (partition by r.id_region), 2) as exp_promedio_region,
    p.experiencia_acumulada - round(avg(p.experiencia_acumulada) over (partition by r.id_region), 2) as diferencia_con_promedio_region
from personajes p
join regiones r on p.id_region = r.id_region
order by r.nombre_region asc, p.experiencia_acumulada desc;

-- 3. uso de funciones de navegacion lead() y lag() para comparar el tesoro del heroe con el siguiente y anterior en la misma faccion
select 
    f.nombre_faccion,
    p.nombre_heroe,
    p.tesoro_recaudado,
    lag(p.tesoro_recaudado, 1, 0.00) over (partition by f.id_faccion order by p.tesoro_recaudado desc) as tesoro_heroe_anterior,
    lead(p.tesoro_recaudado, 1, 0.00) over (partition by f.id_faccion order by p.tesoro_recaudado desc) as tesoro_heroe_siguiente
from personajes p
join facciones f on p.id_faccion = f.id_faccion
order by f.nombre_faccion asc, p.tesoro_recaudado desc;

-- 4. uso de funciones de agregado en ventanas con sum() acumulativo de tesoros ordenado por experiencia del heroe
select 
    nombre_heroe,
    clase_combate,
    experiencia_acumulada,
    tesoro_recaudado,
    sum(tesoro_recaudado) over (order by experiencia_acumulada rows between unbounded preceding and current row) as tesoro_acumulado_running_total
from personajes
order by experiencia_acumulada asc;

-- 5. uso de row_number() para identificar al heroe mas rico (top 1) dentro de cada faccion del juego
with ranking_facciones as (
    select 
        f.nombre_faccion,
        p.nombre_heroe,
        p.clase_combate,
        p.tesoro_recaudado,
        row_number() over (partition by f.id_faccion order by p.tesoro_recaudado desc) as fila_faccion
    from personajes p
    join facciones f on p.id_faccion = f.id_faccion
)
select 
    nombre_faccion,
    nombre_heroe,
    clase_combate,
    tesoro_recaudado
from ranking_facciones
where fila_faccion = 1
order by tesoro_recaudado desc;