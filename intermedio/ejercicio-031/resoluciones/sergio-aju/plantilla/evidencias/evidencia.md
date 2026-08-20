# Ejercicio 031 - INNER JOIN para Torneo Esports MOBA

Solución de nivel intermedio enfocada en la implementación de relaciones normalizadas de uno a muchos y consultas multitabla mediante **INNER JOIN** en MySQL para la gestión de un torneo de esports MOBA, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, la tabla padre `equipos_moba` y la tabla hija `jugadores_moba`, aplicando restricciones de integridad referencial (`FOREIGN KEY`), validaciones numéricas mediante `CHECK` y tipados estrictos.
- `dml/inserts.sql`: Carga inicial estructurada de 4 organizaciones profesionales y 8 jugadores con estadísticas de rendimiento individual (asesinatos, muertes y asistencias).
- `dql/consultas.sql`: Implementación de 5 consultas avanzadas utilizando `INNER JOIN` para relacionar entidades, cálculos de rendimiento analítico (*KDA ratio*), agrupaciones estadísticas y límites de registros (*Top 3*).

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura relacional y las restricciones de integridad.
2. Ejecutar el archivo `inserts.sql` para poblar las tablas con los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para verificar la extracción de reportes relacionales y métricas deportivas.

## Decisiones Técnicas
- **Modelado Relacional Estricto**: Se separaron las entidades de equipos y jugadores para evitar redundancias de datos, aplicando la regla de normalización de clave foránea con integridad referencial (`ON DELETE RESTRICT`).
- **Análisis de Estadísticas**: Uso de funciones aritméticas y condicionales (`NULLIF`) para calcular ratios de rendimiento de los jugadores de forma segura y profesional.