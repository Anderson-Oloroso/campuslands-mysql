# Ejercicio 015 - optimizacion para biblioteca gamer

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **biblioteca gamer**. El proyecto implementa **optimizacion**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **optimizacion** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `estudios_desarrollo`
Almacena estudios y desarrolladoras de videojuegos.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_estudio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del estudio |
| `nombre_estudio` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre de la compania |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de la sede |
| `fundacion` | `INT NOT NULL` | Ano de fundacion |

### Tabla Secundaria: `videojuegos_catalogo`
Almacena el catalogo de videojuegos con genero, precio y calificacion.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_videojuego` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del juego |
| `titulo` | `VARCHAR(80) NOT NULL` | Nombre del juego |
| `id_estudio` | `INT NOT NULL` | Estudio creador |
| `genero` | `ENUM('RPG','Accion','Aventura','Estrategia','Shooter','Simulacion','Soulslike') NOT NULL` | Genero |
| `metacritic_score` | `INT NOT NULL` | Puntuacion en Metacritic (1-100) |
| `precio_usd` | `DECIMAL(6,2) NOT NULL DEFAULT 59.99` | Precio de venta |
| `horas_promedio_juego` | `INT NOT NULL` | Duracion estimada de la campana |
| `lanzamiento_anio` | `INT NOT NULL` | Ano de salida al mercado |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`estudios_desarrollo`, `videojuegos_catalogo`) y los objetos programables o de rendimiento correspondientes a **optimizacion** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **optimizacion**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `optimizacion`
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

La implementación de **optimizacion** en el contexto de **biblioteca gamer** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
