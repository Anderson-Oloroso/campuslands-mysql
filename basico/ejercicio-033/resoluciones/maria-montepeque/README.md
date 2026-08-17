# Resolucion - Ejercicio 033 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `skins_basico` para un inventario de skins de shooter,
usando `codigo_skin` (un codigo de catalogo de 8 caracteres) como
`PRIMARY KEY`, en vez del clasico id autoincremental.

## Decisiones tecnicas
- `PRIMARY KEY (codigo_skin)`: clave natural, unica y con significado
  de negocio, ideal para practicar el concepto de `PRIMARY KEY` mas
  alla del autoincremental por defecto.
- `rareza ENUM(...)` como catalogo cerrado de rarezas del juego.
- `CHECK (precio > 0)` como restriccion minima.
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
3. Precio promedio por rareza.
4. Top 3 skins mas caras.
5. Skins de una coleccion especifica.
6. Skins con precio por debajo del promedio general.
