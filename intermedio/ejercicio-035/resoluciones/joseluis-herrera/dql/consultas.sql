USE campuslands_mysql;

SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo
FROM servicios_taller
WHERE costo > (
    SELECT AVG(costo)
    FROM servicios_taller
)
ORDER BY costo DESC;

SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo,
    estado
FROM servicios_taller
WHERE costo = (
    SELECT MAX(costo)
    FROM servicios_taller
);

SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo
FROM servicios_taller
WHERE costo > (
    SELECT AVG(costo)
    FROM servicios_taller
    WHERE marca = 'Honda'
)
ORDER BY costo DESC;

SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo
FROM servicios_taller
WHERE costo > ALL (
    SELECT costo
    FROM servicios_taller
    WHERE tipo_servicio = 'cambio de aceite'
)
ORDER BY costo DESC;

SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo,
    estado
FROM servicios_taller
WHERE estado = 'finalizado'
  AND costo > (
      SELECT AVG(costo)
      FROM servicios_taller
      WHERE estado = 'finalizado'
  )
ORDER BY costo DESC;


SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo
FROM servicios_taller
WHERE costo IN (
    SELECT costo
    FROM servicios_taller
    WHERE tipo_servicio = 'frenos'
)
ORDER BY costo DESC;