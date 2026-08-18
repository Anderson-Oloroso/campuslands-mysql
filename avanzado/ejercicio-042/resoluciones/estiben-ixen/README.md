# Ejercicio 042 - window functions para playlist musical

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **playlist musical**. El proyecto implementa **window functions**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **window functions** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `artistas_musicales`
Almacena interpretes, bandas y solistas musicales.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_artista` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del artista |
| `nombre_artistico` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre comercial |
| `pais_origen` | `VARCHAR(40) NOT NULL` | Pais de nacimiento o base |
| `oyentes_mensuales` | `BIGINT NOT NULL DEFAULT 0` | Oyentes mensuales en streaming |
| `estado` | `ENUM('Activo','Pausa','Retirado') DEFAULT 'Activo'` | Campo estado |

### Tabla Secundaria: `canciones_playlist`
Almacena pistas de audio, generos, duracion y reproducciones de canciones.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_cancion` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del track |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo de la pista |
| `id_artista` | `INT NOT NULL` | Artista creador |
| `genero` | `ENUM('Rock','Pop','Electronica','Hip Hop','Reggaeton','Indie','Jazz') NOT NULL` | Genero musical |
| `duracion_segundos` | `INT NOT NULL` | Longitud del track en segundos |
| `reproducciones` | `BIGINT NOT NULL DEFAULT 0` | Streams totales acumulados |
| `bpm` | `INT NOT NULL DEFAULT 120` | Tempo en beats por minuto |
| `fecha_lanzamiento` | `DATE NOT NULL` | Fecha oficial de salida |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`artistas_musicales`, `canciones_playlist`) y los objetos programables o de rendimiento correspondientes a **window functions** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **window functions**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `window functions`
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

La implementación de **window functions** en el contexto de **playlist musical** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
