-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    id_salto,
    nombre_paracaidista,
    modalidad,
    altitud_pies,
    tiempo_caida_libre_seg,
    lugar_zona_salto,
    fecha_salto
FROM saltos_paracaidismo
ORDER BY fecha_salto DESC;
