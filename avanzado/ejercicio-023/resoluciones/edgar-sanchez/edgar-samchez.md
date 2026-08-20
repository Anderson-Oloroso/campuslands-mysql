## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **Fecha de ejecución:** 18/08/2026
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo implementa el control de acceso granular mediante la **Gestión de Roles y Permisos (DCL - Data Control Language)** en MySQL para un Estudio de Arquitectura 3D. La solución define un esquema de seguridad basado en principios de mínimo privilegio, distribuyendo perfiles de usuario jerárquicos (Director, Arquitecto Senior y Cliente Visor) para proteger la integridad de los proyectos, presupuestos y entregables de renderizado.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL y DCL:**
    - Inclusión de sentencias `DROP TABLE IF EXISTS` en orden inverso a la jerarquía de claves foráneas (`revisiones_render` $\rightarrow$ `renders_arquitectonicos` $\rightarrow$ `proyectos_arquitectura` $\rightarrow$ `clientes_estudio` / `arquitectos_3d`) para garantizar ejecuciones repetibles.
    - Eliminación e inicialización limpia de roles (`DROP ROLE IF EXISTS`) y usuarios (`DROP USER IF EXISTS`).
*   **Seguridad Basada en Roles (RBAC):**
    - `rol_director_estudio`: Posee permisos administrativos completos (`ALL PRIVILEGES`) con facultad de delegación (`WITH GRANT OPTION`) para la administración total del servidor de base de datos.
    - `rol_arquitecto_senior`: Permite consultar, insertar y actualizar proyectos, vistas y revisiones (`SELECT`, `INSERT`, `UPDATE`), restringiendo la capacidad de eliminación destructiva (`DELETE`).
    - `rol_cliente_visor`: Otorga acceso exclusivo de solo lectura (`SELECT`) a las tablas de avance y revisiones de renderizado para clientes externos.
*   **Asignación de Usuarios y Roles Predeterminados:**
    - Creación de usuarios autenticados para cada perfil operativo y asignación mediante `GRANT <rol> TO <usuario>`.
    - Configuración de `SET DEFAULT ROLE ALL` para asegurar que el usuario active automáticamente los privilegios otorgados al iniciar sesión sin necesidad de ejecutar `SET ROLE`.
*   **Integridad Referencial y Dominio:**
    - Restricciones `CHECK` para validar presupuestos y tiempos de cómputo positivos ($> 0$), así como estados de proyecto y tipos de vistas 3D permitidas.
    - Claves foráneas configuradas con `ON DELETE CASCADE` en entregables derivados (renders y revisiones) y `ON DELETE RESTRICT` en registros maestras.
*   **Ausencia de Comentarios Internos:** El código SQL ejecutable está completamente libre de comentarios dentro de los bloques para cumplir estrictamente las normas de entrega.