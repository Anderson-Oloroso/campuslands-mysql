# Ejercicio 046 - CREATE TABLE para Restaurante de Comida Urbana

Solución de nivel básico retador enfocada en el diseño estructurado de tablas mediante la sentencia **`CREATE TABLE`**, aplicación de restricciones de integridad (`CONSTRAINT CHECK`, `UNIQUE`) y consultas analíticas en MySQL para la gestión del menú de un restaurante de comida urbana, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas anteriores y definición rigurosa de la tabla `menu_comida_urbana` aplicando tipos de datos estrictos, códigos únicos y validaciones financieras/lógicas con `CHECK`.
- `dml/inserts.sql`: Carga inicial de 8 registros de productos urbanos variados en precios, categorías, tiempos de preparación y estados de disponibilidad.
- `dql/consultas.sql`: Implementación de 5 consultas operativas y analíticas que incorporan filtros lógicos, funciones de agregación (`COUNT`, `AVG`, `ROUND`), agrupamientos (`GROUP BY`), ordenamientos y límites (`LIMIT`).

## Tabla Resumen de Datos (`menu_comida_urbana`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `codigo_producto` | VARCHAR(20) | NOT NULL, UNIQUE | SKU o código de referencia único del plato |
| `nombre_producto` | VARCHAR(100) | NOT NULL | Nombre comercial del alimento o bebida |
| `categoria` | VARCHAR(50) | NOT NULL | Clasificación del producto (Hamburguesas, Tacos, etc.) |
| `precio` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo monetario del producto |
| `calificacion_promedio`| DECIMAL(3,1) | CHECK (0.0 - 5.0), NOT NULL | Puntuación o rating de calidad otorgado por clientes |
| `tiempo_preparacion_min`| INT | CHECK (> 0), NOT NULL | Duración estimada de elaboración en minutos |
| `estado_disponibilidad`| ENUM | disponible / agotado / en_preparacion / descontinuado | Estatus operativo actual del producto en el menú |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura tabular.
2. Ejecutar el archivo `inserts.sql` para poblar el menú con los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para comprobar los reportes analíticos y filtros de negocio.

## Decisiones Técnicas
- **Precisión Monetaria**: Uso de `DECIMAL(10,2)` para los precios con el fin de evitar errores de redondeo asociados a tipos de datos flotantes.
- **Validación Estricta**: Incorporación de restricciones `CHECK` para garantizar que los precios no sean negativos, las calificaciones se mantengan en el rango de 0 a 5, y los tiempos de preparación sean mayores a cero.