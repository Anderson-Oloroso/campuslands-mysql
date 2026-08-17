# Resolucion - Ejercicio 039 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele entrenadores, alumnos y clases de un gimnasio de kickboxing con
dos `FOREIGN KEY` que se comportan distinto a proposito, para comparar
las opciones de MySQL ante un `DELETE` en la tabla padre:

- `id_entrenador` → `ON DELETE SET NULL`: si un entrenador se retira,
  sus clases historicas se conservan, solo quedan sin entrenador
  asignado.
- `id_alumno` → `ON DELETE RESTRICT`: un alumno con clases registradas
  no se puede borrar mientras existan esas clases, para no perder el
  historial de facturacion.

## Evidencia real de cada comportamiento
- `dml/inserts.sql` borra al entrenador "Sofia Herrera" (tiene dos
  clases). Las consultas 1 y 6 confirman que esas dos clases siguen
  existiendo, solo con `id_entrenador` en `NULL`.
- Probe manualmente intentar borrar un alumno con clases:
  ```bash
  mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
    -e "USE campuslands_mysql; DELETE FROM alumnos_kickboxing_intermedio WHERE id_alumno = 1;"
  ```
  Resultado real obtenido:
  ```
  ERROR 1451 (23000): Cannot delete or update a parent row: a foreign
  key constraint fails (...CONSTRAINT `fk_clases_intermedio_alumno`...)
  ```
  Este comando no se incluyo en `dml/inserts.sql` porque esta pensado
  para fallar; queda documentado como prueba manual en
  `dql/consultas.sql`.

## Decisiones tecnicas
- `id_entrenador` es `NULL`-able justamente porque puede quedar sin
  asignar tras un `SET NULL`; `id_alumno` es `NOT NULL` porque toda
  clase debe tener un alumno.
- `CHECK (costo > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Clases sin entrenador asignado (evidencia de `SET NULL`).
2. Listado de clases con entrenador (o "Sin asignar") y alumno.
3. Ingresos totales por alumno.
4. Entrenadores activos y su cantidad de clases.
5. Confirmar que Sofia Herrera ya no existe.
6. Confirmar que sus clases se conservaron.
