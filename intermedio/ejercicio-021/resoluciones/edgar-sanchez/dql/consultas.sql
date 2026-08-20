-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    i.ilustracion_id,
    i.titulo_ilustracion,
    a.nickname AS artista,
    s.nombre_software,
    CONCAT(i.ancho_px, 'x', i.alto_px) AS dimensiones_px,
    i.resolucion_dpi,
    i.horas_trabajo,
    GROUP_CONCAT(DISTINCT ie.nombre_etiqueta ORDER BY ie.nombre_etiqueta ASC SEPARATOR ', ') AS etiquetas_1fn,
    GROUP_CONCAT(DISTINCT ic.codigo_hex ORDER BY ic.codigo_hex ASC SEPARATOR ', ') AS paleta_hex_1fn
FROM ilustraciones i
INNER JOIN artistas_dibujo a ON i.artista_id = a.artista_id
INNER JOIN software_dibujo s ON i.software_id = s.software_id
LEFT JOIN ilustracion_etiquetas ie ON i.ilustracion_id = ie.ilustracion_id
LEFT JOIN ilustracion_paleta_colores ic ON i.ilustracion_id = ic.ilustracion_id
GROUP BY i.ilustracion_id, i.titulo_ilustracion, a.nickname, s.nombre_software, i.ancho_px, i.alto_px, i.resolucion_dpi, i.horas_trabajo
ORDER BY i.fecha_creacion DESC;

SELECT 
    ie.nombre_etiqueta,
    COUNT(DISTINCT ie.ilustracion_id) AS total_ilustraciones,
    COALESCE(ROUND(AVG(i.horas_trabajo), 2), 0.00) AS promedio_horas_invertidas
FROM ilustracion_etiquetas ie
INNER JOIN ilustraciones i ON ie.ilustracion_id = i.ilustracion_id
GROUP BY ie.nombre_etiqueta
ORDER BY total_ilustraciones DESC, promedio_horas_invertidas DESC;