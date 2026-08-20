# 🪂 Ejercicio 019 - Triggers para Paracaidismo

## 📌 Descripción del Proyecto
Este proyecto implementa la automatización mediante **Triggers** en MySQL para la gestión operacional de un centro de **Paracaidismo**. Mantiene la integridad referencial, actualiza contadores acumulados en tiempo real y construye una bitácora de auditoría sin requerir intervención manual desde la aplicación.

---

## 🏗️ Triggers Implementados

1. **`trg_validar_altitud_salto` (`BEFORE INSERT`):**
   Garantiza que la altitud del salto cumpla con la normativa mínima de seguridad (>= 4,000 pies). De lo contrario, cancela la transacción lanzando un error con `SIGNAL SQLSTATE '45000'`.
2. **`trg_actualizar_acumulados_salto` (`AFTER INSERT`):**
   Efectúa de forma atómica el incremento de los contadores `total_saltos` en `paracaidistas_019` y `saltos_acumulados` en `instructores_019`.
3. **`trg_auditar_nuevo_salto` (`AFTER INSERT`):**
   Escribe automáticamente un registro detallado en la tabla `auditoria_saltos_019` incluyendo la acción, los parámetros insertados, la fecha y el usuario del sistema ejecutor (`USER()`).

---

## 🚀 Guía de Ejecución

1. Ejecuta el script **DDL** para crear el esquema e índices en motor `InnoDB`.
2. Ejecuta el script **DML** para cargar los catálogos base de instructores y paracaidistas.
3. Corre el script de **Triggers & DQL** para crear los disparadores y verificar su ejecución reactiva tras insertar nuevos saltos.