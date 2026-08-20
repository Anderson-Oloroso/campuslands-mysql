# Ejercicio 013 - JSON en MySQL para catalogo de peliculas de miedo

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **catalogo de peliculas de miedo**. El proyecto implementa **JSON en MySQL**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **JSON en MySQL** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `directores_terror`
Almacena cineastas especializados en el genero de terror y suspense.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_director` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del director |
| `nombre` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre del cineasta |
| `nacionalidad` | `VARCHAR(40) NOT NULL` | Pais de origen |
| `premios_obtenidos` | `INT NOT NULL DEFAULT 0` | Galardones en festivales de cine |

### Tabla Secundaria: `peliculas_terror`
Almacena peliculas de miedo con su presupuesto, taquilla y clasificacion.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_pelicula` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del filme |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo oficial de la pelicula |
| `id_director` | `INT NOT NULL` | Director a cargo |
| `subgenero` | `ENUM('Sobrenatural','Slasher','Psicologico','Gore','Monstruos','Cosmico') NOT NULL` | Subgenero de terror |
| `duracion_min` | `INT NOT NULL` | Duracion en minutos |
| `presupuesto_millones` | `DECIMAL(6,2) NOT NULL` | Presupuesto de produccion en USD |
| `taquilla_millones` | `DECIMAL(6,2) NOT NULL` | Recaudacion global en USD |
| `clasificacion_edad` | `ENUM('PG-13','R','NC-17') NOT NULL` | Clasificacion de edad |
| `estreno_anio` | `INT NOT NULL` | Ano de lanzamiento |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`directores_terror`, `peliculas_terror`) y los objetos programables o de rendimiento correspondientes a **JSON en MySQL** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **JSON en MySQL**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `JSON en MySQL`
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

La implementación de **JSON en MySQL** en el contexto de **catalogo de peliculas de miedo** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
