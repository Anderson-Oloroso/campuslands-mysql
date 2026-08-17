# Resolucion - Ejercicio 048 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele las reservas de una agencia de viajes en
`reservas_viajes_intermedio` y escribi seis consultas centradas en
`GROUP BY`: totales por destino, por categoria (con `HAVING`), por
mes, el paquete mas reservado, gasto por cliente y clientes
recurrentes (con `HAVING`).

## Decisiones tecnicas
- La consulta 2 usa `HAVING SUM(precio) > 2000000` para filtrar
  categorias ya agregadas, distinto de `WHERE` que filtraria filas
  individuales antes de agrupar.
- Laura Gomez y Carlos Ruiz reservan mas de una vez a proposito, para
  que la consulta de `HAVING COUNT(*) > 1` tenga resultados reales.
- `CHECK (precio > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Total reservado e ingresos por destino.
2. Ingresos por categoria superiores a 2000000 (`HAVING`).
3. Reservas por mes.
4. Paquete mas reservado por cantidad de transacciones.
5. Total gastado por cliente.
6. Clientes con mas de una reserva (`HAVING`).
