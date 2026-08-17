# Resolucion - Ejercicio 033 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele las ventas de un mercado de skins en `ventas_skins_intermedio`
y escribi seis consultas centradas en `GROUP BY`: totales por arma,
por rareza (con `HAVING`), por mes, la skin mas vendida, gasto por
comprador y compradores recurrentes (con `HAVING`).

## Decisiones tecnicas
- La consulta 2 usa `HAVING SUM(precio) > 50` para filtrar rarezas ya
  agregadas, distinto de `WHERE` que filtraria filas individuales
  antes de agrupar.
- Laura Gomez y Carlos Ruiz compran mas de una vez a proposito, para
  que la consulta de `HAVING COUNT(*) > 1` tenga resultados reales.
- `CHECK (precio > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Total vendido e ingresos por arma.
2. Ingresos por rareza superiores a 50 (`HAVING`).
3. Ventas por mes.
4. Skin mas vendida por cantidad de transacciones.
5. Total gastado por comprador.
6. Compradores con mas de una compra (`HAVING`).
