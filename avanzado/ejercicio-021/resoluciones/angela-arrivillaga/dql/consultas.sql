use dibujo_digital_explain_db;

-- 1. Análisis de rendimiento con EXPLAIN para una consulta filtrada por estado de publicación y ordenada por fecha
explain select 
    o.titulo_obra,
    a.nombre_artistico,
    s.nombre_software,
    o.resolucion_ancho,
    o.resolucion_alto,
    o.fecha_creacion
from obras o
join artistas a on o.id_artista = a.id_artista
join software_dibujo s on o.id_software = s.id_software
where o.estado_publicacion = 'publicado'
order by o.fecha_creacion desc;

-- 2. Análisis con EXPLAIN para consulta de búsqueda por artista específico utilizando el índice compuesto (id_artista, fecha_creacion)
explain select 
    o.titulo_obra,
    o.megabytes_peso,
    o.estado_publicacion
from obras o
where o.id_artista = 1
  and o.fecha_creacion >= '2026-01-01 00:00:00';

-- 3. Análisis con EXPLAIN para reporte de uso de software de dibujo (Agregación con GROUP BY)
explain select 
    s.nombre_software,
    count(o.id_obra) as total_obras_creadas,
    round(avg(o.megabytes_peso), 2) as promedio_peso_mb
from software_dibujo s
left join obras o on s.id_software = o.id_software
group by s.id_software, s.nombre_software
order by total_obras_creadas desc;

-- 4. Análisis con EXPLAIN para consulta relacional avanzada con múltiples JOINs (Obra, Artistas, Software y Pinceles)
explain select 
    o.titulo_obra,
    a.nombre_artistico,
    p.nombre_pincel,
    p.tipo_trazo
from obras o
join artistas a on o.id_artista = a.id_artista
join obras_pinceles op on o.id_obra = op.id_obra
join pinceles p on op.id_pincel = p.id_pincel
where o.resolucion_ancho >= 2560;

-- 5. Análisis con EXPLAIN FORMAT=TREE para evaluar el plan de ejecución detallado de la consulta principal de obras publicadas
explain format = tree select 
    a.nombre_artistico,
    count(o.id_obra) as obras_publicadas,
    sum(o.megabytes_peso) as peso_total_almacenado
from artistas a
join obras o on a.id_artista = o.id_artista
where o.estado_publicacion = 'publicado'
group by a.id_artista, a.nombre_artistico
order by peso_total_almacenado desc;