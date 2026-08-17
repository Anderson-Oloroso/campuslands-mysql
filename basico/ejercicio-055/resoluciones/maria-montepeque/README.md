# Resolucion - Ejercicio 055 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `pruebas_lab_basico` para un laboratorio de formulas
quimicas y escribi seis consultas centradas en `COUNT` y `SUM`:
totales generales, agrupados por tipo de reaccion, por resultado, y un
conteo condicional con `CASE`.

## Decisiones tecnicas
- La consulta 5 usa `COUNT(CASE WHEN ... THEN 1 END)` para contar en
  una sola fila cuantas pruebas cayeron en cada resultado, en vez de
  tres consultas separadas.
- `CHECK (cantidad_muestras > 0)` y `CHECK (costo_reactivos > 0)` como
  restricciones minimas de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Total de pruebas registradas.
2. Cantidad de pruebas por tipo de reaccion.
3. Gasto total en reactivos.
4. Gasto en reactivos por resultado.
5. Pruebas exitosas, fallidas y en analisis (conteo condicional).
6. Total de muestras y pruebas por tipo de reaccion.
