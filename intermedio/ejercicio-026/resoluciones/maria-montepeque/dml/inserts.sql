-- Datos de practica: items de un videojuego RPG.
-- Cada fila respeta el CHECK: solo llena el atributo de su tipo.
USE campuslands_mysql;

INSERT INTO items_intermedio (nombre, tipo, nivel_requerido, precio, danio, defensa, curacion) VALUES
('Espada Larga', 'arma', 5, 200, 35, NULL, NULL),
('Baston Arcano', 'arma', 8, 350, 45, NULL, NULL),
('Arco Elfico', 'arma', 6, 280, 30, NULL, NULL),
('Armadura de Placas', 'armadura', 10, 400, NULL, 50, NULL),
('Tunica Magica', 'armadura', 7, 220, NULL, 25, NULL),
('Pocion de Vida Menor', 'pocion', 1, 15, NULL, NULL, 30),
('Pocion de Vida Mayor', 'pocion', 10, 60, NULL, NULL, 100),
('Anillo de Fuerza', 'accesorio', 12, 500, NULL, NULL, NULL),
('Amuleto de Sabiduria', 'accesorio', 15, 550, NULL, NULL, NULL);
