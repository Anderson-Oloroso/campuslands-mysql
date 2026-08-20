# Ejercicio 028 - JSON en MySQL para academia tech

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **academia tech**. El proyecto implementa **JSON en MySQL**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **JSON en MySQL** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `rutas_aprendizaje`
Almacena especialidades y rutas tecnicas de formacion (Backend, Frontend, Cloud, IA).

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_ruta` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la ruta tecnica |
| `nombre_ruta` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del Bootcamp / Especialidad |
| `duracion_meses` | `INT NOT NULL DEFAULT 6` | Meses de formacion |
| `tecnologia_principal` | `VARCHAR(50) NOT NULL` | Stack principal (Node.js, Java, Python, React) |

### Tabla Secundaria: `campers_estudiantes`
Almacena campers y estudiantes con asistencias, proyectos y estado academico.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_camper` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del estudiante |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre del estudiante |
| `email` | `VARCHAR(60) NOT NULL UNIQUE` | Correo institucional |
| `id_ruta` | `INT NOT NULL` | Ruta en la que esta matriculado |
| `promedio_acumulado` | `DECIMAL(4,2) NOT NULL DEFAULT 0.00` | Nota media (0-100) |
| `proyectos_aprobados` | `INT NOT NULL DEFAULT 0` | Modulos aprobados |
| `estado` | `ENUM('En Proceso','Graduado','En Riesgo','Retirado') DEFAULT 'En Proceso'` | Estado de permanencia |
| `fecha_ingreso` | `DATE NOT NULL` | Inicio de clases |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`rutas_aprendizaje`, `campers_estudiantes`) y los objetos programables o de rendimiento correspondientes a **JSON en MySQL** (procedimientos, triggers, funciones, vistas o índices).

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

La implementación de **JSON en MySQL** en el contexto de **academia tech** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
