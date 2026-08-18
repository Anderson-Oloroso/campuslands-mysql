# Ejercicio 035 - indices para taller mecanico de motos

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **taller mecanico de motos**. El proyecto implementa **indices**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **indices** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `mecanicos`
Almacena el personal tecnico calificado del taller mecanico.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_mecanico` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del mecanico |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del especialista |
| `especialidad` | `VARCHAR(50) NOT NULL` | Area tecnica (Motores, Electrico, Frenos) |
| `rango` | `ENUM('Junior','Intermedio','Senior') NOT NULL` | Nivel de experiencia |
| `estado` | `ENUM('Disponible','Ocupado','Vacaciones') DEFAULT 'Disponible'` | Disponibilidad laboral |

### Tabla Secundaria: `servicios_taller`
Registra las ordenes de reparacion, mantenimiento y diagnostico de motocicletas.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_servicio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la orden de servicio |
| `moto` | `VARCHAR(50) NOT NULL` | Marca y modelo de la motocicleta |
| `placa` | `VARCHAR(20) NOT NULL` | Placa de circulacion |
| `id_mecanico` | `INT NOT NULL` | Mecanico asignado al trabajo |
| `descripcion` | `VARCHAR(150) NOT NULL` | Trabajo o mantenimiento a ejecutar |
| `costo` | `DECIMAL(8,2) NOT NULL DEFAULT 0` | Costo total del servicio |
| `estado` | `ENUM('Pendiente','En Proceso','Finalizado','Cancelado') DEFAULT 'Pendiente'` | Progreso del trabajo |
| `fecha_servicio` | `DATE NOT NULL` | Fecha de realizacion o ingreso |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`mecanicos`, `servicios_taller`) y los objetos programables o de rendimiento correspondientes a **indices** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **indices**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `indices`
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

La implementación de **indices** en el contexto de **taller mecanico de motos** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
