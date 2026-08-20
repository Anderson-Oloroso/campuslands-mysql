# Ejercicio 027 - window functions para videojuego de accion y aventura

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **videojuego de accion y aventura**. El proyecto implementa **window functions**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **window functions** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `reinos_aventura`
Almacena regiones y reinos explorables en el mundo abierto.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_reino` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del territorio |
| `nombre_reino` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del mapa o comarca |
| `clima_dominante` | `ENUM('Bosque Elfico','Tierras Altas Nevadas','Volcanico Arido','Ruinas Sumergidas','Desierto Maldito') NOT NULL` | Bioma |
| `nivel_peligro` | `INT NOT NULL DEFAULT 1` | Nivel de amenaza (1-10) |

### Tabla Secundaria: `artefactos_magicos`
Almacena reliquias, armas ancestrales, poder magico y ubicacion de encuentro.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_artefacto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del objeto legendario |
| `nombre_artefacto` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre de la reliquia |
| `id_reino` | `INT NOT NULL` | Reino de procedencia |
| `tipo_artefacto` | `ENUM('Espada Ancestral','Amuleto Mistico','Escudo Divino','Tomo de Poder','Arco Legendario') NOT NULL` | Tipo de item |
| `poder_ataque` | `INT NOT NULL DEFAULT 0` | Poder ofensivo |
| `poder_defensa` | `INT NOT NULL DEFAULT 0` | Poder defensivo |
| `durabilidad` | `INT NOT NULL DEFAULT 100` | Integridad del item |
| `es_legendario` | `ENUM('Si','No') DEFAULT 'Si'` | Campo es_legendario |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`reinos_aventura`, `artefactos_magicos`) y los objetos programables o de rendimiento correspondientes a **window functions** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **window functions**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `window functions`
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

La implementación de **window functions** en el contexto de **videojuego de accion y aventura** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
