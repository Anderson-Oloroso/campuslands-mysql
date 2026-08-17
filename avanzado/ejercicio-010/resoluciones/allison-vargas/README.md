# Resolución Ejercicio 010 (Avanzado) - Backup Lógico para Carreras Urbanas

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Backup Lógico (mysqldump)**: Documentación de comandos CLI para exportar/importar esquemas completos, solo estructuras (--no-data) o rutinas (--routines).
* **Diseño Relacional Optimizado**: Estructura modular en 3FN con claves foráneas en cascada (ON DELETE CASCADE) para soportar volcados limpios.

## Estructura de Ejecución
1. ddl/schema.sql: Definición de esquemas relacionales.
2. dml/inserts.sql: Carga de datos iniciales.
3. dql/consultas.sql: Consultas analíticas y comandos documentados de backup y restauración.
