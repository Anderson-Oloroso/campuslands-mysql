# Resolucion - Ejercicio 019 (Intermedio)

## Tematica
paracaidismo

## Analisis breve
Se modela un registro de saltos de paracaidismo en
saltos_paracaidismo, enfocado en practicar HAVING para filtrar
resultados ya agrupados: instructores con mas de 3 saltos, altura
promedio superior a 3700 metros, clientes que saltaron con mas de un
instructor (usando COUNT DISTINCT) y duracion acumulada de caida por
instructor. El caso limite verifica que HAVING filtra sobre el
resultado agregado y no sobre filas individuales, a diferencia de
WHERE.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear saltos_paracaidismo.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las consultas con
   GROUP BY y HAVING.
