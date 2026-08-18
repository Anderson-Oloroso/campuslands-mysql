# Ejercicio 056 - CTE para videojuego RPG

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **videojuego RPG**. El proyecto implementa **CTE**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **CTE** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

---

## Estructura de las Tablas

### Tabla Principal: `clases_personaje_rpg`
Almacena arquetipos y clases de combate del juego de rol.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_clase` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la clase |
| `nombre_clase` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del arquetipo |
| `atributo_principal` | `ENUM('Fuerza','Destreza','Inteligencia','Fe','Vitalidad') NOT NULL` | Estadistica clave |
| `rol_combate` | `ENUM('Tanque','DPS Fisico','DPS Magico','Sanador/Support') NOT NULL` | Campo rol_combate |

### Tabla Secundaria: `heroes_rpg`
Almacena heroes, niveles, puntos de vida/mana y oro acumulado.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_heroe` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del personaje |
| `nombre_heroe` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del avatar |
| `id_clase` | `INT NOT NULL` | Clase asignada |
| `nivel` | `INT NOT NULL DEFAULT 1` | Nivel de personaje (1-100) |
| `puntos_vida` | `INT NOT NULL` | Vida maxima HP |
| `puntos_mana` | `INT NOT NULL` | Mana disponible MP |
| `oro_acumulado` | `INT NOT NULL DEFAULT 0` | Monedas de oro |
| `gremio` | `VARCHAR(60) NOT NULL DEFAULT 'Sin Gremio'` | Clan al que pertenece |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Define las estructuras principales (`clases_personaje_rpg`, `heroes_rpg`) y los objetos programables o de rendimiento correspondientes a **CTE** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **CTE**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `CTE`
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

La implementación de **CTE** en el contexto de **videojuego RPG** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
