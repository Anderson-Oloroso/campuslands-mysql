-- Insercion de datos para saga de ciencia ficcion (ejercicio-044)
USE campuslands_mysql;

-- 1. Insercion en tabla principal (facciones_scifi)
INSERT INTO facciones_scifi (nombre_faccion, planeta_capital, tipo_gobierno) VALUES
('Federacion Unida de Planetas', 'Tierra', 'Federacion'),
('Imperio Galactico Klingon', 'Qo noS', 'Imperio'),
('Corporacion Weyland-Yutani', 'Luna Base', 'Corporacion'),
('Alianza Rebelde Outer Rim', 'Yavin 4', 'Gremio'),
('Imperio Romulano', 'Romulus Prime', 'Imperio');

-- 2. Insercion en tabla secundaria (naves_espaciales)
INSERT INTO naves_espaciales (nombre_nave, clase, id_faccion, tripulacion_max, velocidad_curvatura, nivel_escudos, estado_operativo) VALUES
('USS Enterprise NCC-1701-D', 'Crucero de Batalla', 1, 1012, 9.60, 100, 'Activo'),
('USS Defiant NX-74205', 'Fragata', 1, 50, 9.98, 100, 'Activo'),
('USS Voyager NCC-74656', 'Destructor', 1, 150, 9.97, 95, 'Activo'),
('IKS Negh Var', 'Nave Insignia', 2, 2500, 9.20, 100, 'Activo'),
('IKS B rel Bird of Prey', 'Corbeta', 2, 36, 9.40, 85, 'Activo'),
('USCSS Nostromo', 'Crucero de Batalla', 3, 7, 3.50, 60, 'Destruida'),
('USCSS Prometheus', 'Destructor', 3, 17, 5.20, 80, 'Destruida'),
('Millennium Falcon', 'Corbeta', 4, 4, 9.80, 90, 'Activo'),
('Home One Mon Calamari', 'Nave Insignia', 4, 5400, 8.50, 100, 'Activo'),
('X-Wing Red Five', 'Caza Ligero', 4, 1, 8.00, 75, 'Activo'),
('D deridex Warbird', 'Crucero de Batalla', 5, 1500, 9.50, 100, 'Activo'),
('Scimitar Dreadnought', 'Nave Insignia', 5, 3000, 9.90, 100, 'En Mantenimiento');
