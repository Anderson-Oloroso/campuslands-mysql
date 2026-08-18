# Ejercicio 031 - transacciones para torneo esports MOBA

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **torneo esports MOBA**. El proyecto implementa **transacciones**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **transacciones** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `escuadras`
Almacena las escuadras o equipos participantes en el torneo MOBA.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_escuadra` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico de la escuadra |
| `nombre` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre oficial del equipo |
| `region` | `VARCHAR(40) NOT NULL` | Region competitiva |
| `estado` | `ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'` | Estado de participacion |

### Tabla Secundaria: `jugadores_moba`
Almacena los jugadores registrados por escuadra en el torneo.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del jugador |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre real del jugador |
| `nickname` | `VARCHAR(40) NOT NULL UNIQUE` | Nombre de invocador / alias |
| `rol` | `ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL` | Posicion de juego |
| `id_escuadra` | `INT NOT NULL` | Llave foranea a escuadras |
| `puntaje` | `DECIMAL(6,2) DEFAULT 0` | Puntaje acumulado de rendimiento |
| `estado` | `ENUM('activo','inactivo') DEFAULT 'activo'` | Disponibilidad del jugador |
| `fecha_registro` | `DATE NOT NULL` | Fecha de ingreso al torneo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`escuadras`, `jugadores_moba`) y los objetos programables o de rendimiento correspondientes a **transacciones** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **transacciones**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `transacciones`
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

La implementación de **transacciones** en el contexto de **torneo esports MOBA** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
