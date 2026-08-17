# Resolución Ejercicio 008 (Avanzado) - Roles y Permisos Fútbol Sala

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Descripción
Implementación de una arquitectura de Control de Acceso Basado en Roles (RBAC) para el módulo de fútbol sala, permitiendo auditar permisos de usuario, asignaciones de roles y restricciones de acceso.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de las tablas usuarios_futsal, oles, permisos y las relaciones intermedias ol_permisos y usuario_roles.
2. dml/inserts.sql: Carga de datos de prueba con 8 usuarios, 4 roles, 4 permisos y sus asignaciones.
3. dql/consultas.sql: 5 consultas relacionales para auditar permisos efectivos, matrices de acceso y conteos por rol.
