# Resolucion - Ejercicio 019 (Basico) - Selvin Lem

## Tematica
Paracaidismo

## Analisis breve
Se modela el registro de saltos en saltos_paracaidismo, con foco en
practicar INSERT con datos realistas (incluyendo paracaidistas
repetidos en distintas fechas). Los instructores se registran con
costo_salto en 0 como caso limite, por lo que el CHECK se definio
como costo_salto >= 0 en vez de > 0.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear saltos_paracaidismo.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas con
   filtros, AVG, SUM y ordenamientos.
