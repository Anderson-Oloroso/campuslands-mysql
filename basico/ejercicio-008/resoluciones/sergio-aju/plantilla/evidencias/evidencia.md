# Ejercicio 008: UPDATE para Fútbol Sala

## Descripción
Solución desarrollada en MySQL para el módulo de datos de una liga de fútbol sala, enfocada en la correcta aplicación de la sentencia `UPDATE` para modificar estados, estadísticas y penalizaciones de los equipos, manteniendo la integridad referencial y lógica.

## Decisiones Técnicas
- **Tipos de Datos:** Se emplearon tipos enteros sin signo (`INT UNSIGNED`) para asegurar que variables cuantitativas del deporte como puntos, goles o partidos nunca adopten valores negativos.
- **Restricciones (Constraints):** 
  - `chk_estado_sala`: Restringe los estados posibles del equipo a `Activo`, `Eliminado` o `Clasificado`.
  - `chk_puntos_sala`: Valida lógicamente que los puntos acumulados por un equipo no superen el máximo posible según los partidos disputados ($Partidos \times 3$).
- **Estructura Modular:** Los archivos se encuentran estrictamente divididos en carpetas por responsabilidad (`ddl`, `dml`, `dql`).

## Instrucciones de Ejecución
Ejecuta los scripts en tu gestor de bases de datos MySQL en el siguiente orden estricto:

1. **Esquema:**
   ```bash
   mysql -u root -p < ddl/schema.sql