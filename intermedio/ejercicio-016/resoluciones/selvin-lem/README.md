# Resolucion - Ejercicio 016 (Intermedio)

## Tematica
restaurante de comida urbana

## Analisis breve
Se modela un restaurante de comida urbana con clientes_restaurante y
pedidos_restaurante relacionadas por cliente_id, enfocado en
practicar INNER JOIN. Se listan pedidos junto al nombre del cliente,
se calcula el total gastado por cliente y se filtra con HAVING sobre
el total agregado. Se deja como nota conceptual que INNER JOIN
excluye clientes sin pedidos, contraste que se explora en el
ejercicio 017 con LEFT JOIN.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear clientes_restaurante y
   pedidos_restaurante.
2. Ejecutar `dml/inserts.sql` para insertar 5 clientes y 10 pedidos.
3. Ejecutar `dql/consultas.sql` para correr las consultas con
   INNER JOIN, agregaciones y HAVING.
