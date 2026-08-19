USE ejercicio_15_adv;

INSERT INTO games (game_title, genre, release_year, platform) VALUES
('Cyber Arena', 'Action', 2023, 'PC'),
('Dragon Quest Online', 'RPG', 2022, 'PlayStation'),
('Battle Zone', 'Shooter', 2024, 'PC'),
('Speed Legends', 'Racing', 2021, 'Xbox'),
('Kingdom Warriors', 'Strategy', 2020, 'PC'),
('Galaxy Fighters', 'Action', 2023, 'PlayStation');

INSERT INTO users (username, email) VALUES
('ShadowPlayer', 'shadow@email.com'),
('CyberKnight', 'cyber@email.com'),
('DragonMaster', 'dragon@email.com'),
('SpeedRunner', 'speed@email.com'),
('GameHunter', 'hunter@email.com'),
('PixelWarrior', 'pixel@email.com');

INSERT INTO loans (game_id, user_id, loan_date, return_date) VALUES
(1, 1, '2026-01-10', '2026-01-15'),
(2, 2, '2026-01-12', '2026-01-20'),
(3, 3, '2026-02-05', '2026-02-10'),
(4, 4, '2026-02-15', '2026-02-22'),
(5, 5, '2026-03-01', '2026-03-08'),
(6, 6, '2026-03-10', NULL);