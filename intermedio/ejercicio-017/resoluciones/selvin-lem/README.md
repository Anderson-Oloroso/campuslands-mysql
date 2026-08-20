# Resolucion - Ejercicio 017 (Intermedio)

## Tematica
tienda de ropa

## Analisis breve
Se modela una tienda de ropa con clientes_tienda y compras_tienda,
enfocado en practicar LEFT JOIN. Se incluyen a proposito dos
clientes sin compras registradas (Fernanda Ixchel y Bryan Tojin)
como caso limite, para verificar que LEFT JOIN los conserva en el
resultado con valores NULL y que COUNT/SUM con COALESCE los
reportan correctamente en 0.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear clientes_tienda y
   compras_tienda.
2. Ejecutar `dml/inserts.sql` para insertar 6 clientes y 10 compras.
3. Ejecutar `dql/consultas.sql` para correr las consultas con
   LEFT JOIN, incluyendo el caso de clientes sin compras.
