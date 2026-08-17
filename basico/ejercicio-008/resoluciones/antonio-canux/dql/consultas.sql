-- Operaciones de modificacion aplicando la instruccion UPDATE.
USE campuslands_mysql;

UPDATE basico_ejercicio_008 
    SET estado = 'activo' 
    WHERE nombre = 'Carlos Diaz';
SELECT nombre, estado 
    FROM basico_ejercicio_008 
    WHERE nombre = 'Carlos Diaz';

UPDATE basico_ejercicio_008 
    SET salario = salario * 1.10 
    WHERE posicion = 'ala';
SELECT nombre, posicion, salario 
    FROM basico_ejercicio_008 
    WHERE posicion = 'ala';

UPDATE basico_ejercicio_008 
    SET tarjetas_amarillas = tarjetas_amarillas + 1, estado = 'suspendido' 
    WHERE nombre = 'Jose Silva';
SELECT nombre, tarjetas_amarillas, estado 
    FROM basico_ejercicio_008 
    WHERE nombre = 'Jose Silva';

UPDATE basico_ejercicio_008 
    SET salario = salario + 300 
    WHERE posicion = 'pivot' AND goles > 20;
SELECT nombre, posicion, goles, salario 
    FROM basico_ejercicio_008 
    WHERE posicion = 'pivot';

UPDATE basico_ejercicio_008 
    SET tarjetas_amarillas = 0, estado = 'activo' 
    WHERE estado = 'suspendido';
SELECT nombre, tarjetas_amarillas, estado 
    FROM basico_ejercicio_008;