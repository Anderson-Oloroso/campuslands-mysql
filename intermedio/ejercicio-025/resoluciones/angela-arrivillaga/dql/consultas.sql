use laboratorio_quimico_db;

-- consulta 1
select f.codigo_formula, f.nombre_formula, f.formula_molecular, c.nombre_categoria, i.nombre_investigador, f.rendimiento_porcentaje
from formulas_quimicas f
join categorias_reactivos c on f.id_categoria = c.id_categoria
join investigadores i on f.id_investigador = i.id_investigador
where f.estado_formula = 'patentada'
order by f.rendimiento_porcentaje desc;

-- consulta 2
select f.codigo_formula, f.nombre_formula, f.formula_molecular, f.rendimiento_porcentaje
from formulas_quimicas f
where f.rendimiento_porcentaje > 85.00
order by f.rendimiento_porcentaje desc;

-- consulta 3
select 
    i.nombre_investigador,
    i.codigo_empleado,
    count(f.id_formula) as total_formulas_registradas,
    round(avg(f.rendimiento_porcentaje), 2) as rendimiento_promedio
from investigadores i
left join formulas_quimicas f on i.id_investigador = f.id_investigador
group by i.id_investigador, i.nombre_investigador, i.codigo_empleado
order by total_formulas_registradas desc;

-- consulta 4
select f.codigo_formula, f.nombre_formula, i.nombre_investigador, f.estado_formula
from formulas_quimicas f
join investigadores i on f.id_investigador = i.id_investigador
where f.estado_formula not in ('patentada', 'rechazada')
order by f.codigo_formula asc;

-- consulta 5
select 
    c.nombre_categoria,
    c.nivel_peligrosidad,
    count(f.id_formula) as total_formulas,
    round(avg(f.rendimiento_porcentaje), 2) as rendimiento_promedio_categoria
from categorias_reactivos c
left join formulas_quimicas f on c.id_categoria = f.id_categoria
group by c.id_categoria, c.nombre_categoria, c.nivel_peligrosidad
order by total_formulas desc;