# Solución Ejercicio 017 (Avanzado) - Stored Procedures Tienda de Ropa

## Descripción
Solución del ejercicio avanzado centrado en la creación y ejecución de **Procedimientos Almacenados** (`sp_insertar_producto`, `sp_actualizar_stock`, `sp_filtrar_productos`) para la gestión automatizada del catálogo de una tienda de ropa.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear las tablas y procedimientos almacenados.
2. Ejecuta `dml/inserts.sql` para ejecutar los `CALL` que insertan y modifican los datos.
3. Ejecuta `dql/consultas.sql` para probar la ejecución de los procedimientos y consultar los reportes.

---

## Evidencia de Resultados (Validación)

### Ejecución 1: `CALL sp_filtrar_productos(1, 23.00)`
Filtra únicamente las camisetas (categoría 1) con precio menor o igual a $23.00:

| id | producto                | categoria | talla | precio | stock |
|----|-------------------------|-----------|-------|--------|-------|
| 2  | Camiseta Basic Blanca   | Camisetas | M     | 18.00  | 20    |
| 3  | Camiseta Estampada Rock | Camisetas | S     | 22.00  | 15    |

### Ejecución 3: Valor de inventario por categoría
Muestra la consolidación de prendas y cálculo de valor total en bodega:

| categoria  | total_prendas | unidades_totales | valor_inventario |
|------------|---------------|------------------|------------------|
| Camisetas  | 3             | 50               | 1065.00          |
| Pantalones | 3             | 30               | 1130.00          |
| Chaquetas  | 2             | 14               | 760.00           |

### Ejecución 5: Prendas con stock bajo (< 8 unidades)
Identifica las prendas con bajo inventario para reabastecimiento:

| producto              | categoria | stock |
|-----------------------|-----------|-------|
| Chaqueta de Mezclilla | Chaquetas | 4     |