# Resolucion - Ejercicio 016 (Avanzado) - Selvin Lem

## Tematica
Transacciones para restaurante de comida urbana

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear la base de datos `campuslands_mysql` y la tabla `avanzado_ejercicio_016` asegurando el motor InnoDB.
2. Ejecutar `dml/inserts.sql` para simular la inserción transaccional de platillos, aplicando bloque de confirmación (`COMMIT`), reversión (`ROLLBACK`) y uso de `SAVEPOINT`.
3. Ejecutar `dql/consultas.sql` para calcular indicadores clave de menú, distribución por categorías y promedios por estado.

## Entidad principal
- Tabla: `avanzado_ejercicio_016`
- Atributos clave: `nombre` (descripción del platillo/combo), `categoria` (clasificación urbana), `puntaje` (monto/calificación de venta), `estado` (flujo de disponibilidad del producto).

## Restriccion aplicada
Uso del motor transactional `InnoDB` para garantizar ACID. Restricción `CHECK` (`chk_puntaje_positivo`) que valida que `puntaje >= 0.00` y `ENUM` estricto en el atributo `estado` ('activo', 'revision', 'inactivo').

## Caso limite incluido
Manejo explícito de un bloque transaccional fallido con `ROLLBACK` para evitar la persistencia de registros inconsistentes (datos erróneos en revisión/inactivos) y asegurar que los datos agregados (`AVG`, `SUM`) reflejen únicamente transacciones validadas en el sistema.