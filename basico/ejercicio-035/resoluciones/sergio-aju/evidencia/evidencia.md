# Ejercicio 035 - SELECT para Taller Mecánico de Motos

Solución de nivel básico enfocada en la correcta aplicación de sentencias **SELECT**, proyecciones, filtros y reportes agrupados en MySQL para la gestión del inventario y órdenes de servicio de un taller mecánico de motocicletas, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa y definición estructurada de la tabla `taller_mecanico_motos` aplicando restricciones de unicidad (`UNIQUE`) para los códigos de orden, validaciones lógicas mediante `CHECK` para costos positivos, y tipos de datos estrictos.
- `dml/inserts.sql`: Carga inicial de 8 registros detallados de órdenes de servicio con variaciones de propietario, marca, modelo, tipo de servicio, costo y estado de reparación.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que incluyen reportes ordenados por costo, filtros por estatus operativo, agrupaciones estadísticas por marca y estado, y selección del *Top 3* de servicios más costosos.

## Tabla Resumen de Datos (`taller_mecanico_motos`)
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
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las consultas de negocio y reportes operativos.

## Decisiones Técnicas
- **Estructuración de Consultas**: Empleo de consultas con proyecciones claras y alias descriptivos para facilitar la lectura de reportes financieros y operativos por parte de cualquier desarrollador.
- **Control de Integridad Financiera**: Uso de restricciones `CHECK` para garantizar que los costos de los servicios no admitan valores negativos, asegurando la consistencia de los datos analíticos.