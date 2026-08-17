# Resolucion - Ejercicio 031 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `equipos_moba_basico` para un torneo de esports MOBA,
con los datos tipicos de una tabla de posiciones: region, ranking,
victorias, derrotas y fecha de fundacion.

## Decisiones tecnicas
- `region ENUM(...)` como catalogo cerrado de las regiones habituales
  en esports competitivos.
- `CHECK (ranking_actual > 0)`, `CHECK (victorias >= 0)` y
  `CHECK (derrotas >= 0)` como restricciones minimas de negocio.
- La consulta 3 calcula el porcentaje de victorias con una division
  directa (`victorias / (victorias + derrotas)`), sin necesitar una
  columna adicional para ese dato derivado.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Tabla de posiciones ordenada por ranking.
2. Equipos de la region LATAM.
3. Porcentaje de victorias por equipo.
4. Cantidad de equipos por region.
5. Top 3 equipos mejor ubicados en el ranking.
6. Equipos fundados antes de 2020.
