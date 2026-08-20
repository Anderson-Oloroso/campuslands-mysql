# Ejercicio 039 - bloqueos para kickboxing

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **kickboxing**. El proyecto implementa **bloqueos**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **bloqueos** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `gimnasios_kb`
Almacena academias y dojos de kickboxing y muay thai.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_gimnasio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la academia |
| `nombre` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del dojo/gym |
| `ciudad` | `VARCHAR(50) NOT NULL` | Ciudad de entrenamiento |
| `entrenador_principal` | `VARCHAR(60) NOT NULL` | Coach principal |

### Tabla Secundaria: `peleadores_kb`
Almacena peleadores profesionales con su record de combates.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_peleador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del luchador |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre completo |
| `apodo` | `VARCHAR(40) NOT NULL` | Alias de combate |
| `categoria_peso` | `ENUM('Peso Mosca','Peso Pluma','Peso Ligero','Peso Welter','Peso Mediano','Peso Pesado') NOT NULL` | Division de peso |
| `id_gimnasio` | `INT NOT NULL` | Gimnasio de representacion |
| `victorias` | `INT NOT NULL DEFAULT 0` | Peleas ganadas |
| `nocauts` | `INT NOT NULL DEFAULT 0` | Victorias por KO/TKO |
| `derrotas` | `INT NOT NULL DEFAULT 0` | Peleas perdidas |
| `estilo` | `ENUM('Holandes','Muay Thai','Americano','K-1') NOT NULL` | Estilo principal |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`gimnasios_kb`, `peleadores_kb`) y los objetos programables o de rendimiento correspondientes a **bloqueos** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **bloqueos**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `bloqueos`
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

La implementación de **bloqueos** en el contexto de **kickboxing** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
