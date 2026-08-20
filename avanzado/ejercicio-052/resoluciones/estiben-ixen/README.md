# Ejercicio 052 - vistas avanzadas para animacion 3D

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **animacion 3D**. El proyecto implementa **vistas avanzadas**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **vistas avanzadas** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `estudios_animacion`
Almacena estudios y productoras de animacion CGI y efectos visuales (VFX).

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_estudio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del estudio |
| `nombre_estudio` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre comercial de la productora |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de operaciones |
| `motor_render_principal` | `ENUM('Cycles','Arnold','RenderMan','V-Ray','Unreal Engine 5') NOT NULL` | Motor principal |

### Tabla Secundaria: `personajes_3d`
Almacena personajes 3D modelados, rigs, poligonos y motores de render.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_personaje` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del modelo 3D |
| `nombre_modelo` | `VARCHAR(70) NOT NULL` | Nombre del asset 3D |
| `id_estudio` | `INT NOT NULL` | Estudio creador |
| `software_modelado` | `ENUM('Maya','Blender','ZBrush','Houdini','Cinema 4D') NOT NULL` | Software base |
| `poligonos_count` | `INT NOT NULL` | Conteo total de poligonos |
| `tipo_rig` | `ENUM('Bipedo Humanoide','Facial Avanzado','Criatura Cuadrupeda','Mecanico/Robot') NOT NULL` | Estructura osea |
| `texturas_4k` | `ENUM('Si','No') DEFAULT 'Si'` | Texturizado en 4K UDIM |
| `costo_produccion` | `DECIMAL(8,2) NOT NULL` | Costo del modelado y rigging en USD |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`estudios_animacion`, `personajes_3d`) y los objetos programables o de rendimiento correspondientes a **vistas avanzadas** (procedimientos, triggers, funciones, vistas o índices).

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

La implementación de **vistas avanzadas** en el contexto de **animacion 3D** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
