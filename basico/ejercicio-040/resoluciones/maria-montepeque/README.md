# Resolucion - Ejercicio 040 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `corredores_basico` para una serie de carreras urbanas y
escribi seis consultas centradas en `COUNT` y `SUM`: totales
generales, agrupados por categoria, por resultado, y un conteo
condicional con `CASE`.

## Decisiones tecnicas
- La consulta 5 usa `COUNT(CASE WHEN ... THEN 1 END)` para contar en
  una sola fila cuantos corredores cayeron en cada resultado, en vez
  de tres consultas separadas.
- `CHECK (tiempo_minutos > 0)` y `CHECK (costo_inscripcion > 0)` como
  restricciones minimas de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Total de corredores registrados.
2. Cantidad de corredores por categoria.
3. Total recaudado en inscripciones.
4. Recaudo por categoria.
5. Corredores finalizados, con abandono y descalificados (conteo condicional).
6. Total de corredores y tiempo acumulado por categoria.
