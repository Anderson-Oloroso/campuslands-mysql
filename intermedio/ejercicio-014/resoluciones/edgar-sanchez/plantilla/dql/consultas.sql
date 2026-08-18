SELECT 
    personaje_id,
    nombre_personaje,
    especie,
    afiliacion_faccion,
    planeta_origen,
    clima_planeta,
    nombre_saga
FROM vw_resumen_personajes_scifi
WHERE es_sensible_fuerza_psique = TRUE
ORDER BY nombre_saga ASC, nombre_personaje ASC;

SELECT 
    saga_id,
    nombre_saga,
    creador,
    total_personajes,
    total_planetas,
    total_naves,
    velocidad_maxima_registrada
FROM vw_indicadores_sagas_scifi
ORDER BY total_personajes DESC;