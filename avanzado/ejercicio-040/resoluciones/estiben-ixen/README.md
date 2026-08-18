# Ejercicio 040 - backup logico para carreras urbanas

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **carreras urbanas**. El proyecto implementa **backup logico**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **backup logico** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `pilotos_urbanos`
Almacena pilotos de carreras nocturnas callejeras.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_piloto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del corredor |
| `apodo` | `VARCHAR(40) NOT NULL UNIQUE` | Alias en el circuito callejero |
| `nombre_real` | `VARCHAR(70) NOT NULL` | Nombre real |
| `reputacion` | `INT NOT NULL DEFAULT 100` | Puntos de respeto callejero |
| `estado` | `ENUM('Activo','Buscado','Retirado') DEFAULT 'Activo'` | Campo estado |

### Tabla Secundaria: `vehiculos_tuning`
Almacena vehiculos modificados con mejoras de rendimiento y nitro.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_vehiculo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del coche |
| `modelo` | `VARCHAR(60) NOT NULL` | Marca y modelo del auto |
| `id_piloto` | `INT NOT NULL` | Piloto propietario |
| `traccion` | `ENUM('RWD','AWD','FWD') NOT NULL` | Tipo de traccion |
| `potencia_hp` | `INT NOT NULL` | Caballos de fuerza modificados |
| `oxido_nitroso` | `ENUM('Si','No') DEFAULT 'Si'` | Equipamiento de nitro NOS |
| `carreras_ganadas` | `INT NOT NULL DEFAULT 0` | Victorias en piques |
| `valor_tuning` | `DECIMAL(8,2) NOT NULL` | Inversion en modificaciones en USD |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`pilotos_urbanos`, `vehiculos_tuning`) y los objetos programables o de rendimiento correspondientes a **backup logico** (procedimientos, triggers, funciones, vistas o índices).

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

La implementación de **backup logico** en el contexto de **carreras urbanas** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
