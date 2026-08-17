# Resolucion Ejercicio 023 - Roles y Permisos para Arquitectura 3D

**Desarrollado por:** Allison Vargas  
**Entorno:** MySQL 8.0  

## Aplicacion de Roles y Permisos
Para gestionar el acceso en los proyectos de arquitectura 3D se diseno un modelo relacional con control de acceso basado en roles (RBAC):
1. `roles`: Define los cargos y responsabilidades dentro de los proyectos (ej. Arquitecto Principal, Modelador 3D).
2. `usuarios`: Almacena el personal de la academia y su estado en el sistema.
3. `proyectos_arquitectura`: Contiene la informacion de las obras 3D, presupuestos y dimensiones.
4. `asignacion_roles`: Tabla intermedia que vincula los permisos especificos (lectura, escritura, administrador) de cada usuario sobre determinado proyecto.

## Instrucciones de Ejecucion
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`
