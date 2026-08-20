# Solución Ejercicio 056 (Intermedio Retador) - Videojuego RPG (Uso de CHECK)

## Descripción
Esta solución implementa la restricción **`CHECK`** en MySQL para asegurar el cumplimiento estricto de las reglas de negocio de un videojuego RPG.

### Validaciones CHECK Aplicadas:
1. **Atributos y Rangos**:
   - `nivel`: Entre 1 y 100.
   - `probabilidad_critico`: Entre 0.00% y 100.00%.
   - Atributos base (`fuerza`, `agilidad`, `inteligencia`): Entre 1 y 999.
2. **Lógica Coherente de Juego**:
   - `chk_hp_coherencia`: `puntos_vida_actual` no puede ser menor a 0 ni superar a `puntos_vida_max`.
   - `chk_mana_coherencia`: `puntos_mana_actual` no puede superar a `puntos_mana_max`.
3. **Economía e Inventario**:
   - Cantidad de items acumulados entre 1 y 99.
   - Precios y acumulado de oro mayores o iguales a 0.00.

## Instrucciones de Ejecución
1. Ejecutar `ddl/schema.sql` para construir las tablas con sus restricciones `CHECK`.
2. Ejecutar `dml/inserts.sql` para registrar las clases, jugadores e inventarios.
3. Ejecutar `dql/consultas.sql` para obtener los reportes analíticos de los jugadores.

---

## Evidencia de Resultados

### Consulta 1: Ranking Top 5 Personajes
| nombre_jugador  | nombre_clase           | nivel | total_atributos_base | probabilidad_critico | estado |
|-----------------|------------------------|-------|----------------------|----------------------|--------|
| Thorin_Ironwall | Guerrero de la Cruzada | 100   | 480                  | 10.00                | Activo |
| Valeria_Arcane  | Mago Arcano            | 92    | 420                  | 28.00                | Activo |
| Aron_Kael       | Guerrero de la Cruzada | 85    | 375                  | 12.50                | Activo |

### Consulta 3: Patrimonio Neto de Jugadores
| nombre_jugador  | oro_en_bolsa | items_distintos | total_objetos_poseidos | valor_inventario_oro | patrimonio_neto |
|-----------------|--------------|-----------------|------------------------|----------------------|-----------------|
| Thorin_Ironwall | 95000.00     | 2               | 2                      | 100000.00            | 195000.00       |
| Valeria_Arcane  | 48900.00     | 2               | 2                      | 93500.00             | 142400.00       |