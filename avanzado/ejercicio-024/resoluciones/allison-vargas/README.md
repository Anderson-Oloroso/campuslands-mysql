# Resolucion Ejercicio 024 - Bloqueos para Soldadura

**Desarrollado por:** Allison Vargas  
**Dificultad:** Avanzado Aplicado  
**Entorno:** MySQL 8.0  

## Aplicacion de Bloqueos y Manejo de Concurrencia
Para evitar condiciones de carrera (Race Conditions) durante la asignacion concurrente de electrodos e insumos en la planta:
1. `estaciones_soldadura`: Almacena el estado operativo de los puestos de soldadura.
2. `inventario_insumos`: Incluye stock disponible y control por tipo de material.
3. `asignacion_insumos`: Utiliza transacciones seguras mediante bloqueos pesimistas (`FOR UPDATE`) en el DML para garantizar la integridad del stock al momento del descuento.

## Orden de Ejecucion
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`
