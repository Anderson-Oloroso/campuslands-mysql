# Ejercicio 032 - procedimientos almacenados para ranking battle royale

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **ranking battle royale**. El proyecto implementa **procedimientos almacenados**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **procedimientos almacenados** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `jugadores_br`
Almacena los perfiles de jugadores del battle royale.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del jugador |
| `nickname` | `VARCHAR(40) NOT NULL UNIQUE` | Alias en el juego |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de origen |
| `nivel` | `INT NOT NULL DEFAULT 1` | Nivel de cuenta |
| `estado` | `ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'` | Estado del jugador |

### Tabla Secundaria: `partidas_br`
Registra las partidas disputadas y resultados de cada jugador.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_partida` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico de partida |
| `id_jugador` | `INT NOT NULL` | Llave foranea a jugadores |
| `mapa` | `VARCHAR(40) NOT NULL` | Mapa donde se jugo |
| `posicion` | `INT NOT NULL` | Puesto final obtenido (1 a 100) |
| `eliminaciones` | `INT NOT NULL DEFAULT 0` | Bajas conseguidas |
| `puntos` | `DECIMAL(8,2) NOT NULL DEFAULT 0` | Puntos ganados en la partida |
| `fecha_partida` | `DATETIME NOT NULL` | Fecha y hora de la partida |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`jugadores_br`, `partidas_br`) y los objetos programables o de rendimiento correspondientes a **procedimientos almacenados** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **procedimientos almacenados**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `procedimientos almacenados`
- Integridad transaccional ACID
- `INNER JOIN`, `LEFT JOIN`
- Common Table Expressions (`WITH`)
- Window Functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`)
- Optimización y planes de ejecución

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` (creación de estructuras y objetos programables).
2. Ejecutar `dml/inserts.sql` (poblado de información controlada).
3. Ejecutar `dql/consultas.sql` (ejecución de consultas de alto nivel y validación).

---

## Conclusión

La implementación de **procedimientos almacenados** en el contexto de **ranking battle royale** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
