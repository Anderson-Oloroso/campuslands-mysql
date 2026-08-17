# Resolucion - Ejercicio 037 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele partidos y goles de una liga de futbol
(`partidos_avanzado`, `goles_avanzado`) y cree tres vistas en
`ddl/schema.sql`:

1. **`vw_partidos_jugados_avanzado`**: vista simple y actualizable (una
   sola tabla, sin agregacion) con `WITH CHECK OPTION`. Cualquier
   `UPDATE`/`INSERT` hecho a traves de ella debe seguir cumpliendo
   `estado = 'jugado'` despues del cambio.
2. **`vw_resumen_partidos_avanzado`**: vista de reporte con `JOIN` +
   agregacion (total de goles, goles de penal y autogoles por
   partido). Solo de lectura, por la agregacion.
3. **`vw_goles_penal_jugados_avanzado`**: vista anidada, construida
   sobre `vw_partidos_jugados_avanzado` (no directamente sobre la
   tabla), para listar goles de penal solo de partidos que ya se
   jugaron.

## Prueba de WITH CHECK OPTION
`dml/inserts.sql` hace un `UPDATE` a traves de
`vw_partidos_jugados_avanzado` que cambia el estadio sin tocar el
estado: eso se permite. Ademas verifique manualmente el caso que
`WITH CHECK OPTION` debe bloquear:

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
  -e "USE campuslands_mysql; UPDATE vw_partidos_jugados_avanzado SET estado = 'suspendido' WHERE id_partido = 1;"
```

Resultado real obtenido:
```
ERROR 1369 (HY000): CHECK OPTION failed 'campuslands_mysql.vw_partidos_jugados_avanzado'
```

Confirme tambien que el estado del partido no cambio despues del
intento. Este comando no se ejecuta dentro de `dml/inserts.sql` para no
interrumpir el script; queda documentado como prueba manual en
`dql/consultas.sql`.

## Decisiones tecnicas
- `vw_partidos_jugados_avanzado` es intencionalmente simple (sin
  `JOIN` ni agregacion) porque solo una vista asi puede ser
  actualizable en MySQL.
- `vw_goles_penal_jugados_avanzado` demuestra que una vista puede
  construirse sobre otra vista, no solo sobre tablas.
- `CHECK (minuto BETWEEN 1 AND 120)` como restriccion minima de
  negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Vista actualizable: partidos jugados.
2. Vista de reporte con agregacion: resumen de goles por partido.
3. Vista anidada: goles de penal de partidos ya jugados.
4. Filtro sobre la vista de reporte.
5. Filtro sobre la vista actualizable.
6. Conteo de goles de penal por equipo.
