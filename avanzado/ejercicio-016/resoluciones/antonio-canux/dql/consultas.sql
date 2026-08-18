-- Consultas demostrando el control de transacciones (TCL).
USE campuslands_mysql;

-- Transaccion Exitosa (COMMIT): Cobrar el pedido 1 al cliente 1.
START TRANSACTION;
    UPDATE avanzado_ejercicio_016_clientes 
        SET billetera_digital = billetera_digital - 15.50 
        WHERE id = 1;
    UPDATE avanzado_ejercicio_016_pedidos 
        SET estado = 'Pagado' 
        WHERE id = 1;
COMMIT;


-- Transaccion Fallida (ROLLBACK): Intento de cobrar el pedido 2 a Ana (Tiene $10, cuesta $12).
START TRANSACTION;
    UPDATE avanzado_ejercicio_016_pedidos 
        SET estado = 'Pagado' 
        WHERE id = 2;
-- Supongamos que falla la actualizacion de la billetera:
-- UPDATE avanzado_ejercicio_016_clientes SET billetera_digital = billetera_digital - 12.00 WHERE id = 2;
ROLLBACK;


-- Vamos a cancelar el pedido 3, y hacer un intento erroneo de reembolso.
START TRANSACTION;
    UPDATE avanzado_ejercicio_016_pedidos 
        SET estado = 'Cancelado' 
        WHERE id = 3;
SAVEPOINT punto_seguro;
-- Error logico simulado: Se agregan 1000 dolares por accidente
    UPDATE avanzado_ejercicio_016_clientes 
        SET billetera_digital = billetera_digital + 1000.00 
        WHERE id = 3;
-- Deshacemos solo el error, pero mantenemos la cancelacion del pedido
ROLLBACK TO punto_seguro;
COMMIT;


-- Verificacion de Saldos de Clientes
SELECT id, nombre, billetera_digital 
    FROM avanzado_ejercicio_016_clientes 
    ORDER BY id ASC;

-- Verificacion del Estado de los Pedidos
SELECT p.id AS pedido_id, c.nombre AS cliente, p.descripcion_pedido, p.total_pagar, p.estado 
    FROM avanzado_ejercicio_016_pedidos p
    JOIN avanzado_ejercicio_016_clientes c ON p.cliente_id = c.id
    ORDER BY p.id ASC;