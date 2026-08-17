# Resolucion - Ejercicio 048 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele cupos de paquetes turisticos que una agencia compra a un
operador mayorista y revende a sus clientes
(`reventas_paquetes_avanzado`) y escribi consultas centradas en
funciones SQL de MySQL:

- **Texto**: `UPPER`, `CONCAT`, `LPAD` (codigo de transaccion) y
  `SUBSTRING_INDEX` (dominio del correo).
- **Fecha**: `DATEDIFF` para calcular dias en inventario antes de
  vender el cupo.
- **Numericas**: `ROUND` para ganancia y margen porcentual.
- **Agregacion + fecha combinadas**: `AVG(DATEDIFF(...))`.
- **Condicional**: `CASE` para clasificar cada transaccion como
  ganancia, perdida o sin cambio.

## Decisiones tecnicas
- `CHECK (fecha_venta >= fecha_compra)`: restriccion entre columnas
  (MySQL 8.0.16+) para evitar transacciones con fechas invertidas.
- Los datos mezclan a proposito transacciones con ganancia y con
  perdida, para que la consulta de `CASE` tenga resultados variados.
- `CHECK (precio_compra > 0 AND precio_venta > 0)` como restriccion
  minima de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Nombre en mayusculas y codigo de transaccion generado.
2. Dias en inventario de cada cupo antes de venderlo.
3. Ganancia y margen porcentual por transaccion.
4. Promedio de dias en inventario.
5. Dominio de correo mas frecuente entre clientes.
6. Clasificacion de cada transaccion (ganancia/perdida) con `CASE`.
