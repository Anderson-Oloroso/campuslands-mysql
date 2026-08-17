# Resolución Ejercicio 015 - Carga de Datos (Biblioteca Gamer)

**Autor:** Sergio Miranda Ajú
**Fecha:** Julio 2026

## Descripción del Proyecto
Resolución del módulo intermedio enfocada en la correcta carga de datos (DML) y diseño de consultas en MySQL. Se modeló una biblioteca de videojuegos para rastrear títulos, tiempos de juego e inversión económica.

## Decisiones Técnicas
- **Tipado de Datos:** Se utilizó `DECIMAL(8,2)` para los precios para simular transacciones reales, `DATE` para las adquisiciones y un `ENUM` para el estado (`completado`, `jugando`, `pendiente`, `abandonado`) garantizando la consistencia de los datos.
- **Carga de Datos (Bulk Insert):** Se optó por agrupar los registros en una sola sentencia `INSERT` dentro de `inserts.sql`, mejorando el rendimiento de carga frente a realizar inserciones individuales.
- **Consultas (DQL):** Se implementaron alias claros (`AS`) y funciones matemáticas (`SUM`, `ROUND`, `AVG`) para extraer KPIs útiles, como la inversión total, el *backlog* y un cálculo avanzado del costo por hora jugada.

## Instrucciones de Ejecución
Ejecutar estrictamente en este orden:
1. `ddl/schema.sql` (Crea DB y estructura)
2. `dml/inserts.sql` (Puebla los registros iniciales)
3. `dql/consultas.sql` (Ejecuta los reportes y filtros)