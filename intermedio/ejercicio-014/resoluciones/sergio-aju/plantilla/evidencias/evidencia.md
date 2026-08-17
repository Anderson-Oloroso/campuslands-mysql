# Resolución Ejercicio 014 - Vistas Simples (Saga de Ciencia Ficción)

**Autor:** Sergio Miranda Ajú
**Fecha:** Julio 2026

## Descripción del Proyecto
Solución del módulo intermedio para practicar vistas en MySQL. El escenario elegido modela personajes de una saga de ciencia ficción, rastreando su afiliación, poder de combate y estado actual. 

## Decisiones Técnicas
- **Estructura de Datos:** Se implementó `DECIMAL(10,2)` para `poder_combate` garantizando precisión en los promedios. Se utilizó un `ENUM` para `estado` ('vivo', 'fallecido', 'desaparecido', 'capturado') restringiendo errores de inserción de datos sucios.
- **Vistas:** Se separó la lógica de agregación (promedios por afiliación) y de filtrado lógico (personajes vivos vs bajas) en distintas vistas (`CREATE OR REPLACE VIEW`) para evitar código espagueti y repetición en los reportes diarios.

## Ejecución
Asegúrate de ejecutar los scripts en este orden exacto desde tu gestor de base de datos o terminal:
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`