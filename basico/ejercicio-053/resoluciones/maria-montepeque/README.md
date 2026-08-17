# Resolucion - Ejercicio 053 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `maquetas_basico` para un estudio de arquitectura 3D y
practique cuatro formas distintas de `UPDATE`: por `PRIMARY KEY`, por
condicion sobre varias filas, con una expresion aritmetica y con
`CASE` para una actualizacion en cascada.

## Decisiones tecnicas
- `actualizado_en DATETIME ... ON UPDATE CURRENT_TIMESTAMP` para que
  la fecha de modificacion se actualice sola con cada `UPDATE`, sin
  tener que escribirla a mano.
- El `UPDATE` con `CASE` (UPDATE 4) avanza cada proyecto de Revit un
  paso en su flujo (`boceto -> modelado -> renderizado`) segun su
  estado actual, en una sola sentencia.
- `CHECK (precio > 0)` como restriccion minima de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Estado final de todas las maquetas tras los cuatro `UPDATE`.
2. Maquetas entregadas.
3. Precio de los proyectos comerciales ya con el incremento del 8%.
4. Proyectos en Revit y su fase actual.
5. Cantidad de maquetas por estado.
6. Maquetas residenciales (ninguna debe quedar en boceto).
