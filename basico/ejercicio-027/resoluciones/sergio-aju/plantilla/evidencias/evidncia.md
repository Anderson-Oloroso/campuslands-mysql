# Ejercicio 027 - Modelado de Entidad para Videojuego de Acción y Aventura

Solución de nivel básico enfocada en el modelado estructurado de entidades en MySQL para la gestión de misiones en un videojuego de acción y aventura, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `misiones_aventura` con restricciones `CHECK` para validar recompensas no negativas, además de campos tipados con `ENUM` y `DECIMAL` para mantener consistencia de datos.
- `dml/inserts.sql`: Carga inicial de 8 registros normalizados con datos realistas y casos límite (fechas nulas, diferentes estados y dificultades).
- `dql/consultas.sql`: Consultas analíticas de negocio con funciones de agregación (`COUNT`, `SUM`, `AVG`), filtros por estado y ordenamientos avanzados.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura y restricciones de la base de datos.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar la ejecución de los reportes analíticos del sistema de misiones.

## Evidencia de Resultados (Tabla de Registros Base)

| id | nombre_mision | region | dificultad | recompensa_oro | estado | fecha_limite |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | El Despertar de las Sombras | Valle Eldoria | Facil | 150.00 | completada | 2026-09-01 |
| 2 | La Espada Perdida del Rey | Bosque Susurrante | Medio | 500.50 | en_progreso | 2026-09-05 |
| 3 | Asalto a la Fortaleza de Hielo | Picos Helados | Dificultad | 1200.00 | pendiente | 2026-09-15 |
| 4 | El Secreto del Templo Sumergido | Pantano Lúgubre | Medio | 750.25 | completada | 2026-08-25 |
| 5 | Caza del Dragon Ancestral | Volcan Ignis | Legendario | 5000.00 | pendiente | 2026-10-01 |
| 6 | Defensa de la Aldea Fronteriza | Valle Eldoria | Facil | 200.00 | en_progreso | 2026-08-30 |
| 7 | Infiltracion en la Torre Oscura | Picos Helados | Dificultad | 1500.75 | bloqueada | NULL |
| 8 | El Tesoro del Pirata Fantasma | Isla Calavera | Medio | 850.00 | pendiente | 2026-09-10 |

## Decisiones Técnicas
- **Modelado de Entidades**: Se diseñó la tabla centrada en la entidad de misiones de aventura, incorporando atributos esenciales como regiones, dificultades controladas mediante `ENUM` y fechas límite para la planeación temporal.
- **Tipos de Datos Precisos**: Uso de `DECIMAL(10,2)` para asegurar la precisión en el cálculo de recompensas monetarias dentro del juego.