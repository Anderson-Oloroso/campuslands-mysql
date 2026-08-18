# Evidencias - Ejercicio 029

## Evidencias

1. Creación correcta de las tablas y del evento.
2. Inserción de los 10 productos.
3. Productos con stock disponible y productos sin stock.
4. Configuración del Event Scheduler.
5. Cambio de estado de productos sin stock.
6. Registros generados en `historial_productos`.
7. Resultados de las consultas de reportes e inventario.

## Validación

La evidencia principal debe demostrar que el Event Scheduler puede identificar productos sin stock y cambiar su estado a `inactivo`, registrando el cambio en el historial.

Después de comprobar la configuración, puedes ejecutar manualmente el mismo flujo para validar el comportamiento:
``` SQl
START TRANSACTION;


INSERT INTO historial_productos (
    id_producto,
    estado_anterior,
    estado_nuevo,
    motivo
)
SELECT
    id_producto,
    estado,
    'inactivo',
    'Prueba manual del comportamiento del Event Scheduler'
FROM productos
WHERE stock = 0
  AND estado = 'activo';


UPDATE productos
SET estado = 'inactivo'
WHERE stock = 0
  AND estado = 'activo';


COMMIT;
```

Luego:

``` SQl
SELECT
    id_producto,
    nombre,
    stock,
    estado
FROM productos
WHERE stock = 0;

Y:

SELECT
    h.id_historial,
    p.nombre AS producto,
    h.estado_anterior,
    h.estado_nuevo,
    h.motivo,
    h.fecha_cambio
FROM historial_productos AS h
INNER JOIN productos AS p
    ON p.id_producto = h.id_producto
ORDER BY h.fecha_cambio DESC;
```