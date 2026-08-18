# Ejercicio 054 - bloqueos para soldadura

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **soldadura**. El proyecto implementa **bloqueos**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **bloqueos** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `talleres_metalmecanicos`
Almacena plantas y talleres industriales de estructuras metalicas.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_taller` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del taller metalurgico |
| `nombre_taller` | `VARCHAR(70) NOT NULL UNIQUE` | Razon social |
| `ciudad` | `VARCHAR(50) NOT NULL` | Ciudad de la planta |
| `norma_calidad` | `ENUM('AWS D1.1','ASME Seccion IX','ISO 3834','API 1104') NOT NULL` | Norma de certificacion |

### Tabla Secundaria: `proyectos_soldadura`
Registra proyectos de union de metales, metodos de soldadura y pruebas de calidad.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_proyecto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la estructura soldada |
| `nombre_estructura` | `VARCHAR(80) NOT NULL` | Pieza o proyecto industrial |
| `id_taller` | `INT NOT NULL` | Taller que ejecuta la obra |
| `proceso_soldadura` | `ENUM('SMAW (Electrodo)','GMAW (MIG/MAG)','GTAW (TIG)','FCAW (Tubular)','SAW (Arco Sumergido)') NOT NULL` | Metodo de soldeo |
| `tipo_material` | `ENUM('Acero al Carbono ASTM A36','Acero Inoxidable 316L','Aluminio 6061','Titanio Grado 5') NOT NULL` | Metal base |
| `peso_toneladas` | `DECIMAL(8,2) NOT NULL` | Tonelaje de la estructura |
| `inspeccion_radiografica` | `ENUM('Aprobado','Con Defectos','Pendiente') DEFAULT 'Aprobado'` | Prueba NDT rayos X |
| `costo_total` | `DECIMAL(9,2) NOT NULL` | Costo en USD |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`talleres_metalmecanicos`, `proyectos_soldadura`) y los objetos programables o de rendimiento correspondientes a **bloqueos** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **bloqueos**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `bloqueos`
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

La implementación de **bloqueos** en el contexto de **soldadura** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
