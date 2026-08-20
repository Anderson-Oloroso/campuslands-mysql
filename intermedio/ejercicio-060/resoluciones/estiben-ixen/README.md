# Ejercicio 060 - carga de datos para equipo de streaming

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **equipo de streaming**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **carga de datos**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **carga de datos** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `canales_streamers` y `dispositivos_setup` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `canales_streamers` y posteriormente en `dispositivos_setup`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **carga de datos**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `carga de datos`
- `INNER JOIN` y `LEFT JOIN`
- `GROUP BY` y cláusula `HAVING`
- Subconsultas escalares y correlacionadas

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` (creación de base de datos, tablas y restricciones).
2. Ejecutar `dml/inserts.sql` (poblado de tablas respetando la jerarquía relacional).
3. Ejecutar `dql/consultas.sql` (validación de reportes y consultas intermedias).

---

## Conclusión

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **carga de datos** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **equipo de streaming**.
