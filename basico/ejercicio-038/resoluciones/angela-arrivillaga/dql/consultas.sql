use futbol_sala_db;

-- listado general de jugadores de fútbol sala ordenados por cantidad de goles anotados de forma descendente
select j.nombre_completo, j.dorsal, p.nombre_posicion, j.goles_anotados, j.tarjetas_amarillas, j.salario_mensual, j.estado_jugador
from jugadores_sala j
join posiciones p on j.id_posicion = p.id_posicion
order by j.goles_anotados desc;

-- consulta filtrada con where para identificar jugadores activos con más de diez goles anotados
select j.nombre_completo, p.nombre_posicion, j.goles_anotados, j.salario_mensual
from jugadores_sala j
join posiciones p on j.id_posicion = p.id_posicion
where j.estado_jugador = 'activo' and j.goles_anotados > 10
order by j.goles_anotados desc;

-- resumen estadístico agrupado por posición con totales de goles, salarios promedios y nómina acumulada
select 
    p.nombre_posicion,
    count(j.id_jugador) as total_jugadores,
    sum(j.goles_anotados) as goles_totales,
    round(avg(j.salario_mensual), 2) as salario_promedio,
    sum(j.salario_mensual) as nomina_acumulada
from posiciones p
left join jugadores_sala j on p.id_posicion = j.id_posicion
group by p.id_posicion, p.nombre_posicion
order by goles_totales desc;

-- top cinco de los máximos goleadores actualizados tras las modificaciones del update
select j.nombre_completo, p.nombre_posicion, j.goles_anotados, j.salario_mensual, j.estado_jugador
from jugadores_sala j
join posiciones p on j.id_posicion = p.id_posicion
order by j.goles_anotados desc
limit 5;

-- reporte de auditoria y control para jugadores que se encuentran con estado de sanción o lesión
select j.nombre_completo, p.nombre_posicion, j.estado_jugador, j.tarjetas_amarillas, j.salario_mensual
from jugadores_sala j
join posiciones p on j.id_posicion = p.id_posicion
where j.estado_jugador in ('lesionado', 'suspendido')
order by j.tarjetas_amarillas desc;