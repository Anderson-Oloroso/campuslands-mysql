# Resolucion - Ejercicio 020 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele clientes y citas de un estudio de tatuajes
(`clientes_intermedio`, `citas_intermedio`) y escribi seis consultas
centradas en subconsultas: escalar, correlacionada, `EXISTS`,
`NOT EXISTS` y subconsulta en el `FROM` (tabla derivada).

## Decisiones tecnicas
- Las tablas se llaman `clientes_estudio_intermedio` y
  `citas_estudio_intermedio` (con el sufijo `_estudio`) para no chocar
  con `clientes_intermedio` del ejercicio-016, que vive en la misma
  base de datos compartida `campuslands_mysql`.
- Dejé a `Maria Lopez` sin ninguna cita a proposito, para que
  `NOT EXISTS` tenga un resultado real que mostrar.
- Uso subconsultas correlacionadas (consultas 2 y 6) para comparar cada
  fila contra un agregado calculado solo con las filas de su mismo
  grupo (mismo estilo), algo que `GROUP BY` solo no puede expresar tan
  directamente por fila.
- `CHECK (precio > 0)` como restriccion minima de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Citas con precio mayor al promedio general (subconsulta escalar).
2. Citas mas caras que el promedio de su propio estilo (correlacionada).
3. Clientes con al menos una cita realizada (`EXISTS`).
4. Clientes que nunca han agendado ninguna cita (`NOT EXISTS`).
5. Tatuador con mayor ingreso en citas realizadas (subconsulta en el `FROM`).
6. Cita mas cara registrada por cada estilo (correlacionada con `MAX`).
