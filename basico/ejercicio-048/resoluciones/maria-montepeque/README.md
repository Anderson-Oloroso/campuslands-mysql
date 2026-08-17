# Resolucion - Ejercicio 048 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `paquetes_turisticos_basico` para el catalogo de una
agencia de viajes, usando `codigo_paquete` (un codigo de catalogo de 8
caracteres) como `PRIMARY KEY`, en vez del clasico id autoincremental.

## Decisiones tecnicas
- `PRIMARY KEY (codigo_paquete)`: clave natural, unica y con
  significado de negocio, ideal para practicar el concepto de
  `PRIMARY KEY` mas alla del autoincremental por defecto.
- `categoria ENUM(...)` como catalogo cerrado de tipos de viaje.
- `CHECK (precio > 0)` y `CHECK (duracion_dias > 0)` como
  restricciones minimas.
- La consulta 6 usa una subconsulta para comparar contra el precio
  promedio general del catalogo.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Catalogo completo ordenado por PRIMARY KEY.
2. Busqueda directa por PRIMARY KEY.
3. Precio promedio por categoria.
4. Top 3 paquetes mas caros.
5. Paquetes de un destino especifico.
6. Paquetes con precio por debajo del promedio general.
