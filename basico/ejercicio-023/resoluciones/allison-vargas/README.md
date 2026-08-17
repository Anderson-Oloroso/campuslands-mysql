# Resolucion Ejercicio 023 - UPDATE para Arquitectura 3D

**Desarrollado por:** Allison Vargas  
**Dificultad:** Basico Aplicado  
**Entorno:** MySQL 8.0  

## Decisiones Tecnicas y Sentencias UPDATE
Se diseno la tabla `render_escenas` para catalogar proyectos de arquitectura 3D. Sobre los datos base se aplicaron las siguientes sentencias `UPDATE`:
1. **Cambio de Estado:** Paso de estado `revisado` a `publicado`.
2. **Ajuste de Precios:** Incremento del 15% sobre modelos de alta densidad geometrica (> 800k poligonos).
3. **Control de Flujo:** Actualizacion selectiva de estado a `revisado` segun el autor del proyecto.

## Orden de Ejecucion
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`
