# Resolucion - Ejercicio 023 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele clientes y proyectos de un estudio de arquitectura 3D aplicando
la Tercera Forma Normal (3FN). El diseño que la violaria (comentado en
`ddl/schema.sql`, no se crea) guardaria `cliente_nombre` y
`cliente_ciudad` directamente en la tabla de proyectos: esos atributos
no dependen de `id_proyecto` (la llave primaria), sino de `id_cliente`,
que a su vez es un atributo de la tabla de proyectos. Esa cadena
`id_proyecto -> id_cliente -> cliente_ciudad` es la dependencia
transitiva que prohibe la 3FN.

La solucion separa `clientes_arquitectura_intermedio` de
`proyectos_arquitectura_intermedio`: cada atributo del cliente vive una
sola vez, y los proyectos solo guardan la referencia (`id_cliente`).

## Beneficio demostrado con datos reales
`dml/inserts.sql` cambia la ciudad de "Inversiones Vista Verde" con un
solo `UPDATE` sobre la tabla de clientes. La consulta 6 confirma que
sus tres proyectos muestran la ciudad nueva (`Palmira`) automaticamente
al hacer `JOIN`, sin haber tocado la tabla de proyectos. Con el diseño
que viola 3FN, ese mismo cambio habria requerido actualizar la ciudad
repetida en cada fila de proyecto del cliente, con riesgo real de dejar
alguna desactualizada.

## Decisiones tecnicas
- `CHECK (presupuesto > 0)` como restriccion minima.
- Tres clientes con mas de un proyecto (`Constructora Andina`,
  `Grupo Residencial Norte`, `Fundacion Cultural Rio`) para que la
  consulta de `HAVING COUNT(*) > 1` tenga resultados reales.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Proyectos con nombre y ciudad del cliente (`JOIN`).
2. Presupuesto total por cliente.
3. Clientes con mas de un proyecto (`HAVING`).
4. Proyectos de clientes en Bogota.
5. Cliente con mayor presupuesto acumulado.
6. Proyectos de "Inversiones Vista Verde" con la ciudad ya actualizada.
