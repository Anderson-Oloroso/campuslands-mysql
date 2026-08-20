# Ejercicio 029 - Event Scheduler para Marketplace de Accesorios

Solución de nivel avanzado enfocada en la automatización de procesos mediante el uso del **Event Scheduler (Programador de Eventos)** en MySQL para la gestión de estados temporales en un marketplace de accesorios, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, activación global del programador de eventos, definición de la tabla transaccional `pedidos_marketplace_avanzado` con campos `DATETIME` y restricciones de integridad, y la creación de un evento programado (`evt_expirar_pedidos_pendientes`) que cambia automáticamente a 'caducado' los pedidos pendientes con más de 48 horas de antigüedad.
- `dml/inserts.sql`: Carga inicial de 8 registros con marcas de tiempo variadas, incluyendo casos límite con más de 48 horas de antigüedad para comprobar la ejecución del evento automático.
- `dql/consultas.sql`: Implementación de 5 consultas avanzadas para verificar estados de pedidos caducados, conteos operativos por estado, reportes de ingresos por categoría y la comprobación del estatus del `event_scheduler` en el servidor.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura relacional, restricciones y registrar el evento programado en el servidor.
2. Ejecutar el archivo `inserts.sql` para poblar la base de datos con los registros de prueba temporales.
3. Ejecutar el archivo `consultas.sql` para validar los reportes analíticos y la aplicación de los estados gestionados por el evento.

## Decisiones Técnicas
- **Automatización de Procesos (Event Scheduler)**: Se implementó un evento programado con ejecución periódica (`EVERY 1 HOUR`) para simular tareas de backend y mantenimiento de base de datos (como la expiración de carritos o pedidos sin procesar).
- **Control Cronológico**: Uso de tipos `DATETIME` y funciones temporales avanzadas (`DATE_SUB`, `NOW()`) para calcular con precisión la antigüedad de los registros transaccionales.