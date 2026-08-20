# Ejercicio 026 - CTE para Videojuego RPG

Solución de nivel avanzado enfocada en la implementación de **Expresiones de Tabla Comunes (CTE)** y consultas analíticas complejas en MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `personajes_rpg_avanzado` equipada con restricciones `CHECK` estrictas para garantizar la integridad de los atributos del RPG.
- `dml/inserts.sql`: Carga inicial de 8 registros normalizados con datos técnicos coherentes del contexto del videojuego.
- `dql/consultas.sql`: Implementación de 5 consultas avanzadas utilizando **CTE** (`WITH`), funciones de ventana (`ROW_NUMBER() OVER`) y subconsultas estructuradas para reportes analíticos de negocio.

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura de la base de datos y sus restricciones.
2. Ejecutar el archivo `inserts.sql` para poblar los registros de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar la ejecución de las CTEs y los reportes analíticos.

## Evidencia de Resultados (Tabla de Registros Base)

| id | nombre_personaje | clase | nivel | experiencia | puntos_vida | estado | creado_en |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | Thorin Ironfoot | Guerrero | 25 | 12500.50 | 450 | activo | 2026-08-18 13:00:00 |
| 2 | Elrond Vandal | Mago | 30 | 18400.00 | 320 | activo | 2026-08-18 13:00:00 |
| 3 | Legolas Greenleaf | Arquero | 22 | 9800.75 | 400 | activo | 2026-08-18 13:00:00 |
| 4 | Aelin Fireheart | Asesino | 15 | 4300.25 | 280 | inactivo | 2026-08-18 13:00:00 |
| 5 | Lucius Vance | Clerigo | 18 | 6700.00 | 500 | activo | 2026-08-18 13:00:00 |
| 6 | Grom Hellscream | Guerrero | 28 | 15200.00 | 600 | inactivo | 2026-08-18 13:00:00 |
| 7 | Lyra Starwhisper | Mago | 12 | 2100.50 | 250 | activo | 2026-08-18 13:00:00 |
| 8 | Kahn Shadowblade | Asesino | 5 | 450.00 | 150 | baneado | 2026-08-18 13:00:00 |

## Decisiones Técnicas
- **Modularidad con CTE**: Uso extensivo de cláusulas `WITH` para aislar lógica temporal y cálculos analíticos (como promedios globales y particionamiento de datos), mejorando significativamente la legibilidad y el mantenimiento de las consultas complejas.
- **Integridad y Precisión**: Aplicación de tipos `DECIMAL(10,2)` para la experiencia y restricciones `CHECK` para proteger los rangos de nivel y puntos de vida.