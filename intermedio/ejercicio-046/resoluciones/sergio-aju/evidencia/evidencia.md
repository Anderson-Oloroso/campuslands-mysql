# Solución Ejercicio 046 (Intermedio Retador) - Comida Urbana (INNER JOIN)

## Descripción
Solución enfocada en la integración de datos relacionales utilizando `INNER JOIN` sobre cuatro tablas de un restaurante de comida urbana: `categorias`, `platillos`, `pedidos` y `detalle_pedidos`.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para construir las tablas y claves foráneas.
2. Ejecuta `dml/inserts.sql` para cargar las categorías, platillos y ventas realizadas.
3. Ejecuta `dql/consultas.sql` para obtener los reportes relacionales.

---

## Evidencia de Resultados

### Consulta 2: Total consumido por pedido pagado
| pedido_id | cliente_nombre | numero_mesa | total_pagado |
|-----------|----------------|-------------|--------------|
| 1         | Carlos Mendoza | 1           | 241.00       |
| 2         | Valeria Silva  | 4           | 95.00        |

### Consulta 3: Top platillos más vendidos
| platillo                  | categoria           | unidades_vendidas | ingresos_generados |
|---------------------------|---------------------|-------------------|--------------------|
| Tacos de Pulled Pork BBQ  | Tacos Urbanos       | 3                 | 150.00             |
| Smash Double Bacon Cheese | Hamburguesas Smash  | 2                 | 130.00             |
| Papas Bacon & Cheddar Fries| Acompañamientos    | 2                 | 70.00              |
| Cerveza IPA Artesanal     | Bebidas y Malteadas | 2                 | 76.00              |