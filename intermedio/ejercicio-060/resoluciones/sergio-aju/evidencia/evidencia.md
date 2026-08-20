# Solución Ejercicio 060 (Intermedio Retador) - Carga de Datos para Equipo de Streaming

## Descripción
Esta solución aborda el aprovisionamiento, carga estructurada (`DML`) y control de asignaciones de **Hardware para Streaming**. Garantiza integridad referencial entre marcas, categorías, creadores de contenido y equipos de alta gama.

## Estructura de Scripts
1. **`ddl/schema.sql`**: Define el esquema con relaciones relacionales (`FOREIGN KEY`) y validaciones mediante restricciones `CHECK` y tipos enumerados (`ENUM`).
2. **`dml/inserts.sql`**: Realiza la carga de datos realistas probando estados múltiples (`Disponible`, `Asignado`, `En Mantenimiento`).
3. **`dql/consultas.sql`**: Responde interrogantes operativas de costo, disponibilidades y asignaciones a creadores.

---

## Evidencia de Resultados

### Consulta 1: Inversión en Inventario por Marca
| nombre_marca | total_modelos_registrados | unidades_en_stock | inversion_total_usd |
|--------------|---------------------------|-------------------|---------------------|
| Logitech     | 1                         | 8                 | 1600.00             |
| Shure        | 2                         | 8                 | 2300.00             |
| Elgato       | 3                         | 12                | 1560.00             |
| Sony         | 1                         | 1                 | 900.00              |

### Consulta 2: Reporte de Asignaciones Activas
| streamer   | plataforma | equipo_asignado        | categoria                         | fecha_prestamo   |
|------------|------------|------------------------|-----------------------------------|------------------|
| GamerDavid | Kick       | Alpha 6400 Mirrorless  | Cámaras y Webcams                 | 2026-02-15 16:00 |
| DevSergi   | Twitch     | SM7B Dinámico Cardioide| Micrófonos                        | 2026-02-12 14:15 |
| TechMariana| YouTube    | Key Light Air Panel LED| Iluminación                       | 2026-02-11 11:00 |
| DevSergi   | Twitch     | Stream Deck MK.2 Black | Consolas de Mezcla y Stream Decks | 2026-02-10 09:30 |