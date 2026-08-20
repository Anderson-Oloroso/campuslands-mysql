# Ejercicio 027 - Window Functions para Videojuego de Acción y Aventura

Solución de nivel avanzado enfocada en la implementación de **Funciones de Ventana (Window Functions)** en MySQL para la gestión y análisis avanzado de datos en un videojuego de acción y aventura, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `misiones_aventura_avanzado` equipada con restricciones `CHECK` para garantizar la integridad de las recompensas monetarias y los tiempos estimados.
- `dml/inserts.sql`: Carga inicial de 8 registros normalizados con datos técnicos coherentes del contexto de misiones del juego.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas avanzadas utilizando funciones de ventana clave (`RANK()`, `ROW_NUMBER()`, agregaciones con `OVER()`, `SUM()` acumulativos, y funciones de desplazamiento `LAG()` y `LEAD()`).

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura de la base de datos y sus restricciones.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar la ejecución de las funciones de ventana y los reportes analíticos avanzados.

## Evidencia de Resultados (Tabla de Registros Base)

| id | nombre_mision | region | dificultad | recompensa_oro | tiempo_estimado_min | estado | fecha_limite |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | El Despertar de las Sombras | Valle Eldoria | Facil | 150.00 | 45 | completada | 2026-09-01 |
| 2 | La Espada Perdida del Rey | Bosque Susurrante | Medio | 500.50 | 120 | en_progreso | 2026-09-05 |
| 3 | Asalto a la Fortaleza de Hielo | Picos Helados | Dificultad | 1200.00 | 240 | pendiente | 2026-09-15 |
| 4 | El Secreto del Templo Sumergido | Pantano Lúgubre | Medio | 750.25 | 180 | completada | 2026-08-25 |
| 5 | Caza del Dragon Ancestral | Volcan Ignis | Legendario | 5000.00 | 480 | pendiente | 2026-10-01 |
| 6 | Defensa de la Aldea Fronteriza | Valle Eldoria | Facil | 200.00 | 60 | en_progreso | 2026-08-30 |
| 7 | Infiltracion en la Torre Oscura | Picos Helados | Dificultad | 1500.75 | 300 | bloqueada | NULL |
| 8 | El Tesoro del Pirata Fantasma | Isla Calavera | Medio | 850.00 | 150 | pendiente | 2026-09-10 |

## Decisiones Técnicas
- **Uso de Window Functions**: Se aplicaron funciones analíticas avanzadas sin necesidad de agrupar (`GROUP BY`) los registros principales, permitiendo calcular totales móviles, rankings particionados por región y comparaciones con promedios de dificultad de manera simultánea.
- **Precisión Numérica**: Uso estricto de tipos `DECIMAL(10,2)` para los cálculos exactos de las recompensas de oro y restricciones `CHECK` para mantener la consistencia operativa de las misiones.