# Ejercicio 035 - Índices para Taller Mecánico de Motos

Solución de nivel avanzado enfocada en el diseño, implementación y análisis de rendimiento mediante **Índices en MySQL** (simples, compuestos, únicos y evaluación de planes de ejecución con `EXPLAIN`) para optimizar las consultas en un sistema de gestión de taller mecánico de motocicletas, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa, definición estructurada de la tabla principal `taller_mecanico_indices` con restricciones financieras, y creación de índices estratégicos (`idx_codigo_orden_unique`, `idx_marca_moto`, `idx_marca_estado`, `idx_fecha_ingreso`) para acelerar búsquedas y reportes analíticos.
- `dml/inserts.sql`: Carga inicial estructurada de 8 registros de órdenes de servicio en el taller.
- `dql/consultas.sql`: Implementación de sentencias de análisis de rendimiento utilizando `EXPLAIN` para verificar el uso correcto de los índices, combinadas con consultas optimizadas por fecha, rangos y agrupamientos.

## Tabla Resumen de Datos (`taller_mecanico_indices`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `codigo_orden` | VARCHAR(20) | NOT NULL, UNIQUE INDEX | Código de referencia o folio único de la orden |
| `propietario` | VARCHAR(100) | NOT NULL | Nombre del cliente dueño de la motocicleta |
| `marca_moto` | VARCHAR(50) | NOT NULL, INDEX (`idx_marca_moto`) | Fabricante de la motocicleta |
| `modelo_moto` | VARCHAR(60) | NOT NULL | Línea o referencia comercial de la moto |
| `tipo_servicio` | VARCHAR(80) | NOT NULL | Descripción del trabajo o mantenimiento realizado |
| `costo_servicio` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo monetario total del servicio en el taller |
| `fecha_ingreso` | DATE | NOT NULL, INDEX (`idx_fecha_ingreso`) | Fecha en que la moto ingresó al taller |
| `estado_reparacion`| ENUM | pendiente / en_proceso / completado / entregado | Estatus actual del proceso de taller |

*(Nota: Adicionalmente se implementó un índice compuesto `idx_marca_estado (marca_moto, estado_reparacion)`).*

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos, la estructura relacional y los índices.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla con los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para comprobar el rendimiento de las consultas y las evaluaciones con `EXPLAIN`.

## Decisiones Técnicas
- **Estrategia de Indexación**: Se diseñaron índices orientados a los patrones de consulta más frecuentes en un taller (filtrado por marca, búsquedas por rangos de fechas y consultas multi-criterio combinando marca y estado operativo).
- **Validación con EXPLAIN**: Incorporación de sentencias de análisis de planes de ejecución para asegurar que MySQL utilice eficientemente los índices creados en lugar de realizar escaneos completos de tabla (`Full Table Scans`).