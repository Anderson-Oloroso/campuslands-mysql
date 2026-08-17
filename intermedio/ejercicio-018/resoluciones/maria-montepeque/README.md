# Resolucion - Ejercicio 018 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele las reservas de paquetes turisticos en `reservas_intermedio` y
escribi consultas centradas en `GROUP BY`: totales y promedios por
categoria, por destino, por mes de viaje y por estado de la reserva.

## Decisiones tecnicas
- `MONTH()`/`MONTHNAME()` sobre `fecha_viaje` para agrupar por mes sin
  depender de una columna de mes separada.
- `HAVING` en la consulta 6 para filtrar grupos ya agregados (destinos
  con ingresos confirmados superiores a un umbral), distinto de `WHERE`
  que filtra filas antes de agrupar.
- `CHECK (viajeros > 0)` y `CHECK (precio_total > 0)` como restricciones
  minimas de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Total de reservas y viajeros por categoria.
2. Ingreso total por categoria (solo confirmadas).
3. Cantidad de reservas por mes de viaje.
4. Promedio de viajeros por destino.
5. Cantidad de reservas por estado.
6. Destinos con ingresos confirmados superiores a 1500 (GROUP BY + HAVING).
