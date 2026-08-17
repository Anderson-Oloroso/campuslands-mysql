# Resolucion - Ejercicio 051 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele ilustradores, obras y herramientas de un estudio de dibujo
digital aplicando la Primera Forma Normal (1FN). El diseño que la
violaria (comentado en `ddl/schema.sql`, no se crea) guardaria las
herramientas de cada obra en una sola columna de texto separada por
comas, por ejemplo `'Krita, Photoshop, Blender'`. Eso no es un valor
atomico y complica filtrar, contar o unir por herramienta.

La solucion crea `materiales_obra_intermedio`, con una fila por cada
combinacion `(obra, herramienta)`. Cada valor queda atomico y se puede
consultar directamente con `WHERE`, `JOIN` o `GROUP BY`.

## Decisiones tecnicas
- `UNIQUE (id_obra, herramienta)` evita registrar la misma herramienta
  dos veces para la misma obra.
- La consulta 6 usa `GROUP_CONCAT` para armar, solo para mostrarlo, una
  vista "aplanada" tipo `'Illustrator, Photoshop'`; el dato en disco
  sigue siendo atomico y normalizado, la lista se arma al vuelo.
- Tres tablas (`ilustradores_intermedio`, `obras_intermedio`,
  `materiales_obra_intermedio`) en vez de una sola, siguiendo la
  relacion 1 ilustrador -> N obras -> N herramientas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Obras que usan una herramienta especifica.
2. Cantidad de herramientas distintas por obra.
3. Herramienta mas usada en todas las obras.
4. Obras de un ilustrador con sus herramientas.
5. Ilustradores con mas de 2 herramientas distintas en sus obras.
6. Vista aplanada por obra con `GROUP_CONCAT`.
