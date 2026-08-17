# Resolución Ejercicio 009 (Avanzado) - Bloqueos en Kickboxing

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
Demostración práctica de gestión de concurrencia y control de transacciones en MySQL:
* **LOCK TABLES ... WRITE / READ**: Bloqueos explícitos a nivel de tabla durante inserciones críticas de apuestas.
* **FOR UPDATE**: Bloqueo pesimista a nivel de fila para evitar condiciones de carrera al cambiar el estado de una pelea.
* **FOR SHARE / LOCK IN SHARE MODE**: Bloqueo compartido para lectura consistente durante procesos de auditoría.

## Estructura de Ejecución
1. ddl/schema.sql: Creación del esquema relacional para peleadores, eventos y apuestas.
2. dml/inserts.sql: Inserción de peleadores y transacciones bajo LOCK TABLES.
3. dql/consultas.sql: Consultas transaccionales con FOR UPDATE y reportes agregados.
