# Ejercicio 020 - indices para estudio de tatuajes

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **estudio de tatuajes**. El proyecto implementa **indices**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **indices** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `artistas_tatuadores`
Almacena tatuadores profesionales con sus estilos insignia.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_artista` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del tatuador |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del artista |
| `apodo` | `VARCHAR(40) NOT NULL UNIQUE` | Nombre artistico |
| `estilo_principal` | `ENUM('Realismo Black & Grey','Neotradicional','Japones Tradicional (Irezumi)','Microrealismo','Lettering','Blackwork') NOT NULL` | Especialidad |
| `tarifa_por_hora` | `DECIMAL(6,2) NOT NULL DEFAULT 80.00` | Precio horario USD |

### Tabla Secundaria: `citas_tatuajes`
Registra citas de tatuajes, tamano, horas de sesion y precios.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_cita` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la sesion |
| `cliente` | `VARCHAR(80) NOT NULL` | Nombre del cliente |
| `id_artista` | `INT NOT NULL` | Tatuador elegido |
| `zona_cuerpo` | `ENUM('Brazo','Espalda','Pecho','Pierna','Costillas','Cuello','Mano') NOT NULL` | Ubicacion corporal |
| `horas_sesion` | `DECIMAL(4,2) NOT NULL` | Duracion en horas |
| `costo_total` | `DECIMAL(8,2) NOT NULL` | Valor total pagado |
| `estado` | `ENUM('Confirmada','Completada','Cancelada') DEFAULT 'Completada'` | Estado |
| `fecha_cita` | `DATE NOT NULL` | Fecha de realizacion |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`artistas_tatuadores`, `citas_tatuajes`) y los objetos programables o de rendimiento correspondientes a **indices** (procedimientos, triggers, funciones, vistas o índices).

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

La implementación de **indices** en el contexto de **estudio de tatuajes** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
