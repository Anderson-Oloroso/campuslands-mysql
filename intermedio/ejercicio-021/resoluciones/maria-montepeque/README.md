# Resolucion - Ejercicio 021 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele artistas, proyectos y herramientas de dibujo digital aplicando
la Primera Forma Normal (1FN). El diseño que la violaria (comentado en
`ddl/schema.sql`, no se crea) guardaria las herramientas de cada
proyecto en una sola columna de texto separada por comas, por ejemplo
`'Photoshop, Procreate, Illustrator'`. Eso no es un valor atomico y
complica filtrar, contar o unir por herramienta.

La solucion crea `herramientas_proyecto_intermedio`, con una fila por
cada combinacion `(proyecto, herramienta)`. Cada valor queda atomico y
se puede consultar directamente con `WHERE`, `JOIN` o `GROUP BY`.

## Decisiones tecnicas
- `UNIQUE (id_proyecto, herramienta)` evita registrar la misma
  herramienta dos veces para el mismo proyecto.
- La consulta 6 usa `GROUP_CONCAT` para armar, solo para mostrarlo, una
  vista "aplanada" tipo `'Illustrator, Photoshop'`; el dato en disco
  sigue siendo atomico y normalizado, la lista se arma al vuelo.
- Tres tablas (`artistas_digital_intermedio`,
  `proyectos_digital_intermedio`,
  `herramientas_proyecto_intermedio`) en vez de una sola, siguiendo la
  relacion 1 artista -> N proyectos -> N herramientas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Proyectos que usan una herramienta especifica.
2. Cantidad de herramientas distintas por proyecto.
3. Herramienta mas usada en todos los proyectos.
4. Proyectos de un artista con sus herramientas.
5. Artistas con mas de 2 herramientas distintas en sus proyectos.
6. Vista aplanada por proyecto con `GROUP_CONCAT`.
