# Resolucion Ejercicio 024 - FOREIGN KEY para Soldadura

**Desarrollado por:** Allison Vargas  
**Dificultad:** Intermedio Aplicado  
**Entorno:** MySQL 8.0  

## Aplicacion de Integridad Referencial (FOREIGN KEY)
Para vincular el control de calidad NDT (Non-Destructive Testing) con el personal evaluador:
1. `inspectores`: Tabla independiente que consolida los datos de los inspectores certificados.
2. `inspecciones_calidad`: Tabla dependiente vinculada mediante `id_inspector` como `FOREIGN KEY`, previniendo registros huerfanos y garantizando la trazabilidad de los dictamenes sobre las juntas de soldadura.

## Orden de Ejecucion
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`
