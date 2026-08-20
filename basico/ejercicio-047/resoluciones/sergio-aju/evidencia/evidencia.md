# Ejercicio 047 - Tipos de Datos para Tienda de Ropa

Solución de nivel básico retador enfocada en el diseño e implementación utilizando una selección rigurosa de **tipos de datos en MySQL** (`DECIMAL`, `VARCHAR`, `INT`, `DATE`, `ENUM`, `BOOLEAN/TINYINT`), restricciones de validación y consultas analíticas para un sistema de gestión de inventario de una tienda de ropa, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas anteriores y definición estructurada de la tabla `inventario_tienda_ropa` utilizando tipos de datos optimizados para textos, valores monetarios precisos, conteos enteros, fechas exactas y atributos lógicos o enumerados.
- `dml/inserts.sql`: Carga inicial de 8 registros diversificados de prendas de vestir para probar restricciones, tipos booleanos, fechas de ingreso y diferentes estados de stock.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que incluyen filtros relacionales, cálculos matemáticos basados en tipos numéricos, funciones de agregación (`SUM`, `AVG`, `COUNT`), condicionales lógicos (`CASE`) y límites (`LIMIT`).

## Tabla Resumen de Datos (`inventario_tienda_ropa`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `codigo_sku` | VARCHAR(20) | NOT NULL, UNIQUE | Código de referencia o SKU único de la prenda |
| `nombre_prenda` | VARCHAR(100) | NOT NULL | Nombre comercial del artículo de ropa |
| `categoria` | VARCHAR(50) | NOT NULL | Clasificación del producto (Camisetas, Pantalones, etc.) |
| `talla` | ENUM | XS / S / M / L / XL / XXL / Unica | Talla de fabricación de la prenda |
| `precio_unitario` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo monetario de venta unitario |
| `stock_disponible` | INT | CHECK (>= 0), Default 0 | Cantidad física de unidades disponibles en almacén |
| `es_impermeable` | BOOLEAN | NOT NULL, Default 0 | Indicador lógico si la prenda repele el agua (0 o 1) |
| `fecha_ingreso` | DATE | NOT NULL | Fecha exacta en que la prenda fue registrada en inventario |
| `estado_prenda` | ENUM | disponible / agotado / en_oferta / descontinuado | Estatus actual comercial de la prenda |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y los tipos de datos estrictos.
2. Ejecutar el archivo `inserts.sql` para poblar el inventario con los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para comprobar los reportes analíticos y cálculos financieros.

## Decisiones Técnicas
- **Precisión Monetaria y Numérica**: Uso de `DECIMAL(10,2)` para los precios unitarios para evitar errores de punto flotante, y de `INT` para el control de existencias (`stock_disponible`).
- **Uso de ENUM y BOOLEAN**: Implementación de enumeraciones para estandarizar tallas y estados comerciales, y un campo booleano (`TINYINT`) para identificar características especiales como la impermeabilidad de manera eficiente.