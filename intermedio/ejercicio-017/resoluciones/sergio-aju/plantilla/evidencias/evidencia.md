# Solución Ejercicio 017 (Intermedio) - LEFT JOIN Tienda de Ropa

## Descripción
Solución del ejercicio intermedio que utiliza `LEFT JOIN` para incluir categorías sin productos y productos sin categoría asignada en los reportes de la tienda de ropa.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear las tablas `categorias` y `productos`.
2. Ejecuta `dml/inserts.sql` para poblar datos de prueba (incluye casos límite sin relación).
3. Ejecuta `dql/consultas.sql` para visualizar las consultas con `LEFT JOIN`.

# Solución Ejercicio 017 (Intermedio) - LEFT JOIN Tienda de Ropa

## Descripción
Solución del ejercicio intermedio enfocado en el uso de `LEFT JOIN` para conectar la tabla de `categorias` con `productos`. Permite generar reportes que detectan productos huérfanos o categorías sin inventario.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear las tablas.
2. Ejecuta `dml/inserts.sql` para cargar los datos de prueba.
3. Ejecuta `dql/consultas.sql` para ejecutar los reportes.

---

## Evidencia de Resultados (Validación)

### Consulta 2: Conteo de productos por categoría
demuestra cómo `LEFT JOIN` mantiene categorías como *Calzado* y *Accesorios* con valor 0:

| categoria  | total_productos |
|------------|-----------------|
| Camisetas  | 2               |
| Pantalones | 2               |
| Chaquetas  | 2               |
| Calzado    | 0               |
| Accesorios | 0               |

### Consulta 3: Categorías vacías sin productos
Muestra la lista de categorías que requieren asignación de prendas:

| id | categoria_vacia |
|----|-----------------|
| 4  | Calzado         |
| 5  | Accesorios      |

### Consulta 4: Todos los productos y su categoría
Demuestra el manejo de productos sin categoría usando `IFNULL()`:

| producto                | categoria     | precio |
|-------------------------|---------------|--------|
| Camiseta Oversize Negra | Camisetas     | 25.00  |
| Camiseta Basic Blanca   | Camisetas     | 18.00  |
| Jeans Slim Fit          | Pantalones    | 45.00  |
| Pantalon Cargo Verde    | Pantalones    | 40.00  |
| Chaqueta de Mezclilla   | Chaquetas     | 65.00  |
| Hoodie Urbano Negro     | Chaquetas     | 50.00  |
| Cinturon de Cuero       | Sin Categoria | 20.00  |
| Gorra Urbana Negra      | Sin Categoria | 15.00  |