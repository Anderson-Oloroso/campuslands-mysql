# Ejercicio 055 - backup logico para laboratorio de formulas quimicas

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **laboratorio de formulas quimicas**. El proyecto implementa **backup logico**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **backup logico** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `laboratorios_quimicos`
Almacena instituciones y plantas de analisis fisico-quimico y farmaceutico.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_laboratorio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del laboratorio |
| `nombre_laboratorio` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre del centro de investigacion |
| `nivel_bioseguridad` | `ENUM('BSL-1','BSL-2','BSL-3','BSL-4') NOT NULL` | Nivel de contencion |
| `responsable_sanitario` | `VARCHAR(70) NOT NULL` | Quimico Farmaceutico titular |

### Tabla Secundaria: `reactivos_quimicos`
Almacena reactivos, compuestos quimicos, grados de pureza y almacenamiento.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_reactivo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del compuesto |
| `nombre_quimico` | `VARCHAR(80) NOT NULL` | Nombre IUPAC o comercial |
| `formula_molecular` | `VARCHAR(40) NOT NULL` | Formula empirica/quimica |
| `id_laboratorio` | `INT NOT NULL` | Laboratorio depositario |
| `pureza_porcentaje` | `DECIMAL(5,2) NOT NULL` | Grado de pureza (%) |
| `clasificacion_peligro` | `ENUM('Inflamable','Corrosivo','Toxico','Explosivo','Comburente','Inerte') NOT NULL` | Rombo de seguridad NFPA |
| `stock_gramos` | `DECIMAL(10,2) NOT NULL` | Cantidad disponible en gramos |
| `temperatura_almacenamiento_c` | `INT NOT NULL DEFAULT 20` | Temperatura requerida en Celsius |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`laboratorios_quimicos`, `reactivos_quimicos`) y los objetos programables o de rendimiento correspondientes a **backup logico** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **backup logico**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `backup logico`
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

La implementación de **backup logico** en el contexto de **laboratorio de formulas quimicas** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
