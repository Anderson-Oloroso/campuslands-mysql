# Solución Ejercicio 020 (Intermedio) - Estudio de Tatuajes (Subconsultas)

## Descripción
Solución del ejercicio intermedio enfocado en la aplicación de **Subconsultas en MySQL** (`IN`, subconsultas escalares en `WHERE` y subconsultas correlacionadas en `SELECT`) para responder preguntas de negocio analíticas en un estudio de tatuajes.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear las tablas `tatuadores` y `citas_tatuajes`.
2. Ejecuta `dml/inserts.sql` para poblar los registros iniciales.
3. Ejecuta `dql/consultas.sql` para validar los reportes basados en subconsultas.

---

## Evidencia de Resultados

### Consulta 1: Citas con costo superior al promedio general ($251.43)
| cita_id | cliente       | estilo_diseno     | costo_total | promedio_general |
|---------|---------------|-------------------|-------------|------------------|
| 1       | Andrea Gómez  | Realismo Rostro   | 375.00      | 251.43           |
| 2       | Fernando Ruiz | Realismo Leandros | 300.00      | 251.43           |
| 7       | Mariana López | Realismo Tigre    | 450.00      | 251.43           |

### Consulta 4: Total de citas completadas por tatuador (Subconsulta en SELECT)
| nombre               | especialidad                | total_citas_completadas |
|----------------------|-----------------------------|-------------------------|
| Carlos "Ink" Mendoza | Realismo B&G                | 3                       |
| Valeria Silva        | Neotradicional / Fine Line  | 2                       |
| Diego Arriola        | Traditional / Old School    | 2                       |