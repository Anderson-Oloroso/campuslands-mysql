# Ejercicio 007: ORDER BY para Liga de Fútbol

## Descripción
Solución desarrollada en MySQL enfocada en el uso de la cláusula `ORDER BY` aplicada a una liga de fútbol, permitiendo ordenar clasificaciones por múltiples criterios (puntos, diferencia de goles, goles a favor) y generar reportes analíticos.

## Decisiones Técnicas
- **Tipos de Datos:** Se utilizaron enteros sin signo (`INT UNSIGNED`) para métricas deportivas lógicas (puntos, partidos, goles), evitando valores negativos inconsistentes.
- **Restricciones (Constraints):** 
  - `chk_estado`: Valida que el estado del equipo pertenezca estrictamente a `Activo`, `Suspendido` o `Descendido`.
  - `chk_partidos`: Restricción lógica para asegurar que los puntos de un equipo no superen el máximo matemático posible según sus partidos jugados.
- **Estructura Modular:** Los scripts siguen una separación estricta por carpetas (`ddl`, `dml`, `dql`).

## Instrucciones de Ejecución
Ejecuta los scripts en tu gestor de bases de datos MySQL en el siguiente orden estricto:

1. **Esquema:**
   ```bash
   mysql -u root -p < ddl/schema.sql