# Resolucion - Ejercicio 020 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele clientes y citas de un estudio de tatuajes
(`clientes_avanzado`, `citas_avanzado`) y cree tres indices en
`ddl/schema.sql`:

1. **`uq_citas_avanzado_tatuador_horario`** (UNIQUE, sobre
   `tatuador, fecha_cita, hora_cita`): ademas de acelerar las consultas
   por tatuador y fecha, impone una regla de negocio real: un mismo
   tatuador no puede tener dos citas a la misma fecha y hora.
2. **`idx_citas_avanzado_estilo_precio`** (sobre `estilo, precio`):
   pensado para reportes que filtran por estilo y ordenan por precio.
3. **`idx_citas_avanzado_fecha`** (sobre `fecha_cita`): pensado para
   reportes por rango de fechas sin filtrar por tatuador.

`dql/consultas.sql` incluye dos `EXPLAIN` para mostrar que MySQL puede
usar estos indices al resolver las consultas.

## Decisiones tecnicas
- Se agrego `hora_cita TIME` a la tabla de citas especificamente para
  que el indice unico tenga sentido (varias citas de un tatuador el
  mismo dia son validas, dos a la misma hora no).
- `CHECK (precio > 0)` como restriccion minima de negocio.
- La prueba de doble reserva (que deberia fallar por el indice unico)
  se documenta como comando manual en `dql/consultas.sql`, sin
  ejecutarla dentro del script para no interrumpirlo.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. `EXPLAIN` de una busqueda por tatuador y fecha.
2. `EXPLAIN` de una busqueda por estilo ordenada por precio.
3. Citas de un tatuador especifico, ordenadas por fecha y hora.
4. Citas de un estilo, ordenadas de mas cara a mas barata.
5. Ingresos totales por tatuador (solo citas realizadas).
6. Citas registradas en un rango de fechas.
