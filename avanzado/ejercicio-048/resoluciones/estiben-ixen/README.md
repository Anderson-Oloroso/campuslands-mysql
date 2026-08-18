# Ejercicio 048 - funciones SQL para viajes y turismo

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **viajes y turismo**. El proyecto implementa **funciones SQL**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **funciones SQL** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `destinos_turisticos`
Almacena paises, regiones y ciudades turisticas del mundo.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_destino` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del destino |
| `ciudad` | `VARCHAR(50) NOT NULL` | Ciudad turistica |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de ubicacion |
| `continente` | `ENUM('America','Europa','Asia','Africa','Oceania') NOT NULL` | Continente |
| `clima` | `ENUM('Tropical','Templado','Frio','Desertico') NOT NULL` | Campo clima |

### Tabla Secundaria: `paquetes_turisticos`
Almacena tours, experiencias y paquetes vacacionales organizados.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_paquete` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del paquete |
| `nombre_paquete` | `VARCHAR(90) NOT NULL` | Nombre del tour |
| `id_destino` | `INT NOT NULL` | Destino principal |
| `duracion_dias` | `INT NOT NULL` | Cantidad de noches y dias |
| `precio_por_persona` | `DECIMAL(8,2) NOT NULL` | Precio en USD |
| `cupos_maximos` | `INT NOT NULL` | Capacidad por grupo |
| `nivel_dificultad` | `ENUM('Facil','Moderado','Exigente') DEFAULT 'Facil'` | Exigencia fisica |
| `incluye_vuelo` | `ENUM('Si','No') DEFAULT 'Si'` | Campo incluye_vuelo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`destinos_turisticos`, `paquetes_turisticos`) y los objetos programables o de rendimiento correspondientes a **funciones SQL** (procedimientos, triggers, funciones, vistas o índices).

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

La implementación de **funciones SQL** en el contexto de **viajes y turismo** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
