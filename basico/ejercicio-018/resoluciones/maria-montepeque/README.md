# Resolucion - Ejercicio 018 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `destinos_basico` para un catalogo de destinos turisticos,
usando `codigo_destino` (un codigo de 3 letras estilo aeropuerto) como
`PRIMARY KEY`, en vez del clasico id autoincremental, para practicar el
diseño de una llave primaria con significado de negocio.

## Decisiones tecnicas
- `PRIMARY KEY (codigo_destino)`: clave natural, unica y no nula por
  definicion, ideal para practicar el concepto de PRIMARY KEY.
- `nombre UNIQUE` como restriccion adicional para no duplicar destinos.
- `CHECK (precio_paquete > 0)` y `CHECK (calificacion BETWEEN 0 AND 5)`
  como validaciones de negocio.
- Una subconsulta en la consulta 5 para comparar contra el precio
  promedio general.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo ordenado por PRIMARY KEY.
2. Busqueda directa por PRIMARY KEY.
3. Promedio de calificacion y precio por categoria.
4. Top 3 destinos mejor calificados.
5. Destinos con precio por debajo del promedio general.
6. Destinos de playa ordenados por precio.
