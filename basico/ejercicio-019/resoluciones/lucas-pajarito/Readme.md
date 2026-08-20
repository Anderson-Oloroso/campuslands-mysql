# 🪂 Ejercicio 019 - INSERT para Paracaidismo

## 📌 Descripción del Proyecto
Este proyecto demuestra el uso correcto y profesional de la instrucción **`INSERT`** en MySQL aplicado a un centro de **Paracaidismo**. Se repasan técnicas para poblar tablas eficientemente, hacer valer restricciones predeterminadas (`DEFAULT`) y realizar migraciones de datos directas mediante subconsultas.

---

## 🏗️ Patrones de INSERT Demostrados

1. **`INSERT INTO ... VALUES (...), (...)` (Inserción Múltiple):**
   Optimiza el rendimiento en la base de datos al realizar una única transacción I/O para insertar múltiples filas simultáneamente (usado en `instructores_019` y `saltos_019`).
2. **`INSERT` con activación de `DEFAULT`:**
   Demuestra cómo omitir columnas que poseen un valor por defecto asignado en el DDL (como `nivel_experiencia` o `fecha_registro`) para simplificar la carga de datos.
3. **`INSERT INTO ... SELECT`:**
   Muestra el proceso para filtrar e insertar registros de una tabla a otra sin pasar por la capa de aplicación, utilizado para poblar la tabla `bitacora_saltos_vip_019`.

---

## 🚀 Guía de Ejecución

1. Ejecuta el script **DDL** para estructurar las tablas con sus restricciones y valores por defecto.
2. Ejecuta el script **DML** para ejecutar las distintas sintaxis de inserción de datos.
3. Ejecuta el script **DQL** para verificar que los registros guardados sean coherentes y completos.