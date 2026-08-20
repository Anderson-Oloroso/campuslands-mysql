USE campuslands_mysql;

SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_artista,
    estilo,
    zona_cuerpo,
    precio
FROM tatuajes;

SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes
WHERE estado = 'completado';

SELECT
    nombre_cliente,
    estilo,
    zona_cuerpo,
    precio
FROM tatuajes
WHERE precio >= 400
ORDER BY precio DESC;

SELECT
    nombre_cliente,
    nombre_artista,
    tamano_cm,
    precio,
    fecha_cita
FROM tatuajes
WHERE tamano_cm >= 10
ORDER BY tamano_cm DESC;

SELECT
    nombre_cliente,
    estilo,
    precio,
    estado
FROM tatuajes
WHERE estilo = 'realismo'
ORDER BY precio DESC;