# Resolucion del ejercicio 021 - WHERE en dibujo digital

**Estudiante:** Selvin Lem  
**Nivel:** Basico aplicado

## Objetivo

Modelar proyectos de dibujo digital y practicar filtros con `WHERE` usando datos de estado, categoria, precio, horas estimadas y fecha de entrega.

## Estructura

```text
selvin-lem/
├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql
```

## Proceso de ejecucion

Ejecutar los archivos en este orden:

1. `ddl/schema.sql`: crea la base `campuslands_mysql` y la tabla `proyectos_dibujo_021`.
2. `dml/inserts.sql`: inserta 10 proyectos de dibujo digital.
3. `dql/consultas.sql`: ejecuta seis consultas con filtros `WHERE`.

Los archivos deben ejecutarse desde un cliente compatible con MySQL, respetando el orden indicado. Antes de iniciar, es necesario contar con un servidor MySQL activo y con permisos para crear la base de datos y la tabla.

## Decisiones tecnicas

- Se usa `DECIMAL(10,2)` para conservar precision en el precio.
- El campo `estado` usa `ENUM` para limitar sus valores a `borrador`, `revision`, `aprobado` o `archivado`.
- La restriccion `CHECK` mantiene el precio y las horas estimadas dentro de rangos validos.
- Los registros cubren varias categorias y estados para comprobar filtros normales y combinados.
