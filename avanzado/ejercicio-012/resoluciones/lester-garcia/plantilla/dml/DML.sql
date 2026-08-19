USE ejercicio_12_adv;

INSERT INTO artists (artist_name, genre) VALUES
('The Midnight Waves', 'Synthwave'),
('Neon Pulse', 'Electronic'),
('Urban Echo', 'Pop'),
('Digital Hearts', 'Indie'),
('Night Riders', 'Rock'),
('Luna Sound', 'Alternative');

INSERT INTO albums (album_title, release_year, artist_id) VALUES
('Neon Nights', 2023, 1),
('Electric Dreams', 2024, 2),
('City Lights', 2022, 3),
('Digital Memories', 2024, 4),
('Midnight Roads', 2021, 5),
('Moon Signals', 2023, 6);

INSERT INTO songs (song_title, duration_seconds, play_count, album_id) VALUES
('Neon Highway', 245, 850000, 1),
('Electric Sky', 220, 920000, 2),
('City Lights', 198, 760000, 3),
('Digital Rain', 275, 680000, 4),
('Midnight Drive', 310, 990000, 5),
('Moon Signals', 230, 540000, 6);

INSERT INTO playlists (playlist_name, category) VALUES
('Night Drive', 'Driving'),
('Workout Energy', 'Fitness'),
('Chill Evening', 'Relax'),
('Electronic Focus', 'Study'),
('Rock Classics', 'Rock');

INSERT INTO playlist_songs (playlist_id, song_id, position_number) VALUES
(1, 1, 1),
(1, 5, 2),
(2, 2, 1),
(2, 3, 2),
(3, 6, 1),
(3, 4, 2);