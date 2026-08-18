# Ejercicio 036 - EXPLAIN para autos hiperdeportivos

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **autos hiperdeportivos**. El proyecto implementa **EXPLAIN**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **EXPLAIN** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `fabricantes_autos`
Almacena marcas y fabricantes de vehiculos de ultra alto rendimiento.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_fabricante` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la marca constructora |
| `marca` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del fabricante |
| `pais_origen` | `VARCHAR(40) NOT NULL` | Pais de la sede principal |
| `fundacion` | `INT NOT NULL` | Ano de creacion de la marca |
| `estado` | `ENUM('Activo','Inactivo') DEFAULT 'Activo'` | Estado operativo |

### Tabla Secundaria: `autos_hiperdeportivos`
Almacena especificaciones, potencia, velocidad y precios de autos hiperdeportivos.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_auto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del vehiculo |
| `modelo` | `VARCHAR(70) NOT NULL` | Modelo del superauto |
| `id_fabricante` | `INT NOT NULL` | Llave foranea al fabricante |
| `caballos_fuerza` | `INT NOT NULL` | Potencia en CV/HP |
| `velocidad_max` | `DECIMAL(6,2) NOT NULL` | Velocidad punta en km/h |
| `precio_millones` | `DECIMAL(6,2) NOT NULL` | Precio en millones de USD |
| `tipo_motor` | `ENUM('V8 Twin-Turbo','V12 Atmosferico','W16 Quad-Turbo','Electrico Puro','Hibrido') NOT NULL` | Tipo de propulsor |
| `fecha_lanzamiento` | `DATE NOT NULL` | Fecha oficial de presentacion |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`fabricantes_autos`, `autos_hiperdeportivos`) y los objetos programables o de rendimiento correspondientes a **EXPLAIN** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **EXPLAIN**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `EXPLAIN`
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

La implementación de **EXPLAIN** en el contexto de **autos hiperdeportivos** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
