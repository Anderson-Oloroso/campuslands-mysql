# Ejercicio 055 - COUNT y SUM para Laboratorio de Fórmulas Químicas

Solución de nivel básico retador enfocada en el dominio profesional de las funciones de agregación **`COUNT`** y **`SUM`** en MySQL, combinadas con agrupamientos (`GROUP BY`) y filtros de post-agregación (`HAVING`) para la gestión de inventario y valoración económica en un laboratorio químico, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `formulas_quimicas`, implementando restricciones de integridad y tipos de datos decimales para asegurar la precisión en los cálculos de masa y valor monetario.
- `dml/inserts.sql`: Carga de 8 compuestos químicos con atributos críticos (cantidad, pureza, costo, estado) para permitir pruebas exhaustivas de las funciones de agregación.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que extraen valor de negocio, calculando conteos, stocks totales, valores monetarios de inventario y métricas de stock crítico por categoría.

## Tabla Resumen de Datos (`formulas_quimicas`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `codigo_formula` | VARCHAR(20) | NOT NULL, UNIQUE | SKU único de la fórmula química |
| `nombre_compuesto` | VARCHAR(100) | NOT NULL | Nombre científico o comercial del compuesto |
| `categoria_quimica` | ENUM | reactivo / solvente / catalizador / base / acido | Clasificación de laboratorio |
| `cantidad_stock_gramos`| DECIMAL(10,2)| CHECK (>= 0.0), NOT NULL | Masa disponible en stock (gramos) |
| `pureza_porcentaje` | DECIMAL(5,2) | CHECK (0.0 - 100.0), NOT NULL | Grado de pureza del compuesto (%) |
| `costo_por_gramo_usd`| DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo unitario por gramo en USD |
| `estado_almacen` | ENUM | disponible / agotado / en_cuarentena / obsoleto | Estatus logístico de almacenamiento |

## Ejecución
1. Ejecutar el archivo `schema.sql` para definir la estructura de la base de datos.
2. Ejecutar el archivo `inserts.sql` para poblar el inventario inicial de laboratorio.
3. Ejecutar el archivo `consultas.sql` para visualizar los reportes analíticos basados en `COUNT` y `SUM`.

## Decisiones Técnicas
- **Precisión Analítica**: Se utilizaron funciones `ROUND` para presentar resultados monetarios limpios y profesionales, además de cálculos implícitos (stock * costo) dentro de la función `SUM` para determinar el valor total del inventario de forma dinámica.
- **Validación de Integridad**: Uso de restricciones `CHECK` para garantizar que no existan stocks negativos ni purezas fuera del rango lógico (0-100%), asegurando la calidad de los datos para los cálculos de agregación.