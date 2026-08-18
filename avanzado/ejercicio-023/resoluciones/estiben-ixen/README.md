# Ejercicio 023 - roles y permisos para arquitectura 3D

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **arquitectura 3D**. El proyecto implementa **roles y permisos**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **roles y permisos** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `firmas_arquitectura`
Almacena despachos y firmas internacionales de arquitectura.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_firma` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la firma |
| `nombre_firma` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre del estudio arquitectonico |
| `pais` | `VARCHAR(40) NOT NULL` | Sede central |
| `arquitecto_lider` | `VARCHAR(70) NOT NULL` | Director de diseno |

### Tabla Secundaria: `proyectos_bim`
Almacena proyectos arquitectonicos, metros cuadrados, presupuestos y modelos BIM.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_proyecto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del proyecto arquitectonico |
| `nombre_obra` | `VARCHAR(90) NOT NULL` | Nombre del edificio o residencia |
| `id_firma` | `INT NOT NULL` | Firma proyectista |
| `tipologia` | `ENUM('Residencial Lujo','Rascacielos Corporativo','Museo/Cultural','Hospitalario','Comercial') NOT NULL` | Tipo de inmueble |
| `area_m2` | `DECIMAL(10,2) NOT NULL` | Area construida en metros cuadrados |
| `presupuesto_millones` | `DECIMAL(8,2) NOT NULL` | Costo estimado de ejecucion en USD |
| `software_bim` | `ENUM('Revit BIM','Archicad','Rhino Grasshopper','SketchUp Pro') NOT NULL` | Plataforma de modelado |
| `estado_proyecto` | `ENUM('En Diseno','Aprobado','En Construccion','Finalizado') DEFAULT 'En Diseno'` | Campo estado_proyecto |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`firmas_arquitectura`, `proyectos_bim`) y los objetos programables o de rendimiento correspondientes a **roles y permisos** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **roles y permisos**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `roles y permisos`
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

La implementación de **roles y permisos** en el contexto de **arquitectura 3D** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
