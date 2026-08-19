use laboratorio_formulas_db;

-- 1. reporte de formulas quimicas agrupadas por estado con conteo y promedio de gramos requeridos por formula
select 
    estado_formula,
    count(id_formula) as total_formulas,
    round(avg(fr_stats.total_gramos), 2) as promedio_gramos_reactivos
from formulas_quimicas f
join (
    select id_formula, sum(cantidad_requerida_gramos) as total_gramos
    from formulas_reactivos
    group by id_formula
) fr_stats on f.id_formula = fr_stats.id_formula
group by estado_formula
order by total_formulas desc;

-- 2. inventario critico de reactivos con nivel de peligrosidad alta o extrema y stock menor a 5000 gramos
select 
    nombre_reactivo,
    formula_quimica,
    peligrosidad,
    stock_gramos
from reactivos
where peligrosidad in ('alta', 'extrema') and stock_gramos < 5000.00
order by stock_gramos asc;

-- 3. reporte de productividad por investigador mostrando numero de formulas aprobadas y en prueba
select 
    i.nombre_completo as investigador,
    i.especialidad,
    sum(case when f.estado_formula = 'aprobada' then 1 else 0 end) as formulas_aprobadas,
    sum(case when f.estado_formula = 'en_prueba' then 1 else 0 end) as formulas_en_prueba,
    count(f.id_formula) as total_formulas_registradas
from investigadores i
left join formulas_quimicas f on i.id_investigador = f.id_investigador
group by i.id_investigador, i.nombre_completo, i.especialidad
order by formulas_aprobadas desc, total_formulas_registradas desc;

-- 4. listado detallado de formulas aprobadas junto con sus reactivos principales y cantidades
select 
    f.nombre_formula,
    r.nombre_reactivo,
    r.formula_quimica,
    fr.cantidad_requerida_gramos,
    r.peligrosidad
from formulas_quimicas f
join formulas_reactivos fr on f.id_formula = fr.id_formula
join reactivos r on fr.id_reactivo = r.id_reactivo
where f.estado_formula = 'aprobada'
order by f.nombre_formula asc, fr.cantidad_requerida_gramos desc;

-- 5. ranking (top 3) de formulas quimicas que requieren mayor cantidad total de gramos en sus componentes
select 
    f.nombre_formula,
    i.nombre_completo as investigador_responsable,
    f.estado_formula,
    sum(fr.cantidad_requerida_gramos) as total_gramos_requeridos
from formulas_quimicas f
join investigadores i on f.id_investigador = i.id_investigador
join formulas_reactivos fr on f.id_formula = fr.id_formula
group by f.id_formula, f.nombre_formula, i.nombre_completo, f.estado_formula
order by total_gramos_requeridos desc
limit 3;