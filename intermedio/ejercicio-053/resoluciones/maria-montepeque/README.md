# Resolucion - Ejercicio 053 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele clientes y encargos de un estudio de arquitectura 3D aplicando
la Tercera Forma Normal (3FN). El diseño que la violaria (comentado en
`ddl/schema.sql`, no se crea) guardaria `cliente_nombre` y
`cliente_ciudad` directamente en la tabla de encargos: esos atributos
no dependen de `id_encargo` (la llave primaria), sino de `id_cliente`,
que a su vez es un atributo de la tabla de encargos. Esa cadena
`id_encargo -> id_cliente -> cliente_ciudad` es la dependencia
transitiva que prohibe la 3FN.

La solucion separa `clientes_arq_intermedio` de
`encargos_arq_intermedio`: cada atributo del cliente vive una sola
vez, y los encargos solo guardan la referencia (`id_cliente`).

## Beneficio demostrado con datos reales
`dml/inserts.sql` cambia la ciudad de "Inversiones Costa Azul" con un
solo `UPDATE` sobre la tabla de clientes. La consulta 6 confirma que su
unico encargo muestra la ciudad nueva (`Palmira`) automaticamente al
hacer `JOIN`, sin haber tocado la tabla de encargos. Con el diseño que
viola 3FN, ese mismo cambio habria requerido actualizar la ciudad
repetida en cada fila de encargo del cliente, con riesgo real de dejar
alguna desactualizada.

## Decisiones tecnicas
- `CHECK (presupuesto > 0)` como restriccion minima.
- Tres clientes con mas de un encargo (`Constructora del Valle`,
  `Grupo Habitat Norte`, `Fundacion Cultural Sur`) para que la
  consulta de `HAVING COUNT(*) > 1` tenga resultados reales.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Encargos con nombre y ciudad del cliente (`JOIN`).
2. Presupuesto total por cliente.
3. Clientes con mas de un encargo (`HAVING`).
4. Encargos de clientes en Bogota.
5. Cliente con mayor presupuesto acumulado.
6. Encargos de "Inversiones Costa Azul" con la ciudad ya actualizada.
