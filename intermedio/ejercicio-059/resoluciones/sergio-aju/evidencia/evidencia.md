# Solución Ejercicio 059 (Intermedio Retador) - Marketplace de Accesorios (Vistas Simples)

## Descripción
Esta solución demuestra el uso de **Vistas SQL (`CREATE VIEW`)** para simplificar la consulta de datos complejos, aislar la lógica de negocio y presentar información relevante para el catálogo y finanzas de un **Marketplace de Accesorios**.

### Vistas Creadas:
1. **`vw_catalogo_activos`**: Expone únicamente los productos disponibles de tiendas activas.
2. **`vw_inventario_critico`**: Clasifica el stock bajo (≤ 5 unidades) con etiquetas de diagnóstico.
3. **`vw_resumen_pedidos`**: Consolida datos del pedido y del cliente comprador.
4. **`vw_ventas_por_vendedor`**: Calcula las ventas totales y la comisión ganada por el marketplace por cada tienda.

## Instrucciones de Ejecución
1. Ejecutar `ddl/schema.sql` para construir tablas y crear las vistas.
2. Ejecutar `dml/inserts.sql` para ingresar el catálogo y pedidos.
3. Ejecutar `dql/consultas.sql` para consultar las vistas creadas.

---

## Evidencia de Resultados

### Consulta 2: Alerta de Inventario Crítico (`vw_inventario_critico`)
| sku         | nombre_producto                       | nombre_tienda            | stock_disponible | diagnostico_stock   |
|-------------|---------------------------------------|--------------------------|------------------|---------------------|
| ACC-BAG-005 | Mochila Urbana Impermeable Chic       | Chic & Style Boutique    | 0                | Agotado             |
| ACC-BAG-003 | Maletín para Laptop Exec-Black        | BlackElegance Leather Co.| 2                | Reabastecer Urgente |
| ACC-LBT-002 | Cinturón Elegante Vestir Reversible   | BlackElegance Leather Co.| 3                | Reabastecer Urgente |
| ACC-WTC-007 | Reloj Minimalista Rose Gold           | Urban Watches GT         | 4                | Reabastecer Urgente |

### Consulta 3: Reporte de Ventas por Tienda (`vw_ventas_por_vendedor`)
| nombre_tienda            | comision_porcentaje | total_pedidos_atendidos | total_ventas_brutas | ganancia_marketplace_comision |
|--------------------------|---------------------|-------------------------|---------------------|-------------------------------|
| Urban Watches GT         | 10.00               | 1                       | 1200.00             | 120.00                        |
| BlackElegance Leather Co.| 8.00                | 1                       | 1000.00             | 80.00                         |
| Chic & Style Boutique    | 6.50                | 1                       | 320.00              | 20.80                         |