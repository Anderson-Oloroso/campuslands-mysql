# Resolucion - Ejercicio 035 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele clientes y citas de un taller mecanico de motos
(`clientes_taller_avanzado`, `citas_taller_avanzado`) y cree tres
indices en `ddl/schema.sql`:

1. **`uq_citas_taller_avanzado_mecanico_horario`** (UNIQUE, sobre
   `mecanico, fecha_cita, hora_cita`): ademas de acelerar las
   consultas por mecanico y fecha, impone una regla de negocio real:
   un mismo mecanico no puede tener dos citas a la misma fecha y hora.
2. **`idx_citas_taller_avanzado_tipo_costo`** (sobre
   `tipo_servicio, costo`): pensado para reportes que filtran por tipo
   de servicio y ordenan por costo.
3. **`idx_citas_taller_avanzado_fecha`** (sobre `fecha_cita`): pensado
   para reportes por rango de fechas sin filtrar por mecanico.

`dql/consultas.sql` incluye dos `EXPLAIN` que confirman que MySQL usa
estos indices al resolver las consultas.

## Verificacion real del indice unico
Probe en vivo el caso que el indice unico debe bloquear:
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 -e \
  "USE campuslands_mysql; INSERT INTO citas_taller_avanzado (id_cliente, mecanico, tipo_servicio, costo, fecha_cita, hora_cita) VALUES (4, 'Pedro Ariza', 'cambio_aceite', 40.00, '2026-01-10', '10:00:00');"
```
Resultado real obtenido:
```
ERROR 1062 (23000): Duplicate entry 'Pedro Ariza-2026-01-10-10:00:00'
for key 'citas_taller_avanzado.uq_citas_taller_avanzado_mecanico_horario'
```
Pedro Ariza ya tenia una cita exactamente a esa fecha y hora (consulta
1 de `dql/consultas.sql`); el indice evito la doble reserva antes de
que el dato invalido llegara a guardarse.

## Decisiones tecnicas
- Se agrego `hora_cita TIME` a la tabla de citas especificamente para
  que el indice unico tenga sentido (varias citas de un mecanico el
  mismo dia son validas, dos a la misma hora no).
- `CHECK (costo > 0)` como restriccion minima de negocio.
- El intento de doble reserva no se incluyo en `dml/inserts.sql`
  porque esta pensado para fallar; queda documentado como prueba
  manual en `dql/consultas.sql`.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. `EXPLAIN` de una busqueda por mecanico y fecha.
2. `EXPLAIN` de una busqueda por tipo de servicio ordenada por costo.
3. Citas de un mecanico especifico, ordenadas por fecha y hora.
4. Citas de un tipo de servicio, de mas cara a mas barata.
5. Ingresos totales por mecanico (solo citas realizadas).
6. Citas registradas en un rango de fechas.
