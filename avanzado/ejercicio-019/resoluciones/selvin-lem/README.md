# Resolucion - Ejercicio 019 (Avanzado) - Selvin Lem

## Tematica
Paracaidismo

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear la tabla paracaidismo y el trigger `trg_paracaidismo_validar_estado`.
2. Ejecutar `dml/inserts.sql` para insertar 7 registros de prueba.
3. Ejecutar `dql/consultas.sql` para validar el funcionamiento del trigger, filtros por estado, COUNT y AVG.

## Entidad principal
- Tabla: paracaidismo
- Atributos clave: nombre, categoria, puntaje, estado

## Restriccion aplicada
Trigger `trg_paracaidismo_validar_estado` para cambiar de forma automática el campo `estado` a `'revision'` cuando el `puntaje` sea inferior a 40.00, además del `ENUM` en estado ('activo','revision','inactivo').

## Caso limite incluido
Inserción de saltos especializados con puntaje de evaluación bajo (< 40.00), los cuales son capturados por el trigger previo a la inserción para asegurar que no ingresen como 'activo' sin verificación de seguridad previa.