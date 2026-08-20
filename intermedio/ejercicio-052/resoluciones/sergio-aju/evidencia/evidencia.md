# Solución Ejercicio 052 (Intermedio Retador) - Animación 3D (Normalización 2FN)

## Descripción
Esta solución aplica los conceptos de la **Segunda Forma Normal (2FN)** en un entorno de **Animación 3D**. 

Para cumplir 2FN:
1. El esquema garantiza la **Primera Forma Normal (1FN)** eliminando listas o atributos atómicos repetidos.
2. Se eliminan las **dependencias parciales**: Atributos como el nombre del motor de render, desarrollador, tipo de licencia o costo de la misma no dependen parcialmente de la clave compuesta de la tabla de renders, sino que se extraen a una entidad independiente `motores_render`.
3. La tabla `asignaciones_render` solo conserva métricas numéricas (`horas_computo_render`, `cuadros_renderizados`, `puntuacion_calidad`) que dependen al 100% de la clave primaria compuesta (`escena_id`, `animador_id`, `motor_id`).

## Instrucciones de Ejecución
1. Ejecuta `ddl/schema.sql` para construir las tablas y las restricciones de clave foránea.
2. Ejecuta `dml/inserts.sql` para registrar animadores, motores, proyectos, escenas y métricas de render.
3. Ejecuta `dql/consultas.sql` para verificar la integridad y los reportes de rendimiento.

---

## Evidencia de Resultados

### Consulta 2: Rendimiento y calidad agrupada por Motor de Render
| nombre_engine   | licencia    | total_escenas_procesadas | total_horas_render | calidad_promedio |
|-----------------|-------------|--------------------------|--------------------|------------------|
| Redshift        | Suscripción | 4                        | 123.50             | 9.25             |
| Autodesk Arnold | Suscripción | 2                        | 27.50              | 9.00             |
| Blender Cycles  | Open Source | 3                        | 38.50              | 8.33             |

### Consulta 3: Rendimiento de producción de cuadros por hora
| titulo_proyecto                     | cliente          | total_escenas | total_cuadros | total_horas_invertidas | rendimiento_cuadros_por_hora |
|-------------------------------------|------------------|---------------|---------------|------------------------|------------------------------|
| COMERCIAL: Auto Concepto Neon 2027  | CyberDrive Inc   | 2             | 3600          | 40.00                  | 90.00                        |
| CINEMÁTICA: Mech Warrior Odyssey    | GameVerse Studio | 2             | 1800          | 58.00                  | 31.03                        |