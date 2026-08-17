# Ejercicio 006: WHERE para Autos Hiperdeportivos

## Descripción
Solución desarrollada en MySQL para el módulo de datos enfocado en la administración y filtrado avanzado de vehículos hiperdeportivos, aplicando restricciones de integridad y consultas orientadas a indicadores de negocio.

## Decisiones Técnicas
- **Tipos de Datos:** Se empleó `DECIMAL(5,2)` para los precios en millones de USD para garantizar la precisión financiera requerida. El campo `anio_lanzamiento` utiliza el tipo nativo `YEAR`.
- **Restricciones (Constraints):** 
  - `chk_estado`: Valida mediante una condición lógica que el estado del vehículo sea estrictamente `Disponible`, `Agotado` o `Prototipo`.
  - `chk_velocidad`: Asegura que ningún registro baje de los 300 km/h, manteniendo coherencia con la temática de hiperdeportivos.
- **Estructura Modular:** Los scripts están separados de forma estricta en carpetas por responsabilidad (`ddl`, `dml`, `dql`).

## Instrucciones de Ejecución
Ejecuta los scripts en tu gestor de bases de datos MySQL en el siguiente orden estricto:

1. **Esquema:**
   ```bash
   mysql -u root -p < ddl/schema.sql