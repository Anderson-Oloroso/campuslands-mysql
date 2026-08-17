# Resolucion - Ejercicio 050 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele clientes y citas de un estudio de tatuajes
(`clientes_estudio_intermedio`, `citas_estudio_intermedio`) y escribi
seis consultas centradas en subconsultas: escalar, correlacionada,
`EXISTS`, `NOT EXISTS` y subconsulta en el `FROM` (tabla derivada).

## Decisiones tecnicas
- Dejé a "Maria Lopez" sin ninguna cita a proposito, para que
  `NOT EXISTS` tenga un resultado real que mostrar.
- Uso subconsultas correlacionadas (consultas 2 y 6) para comparar
  cada fila contra un agregado calculado solo con las filas de su
  mismo estilo.
- `CHECK (costo > 0)` como restriccion minima de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Citas con costo mayor al promedio general (subconsulta escalar).
2. Citas mas caras que el promedio de su propio estilo.
3. Clientes con al menos una cita realizada (`EXISTS`).
4. Clientes que nunca han agendado ninguna cita (`NOT EXISTS`).
5. Tatuador con mayor ingreso en citas realizadas (subconsulta en el `FROM`).
6. Cita mas cara registrada por cada estilo.
