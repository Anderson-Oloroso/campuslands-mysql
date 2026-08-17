# Resolución Ejercicio 008 (Intermedio) - Normalización 3FN Fútbol Sala

**Estudiante:** Allison Vargas  
**Nivel:** Intermedio Inicial  

## Aplicación de Normalización 3FN
Se eliminaron las dependencias transitivas extrayendo las entidades independientes:
* **sedes_futsal_3fn**: Datos propios del recinto deportivo.
* **entrenadores_futsal_3fn**: Información y licencias técnicas.
* **equipos_futsal_3fn**: Contiene únicamente las claves foráneas hacia sedes y entrenadores.
* **partidos_futsal_3fn**: Registro de encuentros deportivos.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de la arquitectura relacional normalizada.
2. dml/inserts.sql: Carga masiva de datos respetando la integridad referencial.
3. dql/consultas.sql: 5 consultas relacionales avanzadas.
