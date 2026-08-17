# Resolucion Ejercicio 024 - DELETE Controlado para Soldadura

**Desarrollado por:** Allison Vargas  
**Dificultad:** Basico Aplicado  
**Entorno:** MySQL 8.0  

## Aplicacion de DELETE Controlado
Para mantener la integridad del catalogo de maquinaria y retirar equipos inoperativos o fuera de servicio:
1. `equipos_soldadura`: Contiene el inventario de soldadoras, estado operativo y kilometraje en horas.
2. **Criterios de Depuracion:** Se aplicaron clausulas `DELETE` filtradas estrictamente con `WHERE` combinando estado del equipo, horas de trabajo acumuladas y fechas limite de mantenimiento para evitar eliminaciones masivas accidentales.

## Orden de Ejecucion
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`
