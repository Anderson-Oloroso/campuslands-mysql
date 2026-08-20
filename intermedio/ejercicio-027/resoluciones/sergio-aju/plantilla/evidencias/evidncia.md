# Ejercicio 027 - Consultas de Reportes para Videojuego de Acción y Aventura

Solución de nivel intermedio enfocada en el diseño de **consultas de reportes analíticos** e indicadores de negocio en MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `misiones_aventura_intermedio` con restricciones `CHECK` para garantizar recompensas no negativas y tiempos estimados lógicos.
- `dml/inserts.sql`: Inserción inicial de 8 registros normalizados con datos técnicos del contexto del videojuego de acción y aventura.
- `dql/consultas.sql`: Implementación de 5 consultas de reportes con funciones de agregación (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), cálculos derivados (`ROUND`), filtros complejos y límites.

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura y restricciones de la base de datos.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar la generación de los reportes analíticos del sistema.

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
- **Reportes Analíticos**: Se estructuraron consultas agrupadas por región y dificultad para medir indicadores clave (KPIs) como oro total, promedios de tiempo y tasas de rendimiento económico.
- **Tipos de Datos y Validación**: Uso estricto de `DECIMAL(10,2)` para precisión monetaria y restricciones `CHECK` para mantener la integridad de los atributos del juego.