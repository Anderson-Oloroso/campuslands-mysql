# Resolución Ejercicio 019 (Avanzado) - Triggers en Paracaidismo

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Disparadores Automatizados (TRIGGERS)**:
  * BEFORE INSERT: Validación de reglas de seguridad (altura >= 3000 pies).
  * AFTER INSERT: Actualización de saltos totales y horas de caída acumuladas.
  * AFTER UPDATE: Registro de historial de cambios de licencias en uditoria_licencias.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de tablas, restricciones y disparadores.
2. dml/inserts.sql: Carga de datos y pruebas de disparadores mediante INSERT y UPDATE.
3. dql/consultas.sql: Consultas analíticas y de auditoría.
