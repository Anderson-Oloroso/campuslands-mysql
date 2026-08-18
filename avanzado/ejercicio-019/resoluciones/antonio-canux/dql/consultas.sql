USE campuslands_mysql;

SELECT id, paracaidista, modalidad, estado 
    FROM avanzado_ejercicio_019_saltos
    ORDER BY id ASC;

SELECT salto_id, accion, detalle_cambio, usuario, DATE_FORMAT(fecha_registro, '%Y-%m-%d %H:%i:%s') AS fecha 
    FROM avanzado_ejercicio_019_auditoria
    ORDER BY id ASC;

-- 3. Demostracion del Trigger BEFORE UPDATE (Regla de negocio)
-- Si intentamos ejecutar esta actualizacion, el Trigger la bloqueara arrojando el error definido:
/*
UPDATE avanzado_ejercicio_019_saltos SET estado = 'Programado' WHERE id = 1;
-- ERROR 1644 (45000): Error: No se puede retroceder un salto Completado o Cancelado a Programado.
*/