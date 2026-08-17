# Resolucion - Ejercicio 022 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele proyectos y renders de un estudio de animacion 3D
(`proyectos_avanzado`, `renders_avanzado`) y cree tres vistas en
`ddl/schema.sql`:

1. **`vw_proyectos_en_progreso_avanzado`**: vista simple y actualizable
   (una sola tabla, sin agregacion) con `WITH CHECK OPTION`. Cualquier
   `UPDATE`/`INSERT` hecho a traves de ella debe seguir cumpliendo
   `estado = 'en_progreso'` despues del cambio.
2. **`vw_resumen_proyectos_avanzado`**: vista de reporte con `JOIN` +
   agregacion (total de renders, renders exitosos, minutos y costo por
   proyecto). Solo de lectura, por la agregacion.
3. **`vw_renders_pendientes_avanzado`**: vista anidada, construida
   sobre `vw_proyectos_en_progreso_avanzado` (no directamente sobre la
   tabla), para listar renders fallidos solo de proyectos que siguen
   en progreso.

## Prueba de WITH CHECK OPTION
`dml/inserts.sql` hace un `UPDATE` a traves de
`vw_proyectos_en_progreso_avanzado` que cambia el presupuesto sin tocar
el estado: eso se permite. Ademas verifique manualmente el caso que
`WITH CHECK OPTION` debe bloquear:

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
  -e "USE campuslands_mysql; UPDATE vw_proyectos_en_progreso_avanzado SET estado = 'entregado' WHERE id_proyecto = 1;"
```

Resultado real obtenido:
```
ERROR 1369 (HY000): CHECK OPTION failed 'campuslands_mysql.vw_proyectos_en_progreso_avanzado'
```

Confirme tambien que el estado del proyecto no cambio despues del
intento. Este comando no se ejecuta dentro de `dml/inserts.sql` para no
interrumpir el script; queda documentado como prueba manual en
`dql/consultas.sql`.

## Decisiones tecnicas
- `vw_proyectos_en_progreso_avanzado` es intencionalmente simple (sin
  `JOIN` ni agregacion) porque solo una vista asi puede ser
  actualizable en MySQL.
- `vw_renders_pendientes_avanzado` demuestra que una vista puede
  construirse sobre otra vista, no solo sobre tablas.
- `CHECK (presupuesto > 0)` y `CHECK (costo_computo > 0)` como
  restricciones minimas de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Vista actualizable: proyectos en progreso.
2. Vista de reporte con agregacion: resumen de renders por proyecto.
3. Vista anidada: renders fallidos de proyectos en progreso.
4. Filtro sobre la vista de reporte.
5. Filtro sobre la vista actualizable.
6. Conteo de renders fallidos pendientes por cliente.
