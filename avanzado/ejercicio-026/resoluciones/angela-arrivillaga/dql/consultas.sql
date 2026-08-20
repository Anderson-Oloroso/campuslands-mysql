use rgp_videojuego_db;

-- 1. consulta con cte para calcular el nivel promedio de los personajes por cada clase y filtrar las que superan el promedio general
with promedio_clase as (
    select 
        c.nombre_clase,
        c.rol_principal,
        avg(p.nivel) as nivel_promedio_clase
    from personajes p
    join clases c on p.id_clase = c.id_clase
    group by c.nombre_clase, c.rol_principal
),
promedio_global as (
    select avg(nivel) as nivel_global from personajes
)
select 
    pc.nombre_clase,
    pc.rol_principal,
    round(pc.nivel_promedio_clase, 2) as nivel_promedio_clase,
    round(pg.nivel_global, 2) as nivel_global_servidor
from promedio_clase pc
cross join promedio_global pg
where pc.nivel_promedio_clase >= pg.nivel_global
order by pc.nivel_promedio_clase desc;

-- 2. consulta con cte recursiva para generar una secuencia de niveles de maestria y contar cuantos personajes hay en cada rango simulado
with recursive jerarquia_niveles as (
    select 1 as rango_min, 10 as rango_max, 'principiante' as categoria_rango
    union all
    select rango_max + 1, rango_max + 10, 
           case 
               when rango_max + 1 = 11 then 'intermedio'
               when rango_max + 1 = 21 then 'avanzado'
               when rango_max + 1 = 31 then 'experto'
               else 'maestro_legendario'
           end
    from jerarquia_niveles
    where rango_max < 50
),
conteo_personajes_rango as (
    select 
        jn.categoria_rango,
        jn.rango_min,
        jn.rango_max,
        count(p.id_personaje) as total_personajes
    from jerarquia_niveles jn
    left join personajes p on p.nivel between jn.rango_min and jn.rango_max
    group by jn.categoria_rango, jn.rango_min, jn.rango_max
)
select 
    categoria_rango,
    concat(rango_min, ' - ', rango_max) as rango_niveles,
    total_personajes
from conteo_personajes_rango
order by rango_min asc;

-- 3. consulta con multiples cte para identificar el ranking de jugadores segun la riqueza total acumulada en oro de sus personajes activos
with riqueza_personajes as (
    select 
        id_jugador,
        sum(oro) as oro_total_personajes,
        max(nivel) as nivel_maximo_alcanzado
    from personajes
    where estado_personaje != 'retirado'
    group by id_jugador
),
ranking_jugadores as (
    select 
        j.nombre_usuario,
        j.correo,
        rp.oro_total_personajes,
        rp.nivel_maximo_alcanzado,
        dense_rank() over (order by rp.oro_total_personajes desc) as ranking_riqueza
    from jugadores j
    join riqueza_personajes rp on j.id_jugador = rp.id_jugador
)
select 
    ranking_riqueza,
    nombre_usuario,
    correo,
    oro_total_personajes,
    nivel_maximo_alcanzado
from ranking_jugadores
where ranking_riqueza <= 3
order by ranking_riqueza asc;

-- 4. consulta con cte para evaluar el rendimiento de misiones analizando cuantas misiones epicas o dificiles ha completado cada personaje
with misiones_destacadas as (
    select 
        id_mision,
        titulo_mision,
        dificultad,
        recompensa_oro
    from misiones
    where dificultad in ('dificil', 'epica')
),
progreso_misiones_personaje as (
    select 
        p.id_personaje,
        p.nombre_personaje,
        c.nombre_clase,
        count(mp.id_mision) as total_misiones_superiores_completadas,
        sum(md.recompensa_oro) as oro_extra_ganado
    from personajes p
    join clases c on p.id_clase = c.id_clase
    join misiones_personajes mp on p.id_personaje = mp.id_personaje and mp.estado_completado = 'completada'
    join misiones_destacadas md on mp.id_mision = md.id_mision
    group by p.id_personaje, p.nombre_personaje, c.nombre_clase
)
select 
    nombre_personaje,
    nombre_clase,
    total_misiones_superiores_completadas,
    coalesce(oro_extra_ganado, 0.00) as oro_extra_ganado
from progreso_misiones_personaje
order by total_misiones_superiores_completadas desc, oro_extra_ganado desc;

-- 5. consulta con cte para obtener un reporte resumen de estado operativo de los personajes y el promedio de experiencia acumulada
with resumen_estado as (
    select 
        estado_personaje,
        count(*) as cantidad_personajes,
        round(avg(experiencia), 2) as experiencia_promedio,
        sum(oro) as oro_acumulado_estado
    from personajes
    group by estado_personaje
),
total_general_servidor as (
    select sum(cantidad_personajes) as total_global from resumen_estado
)
select 
    re.estado_personaje,
    re.cantidad_personajes,
    concat(round((re.cantidad_personajes * 100.0) / tgs.total_global, 2), '%') as porcentaje_del_total,
    re.experiencia_promedio,
    re.oro_acumulado_estado
from resumen_estado re
cross join total_general_servidor tgs
order by re.cantidad_personajes desc;