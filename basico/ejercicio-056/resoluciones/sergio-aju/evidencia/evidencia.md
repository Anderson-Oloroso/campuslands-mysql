# Ejercicio 056 - Validaciones Simples para Videojuego RPG

Solución técnica enfocada en garantizar la **integridad de los datos** y la coherencia lógica en un entorno de juego RPG, utilizando restricciones (`CHECK`, `DEFAULT`, `UNIQUE`) para prevenir estados imposibles (niveles negativos, vida cero) y funciones de agregación para el análisis de balance del juego.

## Estructura de la Solución
- `ddl/schema.sql`: Definición de la tabla `personajes_rpg` con validaciones estrictas mediante `CONSTRAINT` para asegurar que el sistema de juego no admita registros corrompidos.
- `dml/inserts.sql`: Carga de datos que representan diversos arquetipos de juego, validando que el motor de base de datos acepte correctamente las restricciones.
- `dql/consultas.sql`: Análisis estadístico sobre el balance de personajes, rankings de poder y detección de estados críticos.

## Tabla Resumen de Datos (`personajes_rpg`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `codigo_personaje` | VARCHAR(15) | NOT NULL, UNIQUE | Identificador único del personaje |
| `clase_personaje` | ENUM | Guerrero, Mago, etc. | Arquetipo del personaje |
| `nivel_actual` | INT | CHECK (1-100) | Nivel del personaje (1-100) |
| `puntos_vida` | DECIMAL(6,1)| CHECK (> 0) | HP actual |
| `fuerza_ataque` | DECIMAL(5,1)| CHECK (>= 0) | Daño base |

## Decisiones Técnicas
- **Integridad Forzada**: Se priorizaron restricciones `CHECK` a nivel de base de datos en lugar de depender únicamente de la lógica de la aplicación, garantizando que incluso inserciones directas cumplan con las reglas de negocio.
- **Enfoque en Balance**: Las consultas SQL se orientaron no solo a listar datos, sino a extraer indicadores de balance (poder total, vida promedio), esenciales para un diseñador de videojuegos.