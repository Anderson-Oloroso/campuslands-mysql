# Resolucion - Ejercicio 022 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele proyectos, animadores y asignaciones de un estudio de animacion
3D aplicando la Segunda Forma Normal (2FN). El diseño que la violaria
(comentado en `ddl/schema.sql`, no se crea) tendria una tabla con llave
compuesta `(id_proyecto, id_animador)` guardando tambien
`proyecto_nombre` y `animador_nombre`: esos dos atributos dependen solo
de una parte de la llave (dependencia parcial), no de la combinacion
completa.

La solucion separa `proyectos_3d_intermedio` y `animadores_intermedio`
(cada nombre vive una sola vez), y deja en `asignaciones_intermedio`
solo lo que de verdad depende de la llave completa: `rol_en_proyecto` y
`horas_asignadas` (el mismo animador puede tener un rol y una carga de
horas distinta en cada proyecto).

## Decisiones tecnicas
- `Sofia Herrera` aparece en dos proyectos con rol y horas distintas
  (consulta 5), para demostrar en datos reales por que esos atributos
  no podrian vivir en `animadores_intermedio`.
- Llave primaria compuesta `(id_proyecto, id_animador)` en
  `asignaciones_intermedio`, con sus dos `FOREIGN KEY`.
- `CHECK (horas_asignadas > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Asignaciones con nombre de proyecto y animador (`JOIN`).
2. Horas totales trabajadas por cada animador.
3. Animadores asignados a un proyecto especifico.
4. Proyectos con mas de 150 horas totales asignadas (`HAVING`).
5. Roles de un mismo animador en distintos proyectos.
6. Asignacion individual con mas horas registradas.
