# Resolucion - Ejercicio 018 (Avanzado) - Selvin Lem

## Tematica
Viajes y turismo

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear viajes_turismo.
2. Ejecutar `dml/inserts.sql` para insertar 7 registros de prueba de paquetes turísticos.
3. Ejecutar `dql/consultas.sql` para correr las consultas con funciones SQL (de texto, formato de fechas, agregaciones y condicionales CASE).

## Entidad principal
- Tabla: viajes_turismo
- Atributos clave: nombre, categoria, puntaje, estado

## Restriccion aplicada
Uso de ENUM en estado ('activo','revision','inactivo') para controlar la disponibilidad de los paquetes turísticos y tipos de datos numéricos para tarifas y valoraciones.

## Caso limite incluido
Inclusión de paquetes turísticos costosos e inactivados (como cruceros y circuitos en revisión), filtrados en métricas operativas pero considerados en reportes de auditoría mediante funciones condicionales y de fecha.