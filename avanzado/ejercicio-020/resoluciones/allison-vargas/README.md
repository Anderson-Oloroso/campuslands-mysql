# Resolución Ejercicio 020 (Avanzado) - Índices en Estudio de Tatuajes

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Índices de Rendimiento (INDEX)**:
  * idx_citas_fecha: Optimización de rangos de búsqueda en agendas.
  * idx_citas_estado: Aceleración de filtros por estado de trabajo.
  * idx_tatuador_estado: Índice compuesto para reportes operacionales por tatuador.
  * idx_estilo_monto: Índice compuesto para búsquedas comerciales y presupuestos.
* **Diagnóstico de Consultas**: Verificación del plan de ejecución mediante EXPLAIN.

## Estructura de Ejecución
1. ddl/schema.sql: Creación del esquema con índices explícitos.
2. dml/inserts.sql: Carga de tatuadores y citas agendadas.
3. dql/consultas.sql: Consultas optimizadas con diagnóstico EXPLAIN.
