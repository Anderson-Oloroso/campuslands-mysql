# Resolución Ejercicio 009 (Intermedio) - Foreign Keys en Kickboxing

**Estudiante:** Allison Vargas  
**Nivel:** Intermedio Inicial  

## Conceptos Aplicados
* **FOREIGN KEY (Clave Foránea)**: Definición de relaciones padre-hijo entre dojos_kickboxing y practicantes_kickboxing.
* **Integridad Referencial**: Uso de ON DELETE RESTRICT para proteger registros de dojos activos y ON UPDATE CASCADE para mantener sincronización automática.
* **Consultas Relacionales**: Análisis multinivel utilizando INNER JOIN y LEFT JOIN con agrupaciones (GROUP BY).

## Estructura de Ejecución
1. ddl/schema.sql: Creación de la arquitectura relacional con restricciones explícitas.
2. dml/inserts.sql: Carga de datos de dojos y practicantes en orden de dependencia.
3. dql/consultas.sql: 5 consultas analíticas con uniones relacionales.
