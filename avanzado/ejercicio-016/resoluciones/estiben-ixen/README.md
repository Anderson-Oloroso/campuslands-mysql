# Ejercicio 016 - transacciones para restaurante de comida urbana

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **restaurante de comida urbana**. El proyecto implementa **transacciones**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **transacciones** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `categorias_menu`
Almacena secciones del menu de comida urbana.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_categoria` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de seccion |
| `nombre_categoria` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre de la categoria del menu |
| `descripcion` | `VARCHAR(100) NOT NULL` | Detalle de la linea gastronomica |

### Tabla Secundaria: `platillos_urbanos`
Almacena hamburguesas, tacos, bowls y platillos con calorias y costos.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_platillo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del plato |
| `nombre_platillo` | `VARCHAR(80) NOT NULL` | Nombre comercial |
| `id_categoria` | `INT NOT NULL` | Categoria en la carta |
| `precio` | `DECIMAL(6,2) NOT NULL` | Precio en USD |
| `tiempo_preparacion_min` | `INT NOT NULL DEFAULT 15` | Minutos de cocina |
| `calorias` | `INT NOT NULL` | Aporte energetico kcal |
| `es_vegetariano` | `ENUM('Si','No') DEFAULT 'No'` | Opcion apta para vegetarianos |
| `disponible` | `ENUM('Si','No') DEFAULT 'Si'` | Campo disponible |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`categorias_menu`, `platillos_urbanos`) y los objetos programables o de rendimiento correspondientes a **transacciones** (procedimientos, triggers, funciones, vistas o índices).

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

La implementación de **transacciones** en el contexto de **restaurante de comida urbana** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
