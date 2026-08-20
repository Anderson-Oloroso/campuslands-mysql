# Ejercicio 032 - Tipos de Datos para Ranking Battle Royale

Solución de nivel básico enfocada en la selección, diseño y aplicación de **tipos de datos estrictos en MySQL** para un sistema de gestión y estadísticas de un ranking de un juego *Battle Royale*, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas anteriores y definición estructurada de la tabla `ranking_battle_royale` utilizando tipos de datos optimizados (`INT UNSIGNED`, `DECIMAL`, `ENUM`, `DATE`, `VARCHAR`) y restricciones lógicas (`CHECK`) para garantizar la coherencia de las estadísticas de juego.
- `dml/inserts.sql`: Carga inicial de 8 registros de jugadores profesionales con perfiles variados en plataformas, partidas, eliminaciones y estados.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que incluyen tablas de clasificación, cálculos de tasas de victoria (*win rate*), agregaciones por plataforma, filtros de precisión avanzada y el reporte del *Top 3*.

## Tabla Resumen de Datos (`ranking_battle_royale`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `jugador_nickname`| VARCHAR(60) | NOT NULL, UNIQUE | Apodo o gamertag único del jugador |
| `plataforma` | ENUM | PC / PlayStation / Xbox / Mobile | Dispositivo principal de juego |
| `partidas_jugadas`| INT UNSIGNED | NOT NULL, Default 0 | Total de partidas disputadas |
| `victorias` | INT UNSIGNED | NOT NULL, Default 0 | Total de partidas ganadas (Top 1) |
| `eliminaciones` | INT UNSIGNED | NOT NULL, Default 0 | Total de bajas o kills acumuladas |
| `precision_tiro` | DECIMAL(5,2) | CHECK (0.00 - 100.00) | Porcentaje de precisión de disparos |
| `puntos_ranking` | INT | NOT NULL, Default 0 | Puntuación oficial en la tabla de clasificación |
| `fecha_ultimo_registro`| DATE | NOT NULL | Fecha de la última actividad del jugador |
| `estado_cuenta` | ENUM | ACTIVO / SUSPENDIDO / VETERANO | Estatus actual del perfil |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura relacional y los tipos de datos en la base de datos.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla con los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las consultas analíticas y los reportes de rendimiento.

## Decisiones Técnicas
- **Tipos de Datos Eficientes**: Uso de `INT UNSIGNED` para contadores que nunca deben ser negativos (partidas, victorias, eliminaciones), optimizando el almacenamiento y la integridad lógica.
- **Precisión Numérica con DECIMAL**: Empleo de `DECIMAL(5,2)` para la precisión de tiro, permitiendo almacenar porcentajes exactos con dos decimales sin errores de redondeo.
- **Validaciones Lógicas (CHECK)**: Incorporación de restricciones para asegurar que la precisión de tiro se mantenga en el rango porcentual válido de 0 a 100.