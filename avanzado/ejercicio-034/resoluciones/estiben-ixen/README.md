# Ejercicio 034 - triggers para garaje de motos

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **garaje de motos**. El proyecto implementa **triggers**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **triggers** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `propietarios_motos`
Almacena los datos de los propietarios de motocicletas.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_propietario` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del dueno |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre completo del propietario |
| `telefono` | `VARCHAR(20) NOT NULL` | Numero de contacto |
| `email` | `VARCHAR(60) NOT NULL UNIQUE` | Correo electronico |
| `estado` | `ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'` | Estado del cliente |

### Tabla Secundaria: `estacionamiento_motos`
Registra las entradas, salidas y espacios de parqueo ocupados.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_estacionamiento` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del registro |
| `placa` | `VARCHAR(20) NOT NULL UNIQUE` | Numero de placa de la moto |
| `modelo` | `VARCHAR(50) NOT NULL` | Marca y linea de la moto |
| `espacio_parqueo` | `VARCHAR(15) NOT NULL UNIQUE` | Codigo de bahia o espacio |
| `id_propietario` | `INT NOT NULL` | Llave foranea a propietarios |
| `costo_hora` | `DECIMAL(6,2) NOT NULL DEFAULT 5.00` | Tarifa horaria aplicada |
| `fecha_ingreso` | `DATETIME NOT NULL` | Momento de entrada al garaje |
| `estado` | `ENUM('Activo','Completado','Cancelado') DEFAULT 'Activo'` | Estado de estancia |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`propietarios_motos`, `estacionamiento_motos`) y los objetos programables o de rendimiento correspondientes a **triggers** (procedimientos, triggers, funciones, vistas o índices).

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

La implementación de **triggers** en el contexto de **garaje de motos** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
