# Resolucion - Ejercicio 024 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele soldadores, clientes y trabajos de un taller de soldadura con
dos `FOREIGN KEY` que se comportan distinto a proposito, para comparar
las opciones de MySQL ante un `DELETE` en la tabla padre:

- `id_soldador` → `ON DELETE SET NULL`: si un soldador se retira, sus
  trabajos historicos se conservan, solo quedan sin soldador asignado.
- `id_cliente` → `ON DELETE RESTRICT`: un cliente con trabajos
  registrados no se puede borrar mientras existan esos trabajos, para
  no perder el historial de facturacion.

## Evidencia real de cada comportamiento
- `dml/inserts.sql` borra a la soldadora "Sofia Herrera" (tiene dos
  trabajos). Las consultas 1 y 6 confirman que esos dos trabajos siguen
  existiendo, solo con `id_soldador` en `NULL`.
- Probe manualmente intentar borrar un cliente con trabajos:
  ```bash
  mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
    -e "USE campuslands_mysql; DELETE FROM clientes_soldadura_intermedio WHERE id_cliente = 1;"
  ```
  Resultado real obtenido:
  ```
  ERROR 1451 (23000): Cannot delete or update a parent row: a foreign
  key constraint fails (...CONSTRAINT `fk_trabajos_intermedio_cliente`...)
  ```
  Este comando no se incluyo en `dml/inserts.sql` porque esta pensado
  para fallar; queda documentado como prueba manual en
  `dql/consultas.sql`.

## Decisiones tecnicas
- `id_soldador` es `NULL`-able justamente porque puede quedar sin
  asignar tras un `SET NULL`; `id_cliente` es `NOT NULL` porque todo
  trabajo debe tener un cliente.
- `CHECK (costo > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Trabajos sin soldador asignado (evidencia de `SET NULL`).
2. Listado de trabajos con soldador (o "Sin asignar") y cliente.
3. Ingresos totales por cliente.
4. Soldadores activos y su cantidad de trabajos.
5. Confirmar que Sofia Herrera ya no existe.
6. Confirmar que sus trabajos se conservaron.
