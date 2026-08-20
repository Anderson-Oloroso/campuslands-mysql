# Ejercicio 060 - optimizacion para equipo de streaming

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **equipo de streaming**. El proyecto implementa **optimizacion**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **optimizacion** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `canales_streamers`
Almacena streamers y creadores de contenido digital.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_streamer` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del creador |
| `nickname` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del canal |
| `plataforma_principal` | `ENUM('Twitch','YouTube Gaming','Kick','Facebook Gaming') NOT NULL` | Plataforma |
| `seguidores` | `INT NOT NULL DEFAULT 0` | Audiencia total registrada |

### Tabla Secundaria: `dispositivos_setup`
Almacena camaras, microfonos, interfaces, capturadoras y equipos de setup de transmision.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_dispositivo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del hardware |
| `nombre_hardware` | `VARCHAR(80) NOT NULL` | Modelo del equipo |
| `id_streamer` | `INT NOT NULL` | Streamer propietario |
| `tipo_dispositivo` | `ENUM('Camara / Lente','Microfono XLR','Interfaz de Audio','Capturadora de Video','Controlador / Stream Deck','Iluminacion KeyLight') NOT NULL` | Tipo de hardware |
| `marca` | `VARCHAR(50) NOT NULL` | Fabricante |
| `precio_usd` | `DECIMAL(7,2) NOT NULL` | Costo de adquisicion |
| `puerto_conexion` | `ENUM('USB-C','XLR','HDMI 2.1','PCIe','Wi-Fi') NOT NULL` | Interfaz de enlace |
| `estado` | `ENUM('En Uso','Repuesto','Danado') DEFAULT 'En Uso'` | Campo estado |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`canales_streamers`, `dispositivos_setup`) y los objetos programables o de rendimiento correspondientes a **optimizacion** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **optimizacion**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `optimizacion`
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

La implementación de **optimizacion** en el contexto de **equipo de streaming** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
