# Resolucion - Ejercicio 036 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `hiperdeportivos_basico` para un concesionario de autos
hiperdeportivos y escribi seis `SELECT` centrados en `WHERE`:
igualdad, combinacion con `AND`, `IN`, `BETWEEN` y `OR` junto con
`LIKE`.

## Decisiones tecnicas
- `estado ENUM(...)` para el ciclo de vida del auto en el
  concesionario.
- `CHECK (precio > 0)` y `CHECK (potencia_hp > 0)` como restricciones
  minimas de negocio.
- Cada consulta usa una combinacion distinta de condiciones en el
  `WHERE` para cubrir varias formas de filtrar.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Autos disponibles.
2. Autos de una marca especifica.
3. Autos con mas de 1000 hp que no esten vendidos (`AND`).
4. Autos de Ferrari o Lamborghini (`IN`).
5. Autos con precio en un rango (`BETWEEN`).
6. Autos con velocidad alta o "GT" en el modelo (`OR` + `LIKE`).
