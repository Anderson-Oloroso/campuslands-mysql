# Ejercicio 037 - vistas avanzadas para liga de futbol

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **liga de futbol**. El proyecto implementa **vistas avanzadas**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **vistas avanzadas** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `clubes_futbol`
Almacena los clubes que compiten en el torneo de liga.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_club` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del club |
| `nombre_club` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre oficial del equipo |
| `ciudad` | `VARCHAR(50) NOT NULL` | Ciudad sede |
| `estadio` | `VARCHAR(60) NOT NULL` | Nombre del estadio |
| `fundacion` | `INT NOT NULL` | Ano de fundacion |

### Tabla Secundaria: `futbolistas`
Almacena las plantillas de jugadores de cada club de futbol.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del futbolista |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre completo |
| `posicion` | `ENUM('Portero','Defensa','Centrocampista','Delantero') NOT NULL` | Demarcacion tactica |
| `numero_camiseta` | `INT NOT NULL` | Dorsal oficial |
| `id_club` | `INT NOT NULL` | Club al que pertenece |
| `goles` | `INT NOT NULL DEFAULT 0` | Goles anotados en la temporada |
| `asistencias` | `INT NOT NULL DEFAULT 0` | Pases de gol |
| `salario_mensual` | `DECIMAL(10,2) NOT NULL` | Sueldo mensual en USD |
| `estado` | `ENUM('Titular','Suplente','Lesionado') DEFAULT 'Titular'` | Campo estado |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`clubes_futbol`, `futbolistas`) y los objetos programables o de rendimiento correspondientes a **vistas avanzadas** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **vistas avanzadas**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `vistas avanzadas`
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

La implementación de **vistas avanzadas** en el contexto de **liga de futbol** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
