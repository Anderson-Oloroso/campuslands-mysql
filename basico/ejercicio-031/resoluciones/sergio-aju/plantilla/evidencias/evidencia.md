# Ejercicio 031 - CREATE TABLE para Torneo Esports MOBA

Solución de nivel básico enfocada en la correcta aplicación de la sentencia **CREATE TABLE** en MySQL para el diseño y estructuración de un sistema de gestión para un torneo de esports MOBA, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas previas y definición estructurada de la tabla `equipos_moba` con tipos de datos adecuados, restricciones de unicidad (`UNIQUE`), valores por defecto y validaciones lógicas mediante restricciones `CHECK` para asegurar la integridad de los puntajes y estadísticas de los equipos.
- `dml/inserts.sql`: Carga inicial estructurada de 8 equipos profesionales de diferentes regiones competitivas con casos variados de puntajes y estados deportivos.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que incluyen tablas de clasificación, filtros por estado, agregaciones por región, reportes estadísticos globales y límites de registros (*Top 3*).

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura relacional.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla con los registros iniciales del torneo.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de los reportes y indicadores del torneo.

## Decisiones Técnicas
- **Diseño de Entidad Enfocado**: Se estructuraron atributos clave para el seguimiento deportivo (partidos jugados, ganados, perdidos y puntos de liga) facilitando cálculos analíticos directos.
- **Restricciones de Integridad (CHECK)**: Se aplicaron validaciones numéricas para prevenir valores negativos en contadores de partidos y puntajes, manteniendo un estándar profesional de desarrollo de bases de datos.