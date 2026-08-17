# Resolucion - Ejercicio 022 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `renders_basico` para los renders de un estudio de
animacion 3D y escribi seis consultas centradas en `ORDER BY`: orden
simple ascendente y descendente, orden por varias columnas, orden por
una expresion calculada y orden logico personalizado con `FIELD()`.

## Decisiones tecnicas
- La consulta 6 usa `ORDER BY FIELD(resolucion, '720p', '1080p', '2K',
  '4K', '8K')` porque el orden alfabetico de esos valores no coincide
  con el orden real de calidad (`'1080p'` quedaria antes que `'4K'`
  alfabeticamente, pero en calidad va despues). `FIELD()` permite
  definir el orden logico exacto.
- `CHECK (tiempo_render_min > 0)` y
  `CHECK (calidad_puntaje BETWEEN 0 AND 10)` como restricciones minimas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Renders ordenados por calidad descendente.
2. Renders ordenados por tiempo ascendente.
3. Orden por motor de render y luego por calidad.
4. Orden por una expresion calculada (horas de render).
5. Top 3 renders con mejor calidad.
6. Orden logico de resolucion con `FIELD()`.
