# Ejercicio 032 - LEFT JOIN para Ranking Battle Royale

Solución de nivel intermedio enfocada en la implementación y explotación de consultas multitabla utilizando **LEFT JOIN** en MySQL para gestionar la relación entre clanes y jugadores en un sistema de ranking *Battle Royale*, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, la tabla padre `clanes_royale` y la tabla hija `jugadores_royale`, configurando una relación de uno a muchos con llave foránea opcional (`ON DELETE SET NULL`) para permitir jugadores sin clan y casos de clanes vacíos.
- `dml/inserts.sql`: Carga inicial de 4 clanes (incluyendo un caso límite de clan sin miembros) y 8 jugadores (incluyendo jugadores solitarios sin clan) para comprobar el comportamiento del `LEFT JOIN`.
- `dql/consultas.sql`: Implementación de 5 consultas avanzadas que explotan el `LEFT JOIN`, incluyendo reportes de membresía, detección de registros huérfanos (`IS NULL`), funciones condicionales (`COALESCE`) y agregaciones estadísticas.

## Tablas Resumen de Datos

### Tabla Padre: `clanes_royale`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del clan |
| `nombre_clan` | VARCHAR(80) | NOT NULL, UNIQUE | Nombre oficial de la organización |
| `tag_clan` | VARCHAR(10) | NOT NULL, UNIQUE | Siglas o abreviatura del clan |
| `nivel_clan` | INT UNSIGNED | NOT NULL, Default 1 | Nivel de progresión del clan |
| `fecha_creacion` | DATE | NOT NULL | Fecha de fundación del clan |

### Tabla Hija: `jugadores_royale`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del jugador |
| `jugador_nickname`| VARCHAR(60) | NOT NULL, UNIQUE | Gamertag único del competidor |
| `clan_id` | INT | DEFAULT NULL (Foreign Key) | Referencia al clan (Permite NULL) |
| `partidas_jugadas`| INT UNSIGNED | NOT NULL, Default 0 | Total de partidas disputadas |
| `victorias` | INT UNSIGNED | NOT NULL, Default 0 | Total de partidas ganadas (Top 1) |
| `eliminaciones` | INT UNSIGNED | NOT NULL, Default 0 | Total de bajas acumuladas |
| `puntos_ranking` | INT | NOT NULL, Default 0 | Puntuación oficial en el ranking |
| `estado_cuenta` | ENUM | ACTIVO / SUSPENDIDO / VETERANO | Estatus actual del perfil |

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura relacional y las restricciones de integridad.
2. Ejecutar el archivo `inserts.sql` para poblar las tablas con los registros iniciales y casos límite.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las consultas basadas en `LEFT JOIN`.

## Decisiones Técnicas
- **Manejo de Coincidencias Parciales**: Uso estratégico de `LEFT JOIN` partiendo desde la tabla de clanes para garantizar la visualización de organizaciones que aún no cuentan con miembros activos.
- **Limpieza de Valores Nulos**: Integración de funciones de manejo de nulos como `COALESCE` para transformar valores vacíos en textos descriptivos legibles para reportes ejecutivos.