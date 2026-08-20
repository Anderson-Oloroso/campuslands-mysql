# Ejercicio 038 - roles y permisos para futbol sala

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **futbol sala**. El proyecto implementa **roles y permisos**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **roles y permisos** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `equipos_futsal`
Almacena equipos participantes en la liga de futbol sala 5v5.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_equipo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del equipo |
| `nombre` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del equipo de futsal |
| `sede` | `VARCHAR(50) NOT NULL` | Polideportivo local |
| `entrenador` | `VARCHAR(60) NOT NULL` | Director tecnico |
| `estado` | `ENUM('Activo','Inactivo') DEFAULT 'Activo'` | Campo estado |

### Tabla Secundaria: `jugadores_futsal`
Almacena los jugadores de futsal, sus posiciones y rendimiento.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del jugador |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del jugador |
| `posicion` | `ENUM('Portero','Cierre','Ala','Pivot') NOT NULL` | Posicion en campo |
| `id_equipo` | `INT NOT NULL` | Equipo asignado |
| `goles` | `INT NOT NULL DEFAULT 0` | Goles en temporada |
| `tarjetas_amarillas` | `INT NOT NULL DEFAULT 0` | Amonestaciones |
| `tarjetas_rojas` | `INT NOT NULL DEFAULT 0` | Expulsiones |
| `valoracion` | `DECIMAL(4,2) NOT NULL DEFAULT 7.00` | Puntaje de rendimiento |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`equipos_futsal`, `jugadores_futsal`) y los objetos programables o de rendimiento correspondientes a **roles y permisos** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **roles y permisos**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `roles y permisos`
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

La implementación de **roles y permisos** en el contexto de **futbol sala** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
