# Ejercicio 033 - funciones SQL para inventario de skins shooter

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **inventario de skins shooter**. El proyecto implementa **funciones SQL**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **funciones SQL** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `armas_shooter`
Almacena el catalogo base de armas del juego shooter.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_arma` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del arma base |
| `nombre` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del modelo de arma |
| `tipo` | `VARCHAR(40) NOT NULL` | Tipo de armamento (Rifle, Pistola, etc.) |
| `categoria` | `ENUM('Principal','Secundaria','Cuerpo a Cuerpo') NOT NULL` | Slot de equipamiento |
| `estado` | `ENUM('Disponible','Bloqueado') DEFAULT 'Disponible'` | Disponibilidad |

### Tabla Secundaria: `skins_inventario`
Almacena los camuflajes y skins en el inventario con sus rarezas y precios.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_skin` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico de la skin |
| `nombre_skin` | `VARCHAR(60) NOT NULL` | Nombre del diseno/skin |
| `id_arma` | `INT NOT NULL` | Llave foranea al arma |
| `rareza` | `ENUM('Consumer','Restricted','Classified','Covert','Contraband') NOT NULL` | Grado de rareza |
| `precio` | `DECIMAL(10,2) NOT NULL DEFAULT 0` | Valor estimado de mercado |
| `desgaste` | `ENUM('Recien Fabricado','Casi Nuevo','Algo Desgastado','Bastante Desgastado') NOT NULL` | Condicion visual |
| `fecha_adquisicion` | `DATE NOT NULL` | Fecha en que se obtuvo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`armas_shooter`, `skins_inventario`) y los objetos programables o de rendimiento correspondientes a **funciones SQL** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **funciones SQL**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `funciones SQL`
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

La implementación de **funciones SQL** en el contexto de **inventario de skins shooter** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
