# Ejercicio 023 - Roles y Permisos para Arquitectura 3D

Solución de nivel avanzado enfocada en la seguridad y control de acceso a bases de datos mediante **Roles y Privilegios (DCL)** en MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la tabla transaccional y definición de roles (`rol_consultor_3d`, `rol_disenador_3d`, `rol_admin_3d`) con sus respectivos permisos limitados.
- `dml/inserts.sql`: Inserción de 8 registros con datos realistas del sector de arquitectura 3D.
- `dql/consultas.sql`: Consultas analíticas y reportes de negocio con filtros y ordenamientos avanzados.

## Ejecución
1. Ejecutar el archivo `schema.sql` para crear la tabla y configurar los roles de seguridad.
2. Ejecutar el archivo `inserts.sql` para poblar la información base.
3. Ejecutar el archivo `consultas.sql` para validar los reportes e indicadores requeridos.

## Decisiones Técnicas
- **Control de Acceso (DCL)**: Se implementó la creación explícita de roles para separar responsabilidades (lectura, modificación y administración completa).
- **Tipos de Datos**: Uso de `DECIMAL(12,2)` para los costos de proyectos arquitectónicos y restricciones `ENUM` para garantizar la consistencia en los campos `tipo` y `estado`.