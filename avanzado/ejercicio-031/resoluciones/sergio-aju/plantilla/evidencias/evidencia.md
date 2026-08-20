# Ejercicio 031 - Transacciones para Torneo Esports MOBA

Solución de nivel avanzado enfocada en la aplicación de **transacciones ACID (`START TRANSACTION`, `COMMIT`, `ROLLBACK`)** en MySQL para garantizar la consistencia e integridad de operaciones financieras y deportivas complejas en un torneo de esports MOBA, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, la tabla transaccional de equipos con control de presupuestos (`DECIMAL`), puntos y estados, junto con la tabla de historial de traspasos provista de llaves foráneas estrictas y restricciones `CHECK`.
- `dml/inserts.sql`: Carga inicial de 8 organizaciones profesionales de esports con capitales y puntajes detallados para habilitar escenarios de pruebas transaccionales.
- `dql/consultas.sql`: Implementación de un bloque transaccional completo simulando un traspaso de jugadores entre equipos con validación de saldos, complementado con 5 consultas analíticas avanzadas que incluyen múltiples `JOIN`, agregaciones por región y reportes financieros (*Top 3*).

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura relacional y las restricciones de integridad.
2. Ejecutar el archivo `inserts.sql` para poblar la base de datos con los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para validar la ejecución del bloque transaccional ACID y los reportes analíticos resultantes.

## Decisiones Técnicas
- **Consistencia Transaccional (ACID)**: Se estructuró un bloque transaccional explícito para operaciones multi-tabla (descuento de presupuesto, acreditación y registro en historial), garantizando que las modificaciones financieras ocurran de forma atómica.
- **Validación Financiera**: Uso de tipos de datos `DECIMAL(12,2)` y restricciones de control para evitar presupuestos negativos durante la ejecución de los traspasos deportivos.