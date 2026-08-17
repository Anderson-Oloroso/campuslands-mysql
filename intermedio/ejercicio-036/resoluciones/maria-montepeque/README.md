# Resolucion - Ejercicio 036 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele autos hiperdeportivos y sus caracteristicas aplicando la
Primera Forma Normal (1FN). El diseño que la violaria (comentado en
`ddl/schema.sql`, no se crea) guardaria las caracteristicas de cada
auto en una sola columna de texto separada por comas, por ejemplo
`'Fibra de carbono, Suspension activa, Alerón trasero'`. Eso no es un
valor atomico y complica filtrar, contar o unir por caracteristica.

La solucion crea `caracteristicas_auto_intermedio`, con una fila por
cada combinacion `(auto, caracteristica)`. Cada valor queda atomico y
se puede consultar directamente con `WHERE`, `JOIN` o `GROUP BY`.

## Decisiones tecnicas
- `UNIQUE (id_auto, caracteristica)` evita registrar la misma
  caracteristica dos veces para el mismo auto.
- La consulta 6 usa `GROUP_CONCAT` para armar, solo para mostrarlo, una
  vista "aplanada" tipo `'Fibra de carbono, Suspension activa'`; el
  dato en disco sigue siendo atomico y normalizado, la lista se arma
  al vuelo.
- Dos tablas (`autos_intermedio`, `caracteristicas_auto_intermedio`)
  siguiendo la relacion 1 auto -> N caracteristicas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Autos que tienen una caracteristica especifica.
2. Cantidad de caracteristicas por auto.
3. Caracteristica mas comun entre los autos.
4. Caracteristicas de un auto especifico.
5. Autos con mas de 2 caracteristicas registradas (`HAVING`).
6. Vista aplanada por auto con `GROUP_CONCAT`.
