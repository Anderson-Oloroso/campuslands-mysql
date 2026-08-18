USE campuslands_mysql;

SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_tatuador,
    estilo,
    tamano_cm,
    precio,
    fecha_cita,
    estado
FROM tatuajes
ORDER BY fecha_cita ASC;

SELECT
    nombre_cliente AS cliente,
    estilo,
    nombre_tatuador AS tatuador
FROM tatuajes
ORDER BY cliente ASC;

SELECT
    nombre_cliente AS cliente,
    estilo,
    tamano_cm AS tamano,
    precio
FROM tatuajes
WHERE precio > 800
ORDER BY precio DESC;

SELECT
    nombre_cliente AS cliente,
    nombre_tatuador AS tatuador,
    estilo,
    fecha_cita
FROM tatuajes
WHERE estado = 'Completada'
ORDER BY fecha_cita ASC;


SELECT
    nombre_cliente AS cliente,
    estilo,
    tamano_cm AS tamano,
    precio
FROM tatuajes
WHERE tamano_cm >= 15
ORDER BY tamano DESC;

SELECT
    nombre_cliente AS cliente,
    estilo,
    tamano_cm AS tamano,
    precio,
    estado
FROM tatuajes
WHERE nombre_tatuador = 'Diego Vargas'
ORDER BY fecha_cita ASC;

SELECT
    nombre_cliente AS cliente,
    nombre_tatuador AS tatuador,
    estilo,
    precio,
    fecha_cita
FROM tatuajes
WHERE estado = 'Programada'
ORDER BY fecha_cita ASC;