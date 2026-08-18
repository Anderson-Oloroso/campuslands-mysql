# Ejercicio 041 - CTE para pingpong

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **pingpong**. El proyecto implementa **CTE**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **CTE** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `clubes_pingpong`
Almacena clubes y federaciones de tenis de mesa.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_club` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del club |
| `nombre` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del club de tenis de mesa |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de ubicacion |
| `categoria` | `ENUM('Profesional','Semi-Pro','Amateur') DEFAULT 'Profesional'` | Campo categoria |

### Tabla Secundaria: `jugadores_pingpong`
Almacena tenimesistas con su ranking mundial ITTF y estilo de juego.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del tenimesista |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del jugador |
| `mano_habil` | `ENUM('Derecha','Izquierda') NOT NULL` | Lateralidad |
| `estilo_agarre` | `ENUM('Shakehand','Penhold') NOT NULL` | Tipo de empunadura |
| `id_club` | `INT NOT NULL` | Club de afiliacion |
| `ranking_puntos` | `INT NOT NULL DEFAULT 1000` | Puntos en el ranking oficial |
| `torneos_ganados` | `INT NOT NULL DEFAULT 0` | Titulos individuales |
| `estado` | `ENUM('Activo','Inactivo') DEFAULT 'Activo'` | Campo estado |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`clubes_pingpong`, `jugadores_pingpong`) y los objetos programables o de rendimiento correspondientes a **CTE** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **CTE**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `CTE`
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

La implementación de **CTE** en el contexto de **pingpong** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
