# ✈️ Ejercicio 018 - Funciones SQL para Viajes y Turismo

## 📌 Descripción del Proyecto
Este proyecto desarrolla la lógica analítica de un sistema de **Viajes y Turismo** combinando **Funciones Almacenadas creadas a medida** (`STORED FUNCTIONS`) con las **Funciones Nativas de MySQL** (Manejo de texto, operadores numéricos, formateo de fechas e intervalos temporalizados).

---

## 🏗️ Funciones Almacenadas Implementadas

1. **`fn_calcular_descuento_grupo(precio_base, personas)`:**
   * **Tipo:** `DETERMINISTIC`
   * **Lógica:** Calcula el monto total aplicando escalas de descuento automáticas (7% a partir de 2 personas, 15% a partir de 4 personas) para incentivar ventas en grupo.
2. **`fn_nivel_fidelidad_turista(pasaporte)`:**
   * **Tipo:** `READS SQL DATA`
   * **Lógica:** Consulta el historial transaccional del cliente para categorizarlo dinámicamente en niveles de programa de lealtad (`EXPLORADOR`, `GOLD VIP`, `PLATINUM VIP`).
3. **`fn_obtener_fecha_retorno(fecha_reserva, tour_id)`:**
   * **Tipo:** `READS SQL DATA`
   * **Lógica:** Retorna la fecha exacta de culminación del viaje sumando la duración en días de la experiencia elegida mediante la función `DATE_ADD`.

---

## 🚀 Guía de Ejecución

1. Ejecuta el script **DDL** para crear el esquema en motor `InnoDB`.
2. Ejecuta el script **DML** para registrar las agencias, tours, paquetes y reservas base.
3. Corre el script de **Functions & DQL** para crear los componentes lógicos en MySQL y verificar los reportes analíticos generados.