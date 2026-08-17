# Resolucion - Ejercicio 040 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele carreras urbanas y sus dorsales asignados con dos tipos de
`UNIQUE`:

- **`UNIQUE` simple** en `carreras_intermedio` (`codigo_carrera`,
  `nombre_carrera`): no puede haber dos carreras con el mismo codigo
  ni dos con el mismo nombre.
- **`UNIQUE` compuesta** en `dorsales_carrera_intermedio`
  (`id_carrera, numero_dorsal`): el mismo numero de dorsal puede
  repetirse entre carreras distintas, pero nunca dos veces dentro de
  la misma carrera.

## Evidencia real
El numero de dorsal `'101'` se usa a proposito en las 5 carreras
(consulta 2), demostrando que la restriccion compuesta no bloquea la
repeticion entre carreras distintas. Ademas verifique manualmente los
dos casos que SI deben fallar:

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 -e \
  "USE campuslands_mysql; INSERT INTO carreras_intermedio (codigo_carrera, nombre_carrera, distancia_km, ciudad, fecha_carrera) VALUES ('BOG-10K', 'Otro nombre', 10.00, 'Bogota', '2026-04-01');"
# -> ERROR 1062 (23000): Duplicate entry 'BOG-10K' for key 'carreras_intermedio.codigo_carrera'

mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 -e \
  "USE campuslands_mysql; INSERT INTO dorsales_carrera_intermedio (id_carrera, numero_dorsal, corredor, tiempo_minutos) VALUES (1, '101', 'Otro Corredor', 50.00);"
# -> ERROR 1062 (23000): Duplicate entry '1-101' for key 'dorsales_carrera_intermedio.uq_dorsales_carrera_intermedio'
```

Ninguno de los dos se ejecuta dentro de `dml/inserts.sql` porque estan
pensados para fallar; quedan documentados como prueba manual en
`dql/consultas.sql`.

## Decisiones tecnicas
- `CHECK (tiempo_minutos > 0)` como restriccion minima.
- La llave compuesta `UNIQUE (id_carrera, numero_dorsal)` es distinta
  de la `PRIMARY KEY (id_dorsal)`: la PK identifica la fila, la UNIQUE
  compuesta protege la regla de negocio.
- "Carrera Urbana Bogota 10K" tiene tres corredores inscritos (las
  demas tienen dos), para que la consulta 6 (`ORDER BY ... LIMIT 1`)
  tenga un ganador unico y no un empate.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado de carreras con su codigo unico.
2. Evidencia de `'101'` repetido entre carreras distintas.
3. Cantidad de corredores inscritos por carrera.
4. Carreras agrupadas por ciudad.
5. Tiempos registrados por carrera, ordenados por fecha.
6. Carrera con mayor cantidad de corredores inscritos.
