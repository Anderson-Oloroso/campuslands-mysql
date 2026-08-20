USE ejercicio_14_adv;

INSERT INTO characters (character_name, species, faction) VALUES
('Kael Orion', 'Human', 'Galactic Alliance'),
('Lyra Voss', 'Android', 'Galactic Alliance'),
('Drax Korr', 'Zerkan', 'Outer Empire'),
('Mira Sol', 'Human', 'Galactic Alliance'),
('Rex Talon', 'Kryon', 'Free Worlds'),
('Nora Vega', 'Human', 'Free Worlds');

INSERT INTO missions (mission_name, mission_date, status) VALUES
('Operation Starfall', '2026-01-15', 'Completed'),
('Nebula Rescue', '2026-02-20', 'Completed'),
('Titan Defense', '2026-03-10', 'Completed'),
('Void Expedition', '2026-04-18', 'Completed'),
('Galaxy Shield', '2026-05-25', 'Completed'),
('Omega Signal', '2026-06-30', 'Completed');

INSERT INTO mission_participants (mission_id, character_id, role_name) VALUES
(1, 1, 'Commander'),
(1, 2, 'Engineer'),
(2, 4, 'Pilot'),
(2, 5, 'Scout'),
(3, 1, 'Commander'),
(3, 6, 'Defender');

INSERT INTO mission_logs (mission_id, log_message) VALUES
(1, 'Starfall mission completed successfully.'),
(2, 'Rescue team returned with all civilians.'),
(3, 'Titan defense perimeter secured.');