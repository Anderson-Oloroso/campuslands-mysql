-- Operaciones de eliminacion controlada aplicando la instruccion DELETE.
USE campuslands_mysql;

DELETE FROM basico_ejercicio_009 
    WHERE peleador = 'Juan Perez';
SELECT peleador, categoria_peso, estado 
    FROM basico_ejercicio_009;

DELETE FROM basico_ejercicio_009 
    WHERE estado = 'retirado';
SELECT peleador, estado 
    FROM basico_ejercicio_009;

DELETE FROM basico_ejercicio_009 
    WHERE derrotas > 5 AND victorias = 0;
SELECT peleador, victorias, derrotas 
    FROM basico_ejercicio_009;

DELETE FROM basico_ejercicio_009 
    WHERE categoria_peso = 'Peso Pesado' AND estado = 'suspendido';
SELECT peleador, categoria_peso, estado 
    FROM basico_ejercicio_009 
    WHERE categoria_peso = 'Peso Pesado';

DELETE FROM basico_ejercicio_009 
    WHERE victorias < 3 AND estado = 'suspendido';
SELECT peleador, victorias, estado 
    FROM basico_ejercicio_009;