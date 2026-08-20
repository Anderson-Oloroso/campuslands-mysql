# Ejercicio 034 - Triggers para Garaje de Motos

Solución de nivel avanzado enfocada en el diseño, implementación y prueba de **Triggers (Desencadenadores)** en MySQL para automatizar tareas de auditoría, trazabilidad de cambios operativos y control de modificaciones en un sistema de inventario de un garaje de motocicletas, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de rutinas y tablas anteriores, definición de la tabla principal `garaje_motos_triggers`, creación de la tabla transaccional `auditoria_garaje_motos`, y programación de dos triggers: `tr_auditar_actualizacion_moto` (captura cambios de precio o estado mediante `AFTER UPDATE`) y `tr_auditar_eliminacion_moto` (respalda datos de la moto antes de ser borrada mediante `BEFORE DELETE`).
- `dml/inserts.sql`: Carga inicial estructurada de 8 registros de motocicletas con especificaciones variadas.
- `dql/consultas.sql`: Sentencias de prueba (`UPDATE`, `DELETE`) para disparar automáticamente los triggers, combinadas con consultas analíticas y reportes detallados sobre la bitácora de auditoría.

## Tablas Resumen de Datos

### Tabla Principal: `garaje_motos_triggers`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `placa` | VARCHAR(10) | NOT NULL, UNIQUE | Placa o matrícula oficial única de la moto |
| `marca` | VARCHAR(50) | NOT NULL | Fabricante de la motocicleta |
| `modelo` | VARCHAR(60) | NOT NULL | Línea o referencia comercial del modelo |
| `cilindrada_cc` | INT UNSIGNED | CHECK (> 0), NOT NULL | Cilindrada del motor en centímetros cúbicos |
| `anio_fabricacion`| INT UNSIGNED | CHECK (1950 - 2026), NOT NULL | Año de fabricación del vehículo |
| `precio_comercial`| DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Valor estimado de mercado de la moto |
| `estado_motos` | ENUM | disponible / en_mantenimiento / alquilada / reservada | Estatus operativo actual en el garaje |

### Tabla de Auditoría: `auditoria_garaje_motos`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del evento de auditoría |
| `moto_id` | INT | NULL | Identificador de la motocicleta afectada |
| `placa` | VARCHAR(10) | NULL | Matrícula de la moto relacionada con el evento |
| `accion` | VARCHAR(20) | NOT NULL | Tipo de operación ejecutada (`UPDATE` o `DELETE`) |
| `detalles_cambio` | TEXT | NOT NULL | Descripción detallada de los valores previos y nuevos |
| `usuario_bd` | VARCHAR(100) | NOT NULL | Usuario de base de datos que ejecutó la acción |
| `fecha_evento` | DATETIME | NOT NULL | Marca de tiempo exacta del desencadenamiento |

## Ejecución
1. Ejecutar el archivo `schema.sql` para compilar los triggers y configurar la estructura relacional.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla principal con los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para simular operaciones de negocio (`UPDATE` / `DELETE`) y verificar el registro automático en la bitácora de auditoría.

## Decisiones Técnicas
- **Automatización de Auditoría**: Uso de triggers `AFTER UPDATE` y `BEFORE DELETE` para garantizar que cualquier modificación o eliminación crítica quede registrada de manera infalible sin depender de la lógica de la aplicación externa.
- **Trazabilidad Contextual**: Incorporación de funciones nativas como `USER()` y `NOW()` dentro de los disparadores para documentar quién realizó el cambio y en qué momento exacto ocurrió.