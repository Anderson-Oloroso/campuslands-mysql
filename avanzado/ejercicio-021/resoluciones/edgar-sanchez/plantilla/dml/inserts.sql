INSERT INTO artistas_digitales (nombre_artista, alias_artistico, correo, software_preferido) VALUES
('Valeria Gomez', 'ValArt', 'valeria.gomez@art.com', 'Clip Studio Paint'),
('Marcos Alvarado', 'MarcSketches', 'marcos.alvarado@art.com', 'Procreate'),
('Lucia Fernandez', 'LumiDraws', 'lucia.fernandez@art.com', 'Adobe Photoshop');

INSERT INTO pinceles_herramientas (nombre_pincel, categoria, tamano_base_px, opacidad_predeterminada) VALUES
('G-Pen Clasico', 'Tinta / Lineart', 12, 100.00),
('Acuarela Suave', 'Pintura / Mezcla', 45, 60.00),
('Aerografo Denso', 'Sombreado', 80, 40.00),
('Pincel Texturizado Carbon': 'Textura', 25, 85.00);

INSERT INTO proyectos_dibujo (artista_id, titulo_proyecto, ancho_px, alto_px, dpi, fecha_creacion, estado_proyecto) VALUES
(1, 'Retrato Cyberpunk', 3840, 2160, 300, '2026-08-01 10:00:00', 'Terminado'),
(1, 'Ilustracion Bosque Encantado', 4000, 3000, 300, '2026-08-10 14:30:00', 'En Proceso'),
(2, 'Concept Art Mech Warrior', 1920, 1080, 150, '2026-08-12 09:15:00', 'En Proceso'),
(3, 'Portada Manga Vol. 1', 2500, 3500, 600, '2026-08-15 16:00:00', 'Borrador');

INSERT INTO capas_proyecto (proyecto_id, pincel_usado_id, nombre_capa, modo_fusion, orden_jerarquia, visible, opacidad_capa) VALUES
(1, 1, 'Lineart Principal', 'Normal', 1, TRUE, 100.00),
(1, 2, 'Color Base Skin', 'Normal', 2, TRUE, 100.00),
(1, 3, 'Sombras Proyectadas', 'Multiplicar', 3, TRUE, 75.00),
(1, 3, 'Luces Neon GLow', 'Añadir (Brillo)', 4, TRUE, 90.00),
(2, 1, 'Boceto Inicial', 'Normal', 1, TRUE, 50.00),
(2, 4, 'Fondo Texturizado', 'Superponer', 2, TRUE, 80.00);  