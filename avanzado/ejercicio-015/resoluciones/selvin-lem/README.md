# Resolucion - Ejercicio 015 Avanzado - Selvin Lem

## Tematica
Biblioteca gamer

## Analisis breve
Se practica carga de datos en dos pasos: una carga masiva inicial
de 15 registros en coleccion_juegos, y una carga derivada mediante
INSERT ... SELECT que agrega y resume (COUNT, SUM) los juegos
completados por plataforma en resumen_completados_gamer. Un juego
sin horas jugadas (0.0) sirve como caso limite para verificar que
no se cuente como completado si no cumple la condicion.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear coleccion_juegos y
   resumen_completados_gamer.
2. Ejecutar `dml/inserts.sql` para insertar 15 registros y cargar
   el resumen derivado con INSERT ... SELECT.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas.
