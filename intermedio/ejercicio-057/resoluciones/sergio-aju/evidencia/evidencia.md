# Solución Ejercicio 057 (Intermedio Retador) - Videojuego de Acción y Aventura

## Descripción
Esta solución presenta la estructura relacional y los scripts SQL necesarios para generar un módulo de reportes analíticos para un videojuego de acción y aventura.

### Objetivos Técnicos Cubiertos:
- **Restricciones DDL**: Uso de `CHECK` para validar rangos de nivel, horas de juego y valores no negativos en recompensas y precios.
- **Relaciones Normalizadas**: Integración de tablas de unión (`bitacora_misiones`, `inventario_jugador`) con claves foráneas en cascada.
- **Reportes Analíticos DQL**:
  1. Ranking de eficiencia de exploradores (XP/Hora).
  2. Tasa de éxito por región utilizando agregación condicional (`CASE WHEN`).
  3. Recompensas acumuladas con filtro de grupo (`HAVING`).
  4. Valor patrimonial total de inventarios.
  5. Análisis de dificultad real en misiones principales y jefes.

## Instrucciones de Ejecución
1. Ejecutar `ddl/schema.sql` para instanciar la base de datos y la estructura.
2. Ejecutar `dml/inserts.sql` para poblar los registros de prueba.
3. Ejecutar `dql/consultas.sql` para obtener los reportes requeridos.

---

## Evidencia de Resultados

### Consulta 1: Top 5 Exploradores por Eficiencia (XP/Hora)
| nickname      | nivel_explorador | puntos_experiencia | horas_jugadas | xp_por_hora | monedas_oro |
|---------------|------------------|--------------------|---------------|-------------|-------------|
| Valkyrie_Pro  | 82               | 340000             | 280.00        | 1214.29     | 48900.50    |
| Titan_Breaker | 95               | 480000             | 410.00        | 1170.73     | 92000.00    |
| Astra_Hunter  | 64               | 210000             | 195.80        | 1072.52     | 23400.75    |
| Nyx_Explorer  | 52               | 160000             | 142.30        | 1124.38     | 18250.25    |
| ShadowRunner  | 45               | 125000             | 120.50        | 1037.34     | 14500.00    |

### Consulta 3: Desempeño y Recompensas por Misiones
| nickname      | misiones_superadas | total_exp_ganada_misiones | total_oro_ganado_misiones | tiempo_promedio_mision_min |
|---------------|--------------------|---------------------------|---------------------------|----------------------------|
| Titan_Breaker | 2                  | 24500                     | 9200.00                   | 45.00                      |
| Valkyrie_Pro  | 2                  | 23000                     | 8500.00                   | 45.00                      |
| ShadowRunner  | 3                  | 5800                      | 1200.00                   | 26.67                      |