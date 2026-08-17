# Resolucion - Ejercicio 054 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele tecnicos, empresas y ordenes de un taller de soldadura con dos
`FOREIGN KEY` que se comportan distinto a proposito, para comparar las
opciones de MySQL ante un `DELETE` en la tabla padre:

- `id_tecnico` → `ON DELETE SET NULL`: si un tecnico se retira, sus
  ordenes historicas se conservan, solo quedan sin tecnico asignado.
- `id_empresa` → `ON DELETE RESTRICT`: una empresa con ordenes
  registradas no se puede borrar mientras existan esas ordenes, para
  no perder el historial de facturacion.

## Evidencia real de cada comportamiento
- `dml/inserts.sql` borra a la tecnica "Marcela Suarez" (tiene dos
  ordenes). Las consultas 1 y 6 confirman que esas dos ordenes siguen
  existiendo, solo con `id_tecnico` en `NULL`.
- Probe manualmente intentar borrar una empresa con ordenes:
  ```bash
  mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
    -e "USE campuslands_mysql; DELETE FROM empresas_soldadura_intermedio WHERE id_empresa = 1;"
  ```
  Resultado real obtenido:
  ```
  ERROR 1451 (23000): Cannot delete or update a parent row: a foreign
  key constraint fails (...CONSTRAINT `fk_ordenes_intermedio_empresa`...)
  ```
  Este comando no se incluyo en `dml/inserts.sql` porque esta pensado
  para fallar; queda documentado como prueba manual en
  `dql/consultas.sql`.

## Decisiones tecnicas
- `id_tecnico` es `NULL`-able justamente porque puede quedar sin
  asignar tras un `SET NULL`; `id_empresa` es `NOT NULL` porque toda
  orden debe tener una empresa.
- `CHECK (costo > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Ordenes sin tecnico asignado (evidencia de `SET NULL`).
2. Listado de ordenes con tecnico (o "Sin asignar") y empresa.
3. Ingresos totales por empresa.
4. Tecnicos activos y su cantidad de ordenes.
5. Confirmar que Marcela Suarez ya no existe.
6. Confirmar que sus ordenes se conservaron.
