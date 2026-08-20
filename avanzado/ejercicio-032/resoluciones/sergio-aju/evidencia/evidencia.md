# Ejercicio 032 - Procedimientos Almacenados para Ranking Battle Royale

Solución de nivel avanzado enfocada en el diseño, implementación y ejecución de **Procedimientos Almacenados (*Stored Procedures*)** en MySQL para encapsular la lógica de negocio transaccional y analítica en un sistema de ranking *Battle Royale*, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de rutinas y tablas previas, definición estructurada de la tabla principal de jugadores y la tabla transaccional de historial, junto con la programación de dos procedimientos almacenados: `sp_registrar_partida_jugador` (gestión transaccional ACID de partidas) y `sp_consultar_top_jugadores` (reportes de ranking parametrizados).
- `dml/inserts.sql`: Carga inicial estructurada de 8 jugadores profesionales con perfiles variados de rendimiento y estados.
- `dql/consultas.sql`: Pruebas de ejecución (`CALL`) de los procedimientos almacenados y consultas analíticas complementarias que incluyen uniones multitabla (`JOIN`), cálculos de tasas de rendimiento (*Win Rate*) y agrupaciones estadísticas por estado de cuenta.

## Tablas Resumen de Datos

### Tabla Principal: `jugadores_royale_avanzado`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del jugador |
| `jugador_nickname`| VARCHAR(60) | NOT NULL, UNIQUE | Gamertag único del competidor |
| `partidas_jugadas`| INT UNSIGNED | NOT NULL, Default 0 | Total de partidas disputadas |
| `victorias` | INT UNSIGNED | NOT NULL, Default 0 | Total de partidas ganadas (Top 1) |
| `eliminaciones` | INT UNSIGNED | NOT NULL, Default 0 | Total de bajas acumuladas |
| `puntos_ranking` | INT | NOT NULL, Default 0 | Puntuación oficial en la tabla |
| `estado_cuenta` | ENUM | ACTIVO / SUSPENDIDO / VETERANO | Estatus actual del perfil |

### Tabla Transaccional: `historial_partidas_royale`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `jugador_id` | INT | FOREIGN KEY (Cascade) | Referencia al jugador |
| `eliminaciones_partida`| INT UNSIGNED | NOT NULL, Default 0 | Bajas logradas en la partida específica |
| `puesto_obtenido` | INT UNSIGNED | CHECK (1 - 100) | Posición final en la partida |
| `puntos_ganados` | INT | NOT NULL | Puntos sumados o restados en la partida |
| `fecha_partida` | DATETIME | NOT NULL | Marca de tiempo exacta del evento |

## Ejecución
1. Ejecutar el archivo `schema.sql` para compilar los procedimientos almacenados y levantar la estructura relacional en la base de datos.
2. Ejecutar el archivo `inserts.sql` para poblar la base de datos con los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para comprobar la ejecución de los procedimientos mediante sentencias `CALL` y validar los reportes analíticos.

## Decisiones Técnicas
- **Encapsulamiento de Lógica (Stored Procedures)**: Se implementó un procedimiento transaccional (`sp_registrar_partida_jugador`) que automatiza el registro de partidas y la actualización simultánea de estadísticas bajo control ACID (`START TRANSACTION`, `COMMIT`), asegurando la integridad de los datos.
- **Parametrización Dinámica**: Creación de procedimientos flexibles como `sp_consultar_top_jugadores` que reciben parámetros de entrada (`IN`) para limitar reportes bajo demanda de manera eficiente.