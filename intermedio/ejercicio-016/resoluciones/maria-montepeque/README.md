# Resolucion - Ejercicio 016 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele el flujo de pedidos de un restaurante de comida urbana con tres tablas
relacionadas: `clientes_intermedio`, `platillos_intermedio` y
`pedidos_intermedio`. Las consultas usan INNER JOIN para combinar cliente,
platillo y pedido.

## Decisiones tecnicas
- `pedidos_intermedio` referencia por FK a cliente y a platillo (relacion
  muchos-a-muchos resuelta con una tabla de pedidos individual por linea).
- `CHECK (cantidad > 0)` y `CHECK (precio > 0)` como restricciones de negocio.
- `estado ENUM` en pedidos para practicar filtros (`pendiente`,
  `en_preparacion`, `entregado`, `cancelado`).

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Pedidos con cliente y platillo (INNER JOIN de 3 tablas).
2. Total gastado por cliente (solo pedidos entregados).
3. Platillos mas pedidos por unidades.
4. Pedidos pendientes con datos de contacto.
5. Top 5 clientes por gasto total estimado.
6. Pedidos agrupados por ciudad del cliente.
