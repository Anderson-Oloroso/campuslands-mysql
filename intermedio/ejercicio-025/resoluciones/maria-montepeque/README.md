# Resolucion - Ejercicio 025 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele formulas quimicas y sus lotes de produccion con dos tipos de
`UNIQUE`:

- **`UNIQUE` simple** en `formulas_quimicas_intermedio`
  (`codigo_formula`, `nombre_compuesto`): no puede haber dos formulas
  con el mismo codigo ni dos compuestos con el mismo nombre.
- **`UNIQUE` compuesta** en `lotes_formula_intermedio`
  (`id_formula, numero_lote`): el mismo numero de lote puede repetirse
  entre formulas distintas, pero nunca dos veces para la misma
  formula.

## Evidencia real
El numero de lote `'L-001'` se usa a proposito en las 5 formulas
(consulta 2), demostrando que la restriccion compuesta no bloquea la
repeticion entre formulas distintas. Ademas verifique manualmente los
dos casos que SI deben fallar:

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 -e \
  "USE campuslands_mysql; INSERT INTO formulas_quimicas_intermedio (codigo_formula, nombre_compuesto, categoria, estado_fisico) VALUES ('H2SO4', 'Otro nombre', 'acido', 'liquido');"
# -> ERROR 1062 (23000): Duplicate entry 'H2SO4' for key 'formulas_quimicas_intermedio.codigo_formula'

mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 -e \
  "USE campuslands_mysql; INSERT INTO lotes_formula_intermedio (id_formula, numero_lote, cantidad_producida, fecha_produccion) VALUES (1, 'L-001', 10.00, '2026-03-01');"
# -> ERROR 1062 (23000): Duplicate entry '1-L-001' for key 'lotes_formula_intermedio.uq_lotes_formula_intermedio_lote'
```

Ninguno de los dos se ejecuta dentro de `dml/inserts.sql` porque estan
pensados para fallar; quedan documentados como prueba manual en
`dql/consultas.sql`.

## Decisiones tecnicas
- `CHECK (cantidad_producida > 0)` como restriccion minima.
- La llave compuesta `UNIQUE (id_formula, numero_lote)` es distinta de
  la `PRIMARY KEY (id_lote)`: la PK identifica la fila, la UNIQUE
  compuesta protege la regla de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado de formulas con su codigo unico.
2. Evidencia de `'L-001'` repetido entre formulas distintas.
3. Cantidad total producida por formula.
4. Formulas por categoria.
5. Lotes producidos por cada formula.
6. Formula con mayor produccion acumulada.
