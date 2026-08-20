# Ejercicio 044 - event scheduler para saga de ciencia ficcion

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **saga de ciencia ficcion**. El proyecto implementa **event scheduler**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **event scheduler** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `facciones_scifi`
Almacena imperios, corporaciones y facciones galacticas.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_faccion` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la faccion |
| `nombre_faccion` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre de la organizacion interestelar |
| `planeta_capital` | `VARCHAR(50) NOT NULL` | Sede del gobierno |
| `tipo_gobierno` | `ENUM('Imperio','Federacion','Corporacion','Gremio') NOT NULL` | Sistema politico |

### Tabla Secundaria: `naves_espaciales`
Almacena naves espaciales con blindaje, propulsion y capacidad de tripulacion.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_nave` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la nave |
| `nombre_nave` | `VARCHAR(70) NOT NULL` | Nombre de la embarcacion cosmica |
| `clase` | `ENUM('Caza Ligero','Corbeta','Fragata','Destructor','Crucero de Batalla','Nave Insignia') NOT NULL` | Clase de navio |
| `id_faccion` | `INT NOT NULL` | Faccion a la que pertenece |
| `tripulacion_max` | `INT NOT NULL` | Capacidad de personal a bordo |
| `velocidad_curvatura` | `DECIMAL(4,2) NOT NULL` | Factor Warp / Curvatura |
| `nivel_escudos` | `INT NOT NULL DEFAULT 100` | Porcentaje de integridad de escudo |
| `estado_operativo` | `ENUM('Activo','En Mantenimiento','Destruida') DEFAULT 'Activo'` | Campo estado_operativo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`facciones_scifi`, `naves_espaciales`) y los objetos programables o de rendimiento correspondientes a **event scheduler** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **event scheduler**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `event scheduler`
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

La implementación de **event scheduler** en el contexto de **saga de ciencia ficcion** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
