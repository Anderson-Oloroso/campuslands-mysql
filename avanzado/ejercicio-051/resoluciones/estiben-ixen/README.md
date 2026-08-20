# Ejercicio 051 - EXPLAIN para dibujo digital

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **dibujo digital**. El proyecto implementa **EXPLAIN**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **EXPLAIN** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `ilustradores_digitales`
Almacena perfiles de artistas visuales e ilustradores digitales.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_ilustrador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del artista |
| `nombre_artistico` | `VARCHAR(60) NOT NULL UNIQUE` | Alias en plataformas de arte |
| `software_preferido` | `ENUM('Photoshop','Procreate','Clip Studio Paint','Krita','Blender Grease Pencil') NOT NULL` | Software principal |
| `seguidores` | `INT NOT NULL DEFAULT 0` | Comunidad en redes |

### Tabla Secundaria: `obras_digitales`
Almacena pinturas digitales, resoluciones, capas y programas utilizados.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_obra` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la pieza digital |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo de la obra |
| `id_ilustrador` | `INT NOT NULL` | Artista creador |
| `estilo` | `ENUM('Concept Art','Anime/Manga','Splash Art','Pixel Art','Retrato Semirrealista') NOT NULL` | Estilo visual |
| `cantidad_capas` | `INT NOT NULL` | Total de capas en el archivo .psd/.clip |
| `ancho_px` | `INT NOT NULL` | Resolucion horizontal |
| `alto_px` | `INT NOT NULL` | Resolucion vertical |
| `precio_comision` | `DECIMAL(7,2) NOT NULL` | Costo en USD |
| `fecha_creacion` | `DATE NOT NULL` | Fecha de finalizacion |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`ilustradores_digitales`, `obras_digitales`) y los objetos programables o de rendimiento correspondientes a **EXPLAIN** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **EXPLAIN**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `EXPLAIN`
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

La implementación de **EXPLAIN** en el contexto de **dibujo digital** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
