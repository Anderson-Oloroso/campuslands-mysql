# Resolución Ejercicio 007 (Intermedio) - 2FN Liga de Fútbol

**Estudiante:** Allison Vargas  
**Nivel:** Intermedio Inicial  

## Descripción
Aplicación de la Segunda Forma Normal (2FN) eliminando las dependencias parciales sobre la clave compuesta (equipo_id, estadio_id), abstrayendo las entidades independientes estadios_liga y equipos_liga_intermedio.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de la base de datos campuslands_mysql, tablas de entidades independientes y la tabla asociativa en 2FN.
2. dml/inserts.sql: Inserción de 4 estadios, 4 equipos y 8 registros de rendimiento.
3. dql/consultas.sql: 5 consultas con JOIN relacionales, porcentajes de efectividad y agregaciones de goles.
