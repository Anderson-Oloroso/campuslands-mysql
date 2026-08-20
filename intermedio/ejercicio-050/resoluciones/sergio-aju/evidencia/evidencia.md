# Solución Ejercicio 050 (Intermedio Retador) - Estudio de Tatuajes (Subconsultas)

## Descripción
Solución técnica que implementa subconsultas escalares, subconsultas en clausulas `WHERE` (`IN`, `NOT EXISTS`), subconsultas correlacionadas y tablas derivadas en la cláusula `FROM` para analizar indicadores del estudio de tatuajes.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para generar la base de datos y la estructura relacional de 4 tablas.
2. Ejecuta `dml/inserts.sql` para poblar la información de clientes, artistas, estilos y citas.
3. Ejecuta `dql/consultas.sql` para validar el funcionamiento de las subconsultas.

---

## Evidencia de Resultados

### Consulta 1: Citas finalizadas por encima del costo promedio ($486.43)
| cita_id | cliente        | tatuador      | estilo    | costo_total |
|---------|----------------|---------------|-----------|-------------|
| 8       | Diego Arriola  | Elena Navarro | Realismo  | 900.00      |
| 2       | Valeria Silva  | Elena Navarro | Realismo  | 750.00      |
| 4       | Carlos Mendoza | Elena Navarro | Realismo  | 600.00      |
| 7       | Valeria Silva  | Mateo Vargas  | Blackwork | 540.00      |

### Consulta 5: Estilos de tatuaje sin sesiones registradas
| estilo_id | nombre_estilo            | descripcion                                                           |
|-----------|--------------------------|-----------------------------------------------------------------------|
| 5         | Traditional / Old School | Símbolos clásicos con contornos negros marcados y colores primarios   |