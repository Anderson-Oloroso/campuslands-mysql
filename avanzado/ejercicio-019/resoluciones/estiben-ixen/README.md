# Ejercicio 019 - triggers para paracaidismo

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **paracaidismo**. El proyecto implementa **triggers**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **triggers** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `zonas_salto`
Almacena zonas de despegue y aterrizaje de paracaidismo (Drop Zones).

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_zona` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la pista |
| `nombre_zona` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del centro de paracaidismo |
| `altitud_pista_metros` | `INT NOT NULL` | Elevacion sobre nivel del mar |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de operacion |

### Tabla Secundaria: `saltos_registrados`
Registra saltos libres, altura, tiempo de caida y certificaciones.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_salto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del salto |
| `paracaidista` | `VARCHAR(70) NOT NULL` | Nombre del saltador |
| `tipo_salto` | `ENUM('Tandem','Solo AFF','Wingsuit','Formacion BFR','HALO') NOT NULL` | Modalidad de salto |
| `id_zona` | `INT NOT NULL` | Zona de ejecucion |
| `altitud_salto_pies` | `INT NOT NULL` | Altura de salida en pies |
| `tiempo_caida_libre_seg` | `INT NOT NULL` | Segundos en gravedad pura |
| `costo_salto` | `DECIMAL(7,2) NOT NULL` | Costo de la experiencia |
| `fecha_salto` | `DATETIME NOT NULL` | Fecha y hora del vuelo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`zonas_salto`, `saltos_registrados`) y los objetos programables o de rendimiento correspondientes a **triggers** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **triggers**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `triggers`
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

La implementación de **triggers** en el contexto de **paracaidismo** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
