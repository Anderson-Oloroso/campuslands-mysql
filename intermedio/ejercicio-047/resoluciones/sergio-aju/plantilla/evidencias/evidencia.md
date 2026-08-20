# Solución Ejercicio 047 (Intermedio Retador) - Tienda de Ropa (LEFT JOIN)

## Descripción
Solución centrada en la aplicación práctica de la cláusula `LEFT JOIN` sobre la base de datos de una tienda de ropa comercial, permitiendo identificar productos sin movimiento, clientes sin compras registradas e indicadores completos sin omisión de datos vacíos.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para definir la estructura de las 5 tablas.
2. Ejecuta `dml/inserts.sql` para poblar el catálogo de ropa, clientes y ventas.
3. Ejecuta `dql/consultas.sql` para obtener los análisis de auditoría de inventario y clientes.

---

## Evidencia de Resultados

### Consulta 2: Prendas que NUNCA se han vendido
| prenda_id | prenda                         | categoria           | precio | stock |
|-----------|--------------------------------|---------------------|--------|-------|
| 4         | Pantalón Jogger Urbano         | Pantalones y Jeans  | 195.00 | 12    |
| 7         | Chumpa Rompevientos Reflectiva | Chumpas y Chaquetas | 260.00 | 10    |

### Consulta 4: Clientes que no han realizado compras
| cliente_id | cliente       | email                  | fecha_registro |
|------------|---------------|------------------------|----------------|
| 5          | Kenia Rosales | kenia.rosales@email.com| 2026-05-20     |