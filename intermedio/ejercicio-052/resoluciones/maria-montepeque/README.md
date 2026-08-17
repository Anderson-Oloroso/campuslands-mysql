# Resolucion - Ejercicio 052 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele producciones, artistas y participaciones de un estudio de
animacion 3D aplicando la Segunda Forma Normal (2FN). El diseño que la
violaria (comentado en `ddl/schema.sql`, no se crea) tendria una tabla
con llave compuesta `(id_produccion, id_artista)` guardando tambien
`produccion_nombre` y `artista_nombre`: esos dos atributos dependen
solo de una parte de la llave (dependencia parcial), no de la
combinacion completa.

La solucion separa `producciones_3d_intermedio` y
`artistas_3d_intermedio` (cada nombre vive una sola vez), y deja en
`participaciones_intermedio` solo lo que de verdad depende de la llave
completa: `rol_en_produccion` y `horas_asignadas` (el mismo artista
puede tener un rol y una carga de horas distinta en cada produccion).

## Decisiones tecnicas
- `Camila Ortiz` aparece en dos producciones con rol y horas
  distintas (consulta 5), para demostrar en datos reales por que esos
  atributos no podrian vivir en `artistas_3d_intermedio`.
- Llave primaria compuesta `(id_produccion, id_artista)` en
  `participaciones_intermedio`, con sus dos `FOREIGN KEY`.
- `CHECK (horas_asignadas > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Participaciones con nombre de produccion y artista (`JOIN`).
2. Horas totales trabajadas por cada artista.
3. Artistas asignados a una produccion especifica.
4. Producciones con mas de 150 horas totales asignadas (`HAVING`).
5. Roles de un mismo artista en distintas producciones.
6. Participacion individual con mas horas registradas.
