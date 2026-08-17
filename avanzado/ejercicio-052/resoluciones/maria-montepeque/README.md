# Resolucion - Ejercicio 052 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele producciones y entregas de un estudio de animacion 3D
(`producciones_avanzado`, `entregas_avanzado`) y cree tres vistas en
`ddl/schema.sql`:

1. **`vw_producciones_activas_avanzado`**: vista simple y actualizable
   (una sola tabla, sin agregacion) con `WITH CHECK OPTION`. Cualquier
   `UPDATE`/`INSERT` hecho a traves de ella debe seguir cumpliendo
   `estado = 'activa'` despues del cambio.
2. **`vw_resumen_producciones_avanzado`**: vista de reporte con `JOIN`
   + agregacion (total de entregas, entregas exitosas, minutos y costo
   por produccion). Solo de lectura, por la agregacion.
3. **`vw_entregas_fallidas_avanzado`**: vista anidada, construida sobre
   `vw_producciones_activas_avanzado` (no directamente sobre la
   tabla), para listar entregas fallidas solo de producciones que
   siguen activas.

## Prueba de WITH CHECK OPTION
`dml/inserts.sql` hace un `UPDATE` a traves de
`vw_producciones_activas_avanzado` que cambia el presupuesto sin tocar
el estado: eso se permite. Ademas verifique manualmente el caso que
`WITH CHECK OPTION` debe bloquear:

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
  -e "USE campuslands_mysql; UPDATE vw_producciones_activas_avanzado SET estado = 'entregada' WHERE id_produccion = 1;"
```

Resultado real obtenido:
```
ERROR 1369 (HY000): CHECK OPTION failed 'campuslands_mysql.vw_producciones_activas_avanzado'
```

Confirme tambien que el estado de la produccion no cambio despues del
intento. Este comando no se ejecuta dentro de `dml/inserts.sql` para no
interrumpir el script; queda documentado como prueba manual en
`dql/consultas.sql`.

## Decisiones tecnicas
- `vw_producciones_activas_avanzado` es intencionalmente simple (sin
  `JOIN` ni agregacion) porque solo una vista asi puede ser
  actualizable en MySQL.
- `vw_entregas_fallidas_avanzado` demuestra que una vista puede
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
1. Vista actualizable: producciones activas.
2. Vista de reporte con agregacion: resumen de entregas por produccion.
3. Vista anidada: entregas fallidas de producciones activas.
4. Filtro sobre la vista de reporte.
5. Filtro sobre la vista actualizable.
6. Conteo de entregas fallidas pendientes por cliente.
