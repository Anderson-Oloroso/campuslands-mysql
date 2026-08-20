# Ejercicio 035 - Subconsultas para Taller Mecánico de Motos

Solución de nivel intermedio enfocada en el diseño, aplicación y dominio de **Subconsultas (Subqueries)** en MySQL (escalares, con operadores de conjunto, tablas derivadas y subconsultas correlacionadas) para la resolución de problemas analíticos en la gestión de un taller mecánico de motocicletas, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa y definición estructurada de la tabla `taller_mecanico_subconsultas` aplicando restricciones de unicidad (`UNIQUE`) para los códigos de orden, validaciones lógicas mediante `CHECK` para asegurar costos positivos, y tipos de datos estrictos.
- `dml/inserts.sql`: Carga inicial de 8 registros de órdenes de servicio diseñados con diversidad de precios, marcas y estados para permitir pruebas efectivas de subconsultas avanzadas.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que explotan diferentes tipos de subconsultas: escalares (`> AVG`), operadores relacionales de conjunto (`IN`), tablas derivadas (`FROM`), correlacionadas (`EXISTS`) y subconsultas en la proyección de columnas (`SELECT`).

## Tabla Resumen de Datos (`taller_mecanico_subconsultas`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `codigo_orden` | VARCHAR(20) | NOT NULL, UNIQUE | Código de referencia o folio único de la orden |
| `propietario` | VARCHAR(100) | NOT NULL | Nombre del cliente dueño de la motocicleta |
| `marca_moto` | VARCHAR(50) | NOT NULL | Fabricante de la motocicleta |
| `modelo_moto` | VARCHAR(60) | NOT NULL | Línea o referencia comercial de la moto |
| `tipo_servicio` | VARCHAR(80) | NOT NULL | Descripción del trabajo o mantenimiento realizado |
| `costo_servicio` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo monetario total del servicio en el taller |
| `fecha_ingreso` | DATE | NOT NULL | Fecha en que la moto ingresó al taller |
| `estado_reparacion`| ENUM | pendiente / en_proceso / completado / entregado | Estatus actual del proceso de taller |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura relacional.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla mediante inserciones limpias y estructuradas.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las subconsultas y reportes analíticos.

## Decisiones Técnicas
- **Versatilidad Analítica**: Se estructuraron diferentes patrones de subconsultas para cubrir escenarios de negocio comunes, desde filtrados comparativos estáticos hasta relaciones cruzadas dinámicas por marca y estado.
- **Optimización y Legibilidad**: Uso de alias claros tanto en las consultas principales como en las tablas derivadas para facilitar la comprensión y mantenimiento del código por parte de otros desarrolladores.