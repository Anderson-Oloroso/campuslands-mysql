# 🎮 Ejercicio 015 - Carga de Datos para Biblioteca Gamer

## 📌 Descripción del Proyecto
Este proyecto implementa el diseño, la creación y la carga inicial de datos para un módulo de gestión de **Biblioteca Gamer** en MySQL. Permite organizar categorías, títulos de juegos, estudios creadores y registrar estadísticas clave como el flujo de descargas.

---

## 🏗️ Estructura de la Base de Datos

La base de datos `basico_biblioteca_gamer` está conformada por 4 tablas relacionales:

* **`categoria_juegos_015`**: Almacena las distintas categorías o géneros de videojuegos.
* **`juegos_015`**: Contiene la información general de los juegos y los vincula con su respectiva categoría (`FK`).
* **`creadores_015`**: Registra las empresas, desarrolladoras o estudios creadores.
* **`libreria_juegos_015`**: Tabla relacional que vincula cada juego con su creador, registrando las métricas (`cantidad_descargas` con validación `CHECK`).

---

## 📂 Organización de Scripts SQL

Los scripts están divididos en bloques independientes para facilitar su ejecución secuencial:

### 1. `DDL.sql` (Definición de Estructura)
Crea la base de datos, aplica la limpieza de tablas existentes y define las claves primarias (`PK`), claves foráneas (`FK`) y restricciones de integridad.

### 2. `DML.sql` (Manipulación y Carga)
Contiene la inserción inicial de datos en las 4 tablas con registros coherentes para pruebas de rendimiento.

### 3. `DQL.sql` (Consultas e Indicadores)
Incluye 8 consultas `SELECT` básicas diseñadas para extraer métricas e indicadores de negocio útiles (conteo de creadores, promedio de descargas, top más descargados y filtros por categoría).

---

## 🚀 Guía de Ejecución

1. Abre tu cliente o gestor de base de datos MySQL (MySQL Workbench, DBeaver, VS Code Extension, etc.).
2. Ejecuta en primer lugar el script de **DDL** para estructurar el esquema `basico_biblioteca_gamer`.
3. Ejecuta el script **DML** para poblar las tablas con los registros iniciales.
4. Corre las consultas **DQL** para verificar que la información se consulta e integra correctamente.

---

## 🛠️ Tecnologías Utilizadas
* **Motor DBMS:** MySQL 
* **Lenguaje:** SQL (DDL, DML, DQL)