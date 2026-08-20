# Ejercicio 021 - Normalización 1FN

## Descripción
Solución para la academia técnica enfocada en la gestión de obras de dibujo digital. Se aplicó la **Primera Forma Normal (1FN)** eliminando la dependencia de grupos repetidos (técnicas) dentro de la tabla principal, creando una relación de muchos a muchos mediante una tabla intermedia.

## Ejecución
1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Evidencia de Resultados

### Consulta 1: Relación de Obras y Técnicas
| titulo | nombre_tecnica |
| :--- | :--- |
| Cyberpunk City | Digital |
| Cyberpunk City | Vectorial |
| Retro Forest | Pixel Art |
| Abstract Soul | Acuarela |
| Dark Knight | Digital |
| Neon Dreams | Pixel Art |

### Consulta 2: Conteo de Obras por Técnica
| nombre_tecnica | total_obras |
| :--- | :--- |
| Digital | 2 |
| Pixel Art | 2 |
| Vectorial | 1 |
| Acuarela | 1 |

### Consulta 3: Obras con puntaje > 80
| titulo | puntaje_calidad |
| :--- | :--- |
| Cyberpunk City | 95.00 |
| Retro Forest | 88.50 |
| Dark Knight | 92.00 |

### Consulta 4: Promedio de Calidad por Técnica
| nombre_tecnica | promedio |
| :--- | :--- |
| Digital | 93.5000 |
| Pixel Art | 83.2500 |
| Vectorial | 95.0000 |
| Acuarela | 45.0000 |