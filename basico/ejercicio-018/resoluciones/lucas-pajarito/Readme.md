# ✈️ Ejercicio 018 - PRIMARY KEY para Viajes y Turismo

## 📌 Descripción del Proyecto
Este proyecto implementa el diseño e inserción de datos para un módulo de gestión de **Viajes y Turismo** en MySQL. El enfoque principal es la correcta aplicación de **PRIMARY KEY** tanto en formatos simples (numéricos e identidades naturales) como compuestos.

---

## 🏗️ Estructura y Uso de Claves Primarias

La base de datos `basico_viajes_turismo` consta de 4 tablas relacionales:

* **`destinos_018`**: Utiliza una `PRIMARY KEY` numérica autoincremental (`id INT AUTO_INCREMENT`).
* **`turistas_018`**: Implementa una `PRIMARY KEY` natural mediante la columna de texto `pasaporte VARCHAR(20)` para garantizar identificadores únicos reales.
* **`tours_018`**: Clave primaria `id` vinculada con la clave foránea del destino.
* **`reservas_018`**: Implementa una **`PRIMARY KEY` compuesta** estructurada por `(tour_id, turista_pasaporte, fecha_reserva)`, asegurando la imposibilidad de registros duplicados para el mismo turista, tour y fecha.

---

## 🚀 Guía de Ejecución

1. Ejecuta el script **DDL** para estructurar la base de datos y definir las claves primarias.
2. Ejecuta el script **DML** para cargar destinos, turistas, tours y reservas de prueba.
3. Corre las consultas **DQL** para verificar las búsquedas indexadas mediante claves primarias.