# Resoluci�n Ejercicio 022 - ORDER BY para Animaci�n 3D

**Desarrollado por:** Allison Vargas  
**Entorno:** MySQL 8.0  

## Descripci�n del Problema
Este m�dulo gestiona los procesos de renderizado 3D de una academia, permitiendo ordenar los proyectos segun tiempos de procesamiento, consumo en granjas de render (costo USD) y eficiencia de fotogramas por segundo.

## Decisiones T�cnicas
- **Uso de ORDER BY:** Se ordenaron consultas num�ricas y alfabeticas utilizando criterios simples y multiples (`ORDER BY columna1 ASC, columna2 DESC`).
- **Campos calculados:** Se calcula el costo/tiempo por frame ordenandolo de forma ascendente para detectar los renders mas eficientes.
- **Estructura DDL:** Uso de restricciones `CHECK` para validar tiempos y cantidad de frames positivos.

## Instrucciones de Ejecuci�n
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`

