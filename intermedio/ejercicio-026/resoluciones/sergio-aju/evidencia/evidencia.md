# Ejercicio 026 - CHECK para Videojuego RPG

Solución de nivel intermedio enfocada en la implementación avanzada de restricciones `CHECK` en MySQL para garantizar la integridad de rangos lógicos, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `personajes_rpg_intermedio` con múltiples restricciones `CHECK` para validar rangos de nivel (1 a 100), experiencia no negativa y puntos de vida válidos (1 a 1000).
- `dml/inserts.sql`: Inserción inicial de 8 registros normalizados con datos técnicos coherentes del contexto de un RPG.
- `dql/consultas.sql`: Consultas analíticas orientadas al negocio con funciones de agregación (`COUNT`, `AVG`), filtros por estados, ordenamientos y límites.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura de la base de datos y las restricciones `CHECK`.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar los reportes analíticos del sistema RPG.

## Evidencia de Resultados (Tabla de Registros)

A continuación se muestra una vista previa del estado de la tabla tras la inserción y validación de los datos:

| id | nombre_personaje | clase | nivel | experiencia | puntos_vida | estado | creado_en |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | Thorin Ironfoot | Guerrero | 25 | 12500.50 | 450 | activo | 2026-08-18 12:30:00 |
| 2 | Elrond Vandal | Mago | 30 | 18400.00 | 320 | activo | 2026-08-18 12:30:00 |
| 3 | Legolas Greenleaf | Arquero | 22 | 9800.75 | 400 | activo | 2026-08-18 12:30:00 |
| 4 | Aelin Fireheart | Asesino | 15 | 4300.25 | 280 | inactivo | 2026-08-18 12:30:00 |
| 5 | Lucius Vance | Clerigo | 18 | 6700.00 | 500 | activo | 2026-08-18 12:30:00 |
| 6 | Grom Hellscream | Guerrero | 28 | 15200.00 | 600 | inactivo | 2026-08-18 12:30:00 |
| 7 | Lyra Starwhisper | Mago | 12 | 2100.50 | 250 | activo | 2026-08-18 12:30:00 |
| 8 | Kahn Shadowblade | Asesino | 5 | 450.00 | 150 | baneado | 2026-08-18 12:30:00 |

## Decisiones Técnicas
- **Restricciones CHECK**: Se aplicaron reglas de validación en columnas críticas (`nivel`, `experiencia`, `puntos_vida`) para prevenir anomalías e inconsistencias directamente a nivel de motor de base de datos.
- **Tipificación Precisa**: Uso de `DECIMAL(10,2)` para los puntos de experiencia y `ENUM` para clasificar clases y estados de forma controlada.