-- Create a new database named 'db_series'
CREATE DATABASE db_series;
USE db_series;

-- Create a table for series with a primary key 'series_id'
CREATE TABLE series (
  series_id INT NOT NULL,
  name VARCHAR(80) NOT NULL,
  PRIMARY KEY (series_id)
);

-- Create a table for genres with an auto-increment primary key 'genre_id'
CREATE TABLE genre (
  genre_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(70) NOT NULL,
  PRIMARY KEY (genre_id)
);

-- Create a junction table to relate genres to series
-- Establish foreign key constraints with cascading on delete and update
CREATE TABLE genre_series (
  genre_id INT NOT NULL,
  series_id INT NOT NULL,
  PRIMARY KEY (genre_id, series_id),
  CONSTRAINT fk_genre1 FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_series1 FOREIGN KEY (series_id) REFERENCES series (series_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Create a table for seasons with a composite primary key 'season_id' and 'series_id'
-- Establish a foreign key relationship with 'series'
CREATE TABLE season (
  season_id INT NOT NULL,
  series_id INT NOT NULL,
  release_year SMALLINT NOT NULL,
  PRIMARY KEY (season_id, series_id),
  CONSTRAINT fk_series2 FOREIGN KEY (series_id) REFERENCES series (series_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Create a table for episodes with a composite primary key 'series_id', 'episode_id', and 'season_id'
-- Establish a foreign key relationship with 'season'
CREATE TABLE episode (
  series_id INT NOT NULL,
  episode_id INT NOT NULL,
  season_id INT NOT NULL,
  title VARCHAR(60) NOT NULL,
  rating DECIMAL(3,1) NULL,
  PRIMARY KEY (series_id, episode_id, season_id),
  CONSTRAINT fk_season1 FOREIGN KEY (season_id, series_id) REFERENCES season (season_id, series_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Create a table for actors with an auto-increment primary key 'actor_id'
CREATE TABLE actor (
  actor_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(80) NOT NULL,
  PRIMARY KEY (actor_id)
);

-- Create a table for TV characters with an auto-increment primary key 'character_id'
CREATE TABLE tv_character (
  character_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(80) NOT NULL,
  PRIMARY KEY (character_id)
);

-- Create a junction table to relate actors to TV characters
-- Establish foreign key constraints with cascading on delete and update
CREATE TABLE actor_character (
  actor_id INT NOT NULL,
  character_id INT NOT NULL,
  PRIMARY KEY (actor_id, character_id),
  CONSTRAINT fk_actor1 FOREIGN KEY (actor_id) REFERENCES actor (actor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_tv_character1 FOREIGN KEY (character_id) REFERENCES tv_character (character_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Create a table to represent the cast of an episode
-- Establish foreign key relationships with 'episode' and 'actor_character'
CREATE TABLE episode_cast (
  series_id INT NOT NULL,
  episode_id INT NOT NULL,
  season_id INT NOT NULL,
  actor_id INT NOT NULL,
  character_id INT NOT NULL,
  PRIMARY KEY (series_id, episode_id, season_id, actor_id, character_id),
  CONSTRAINT fk_episode1
    FOREIGN KEY (series_id, episode_id, season_id) REFERENCES episode (series_id, episode_id, season_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_actor_character1
    FOREIGN KEY (actor_id, character_id) REFERENCES actor_character (actor_id, character_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Insert genres into the 'genre' table
INSERT INTO genre (genre_id, name) VALUES
(1, 'Comedy'),
(2, 'Drama'),
(3, 'Adult'),
(4, 'Family'),
(5, 'Romance'),
(6, 'Talk Show'),
(7, 'Animation'),
(8, 'Music'),
(9, 'Adventure'),
(10, 'Fantasy'),
(11, 'Action'),
(12, 'Science Fiction'),
(13, 'News'),
(14, 'Crime'),
(15, 'Game Show'),
(16, 'Mystery'),
(17, 'Musical'),
(18, 'Horror'),
(19, 'Thriller'),
(20, 'Reality TV'),
(21, 'Documentary'),
(22, 'Sports'),
(23, 'History'),
(24, 'Western'),
(25, 'Biography'),
(26, 'War');

-- Insert series into the 'series' table
INSERT INTO series (series_id, name) VALUES
(1, 'Dark'),
(2, 'Friends'),
(3, 'Black Mirror'),
(4, 'Defending Jacob'),
(5, 'The Mandalorian'),
(6, 'The Handmaid\'s Tale'),
(7, 'House M.D.'),
(8, 'The Witcher'),
(9, 'Money Heist'),
(10, 'Westworld'),
(11, 'Stranger Things'),
(12, 'American Horror Story'),
(13, 'Game of Thrones'),
(14, 'Breaking Bad'),
(15, 'The Sinner'),
(16, 'The Falcon and The Winter Soldier'),
(17, 'Servant'),
(18, 'WandaVision'),
(19, 'Party of Five'),
(20, 'The Big Bang Theory'),
(21, 'Young Sheldon');

-- Insert genre-series relationships into the 'genre_series' table

-- Dark
INSERT INTO genre_series (genre_id, series_id) VALUES (14, 1), (2, 1), (16, 1);

-- Friends
INSERT INTO genre_series (genre_id, series_id) VALUES (1, 2), (5, 2);

-- Black Mirror
INSERT INTO genre_series (genre_id, series_id) VALUES (2, 3), (12, 3), (19, 3);

-- Defending Jacob
INSERT INTO genre_series (genre_id, series_id) VALUES (14, 4), (2, 4), (16, 4);

-- The Mandalorian
INSERT INTO genre_series (genre_id, series_id) VALUES (11, 5), (9, 5), (12, 5);

-- The Handmaid's Tale
INSERT INTO genre_series (genre_id, series_id) VALUES (2, 6), (12, 6), (19, 6);

-- House M.D.
INSERT INTO genre_series (genre_id, series_id) VALUES (2, 7), (16, 7);

-- The Witcher
INSERT INTO genre_series (genre_id, series_id) VALUES (11, 8), (9, 8), (10, 8);

-- Money Heist
INSERT INTO genre_series (genre_id, series_id) VALUES (11, 9), (14, 9), (16, 9);

-- Westworld
INSERT INTO genre_series (genre_id, series_id) VALUES (2, 10), (16, 10), (12, 10);

-- Stranger Things
INSERT INTO genre_series (genre_id, series_id) VALUES (2, 11), (10, 11), (18, 11);

-- American Horror Story
INSERT INTO genre_series (genre_id, series_id) VALUES (2, 12), (18, 12), (19, 12);

-- Game of Thrones
INSERT INTO genre_series (genre_id, series_id) VALUES (11, 13), (9, 13), (2, 13);

-- Breaking Bad
INSERT INTO genre_series (genre_id, series_id) VALUES (14, 14), (2, 14), (19, 14);

-- The Sinner
INSERT INTO genre_series (genre_id, series_id) VALUES (14, 15), (2, 15), (16, 15);

-- Servant
INSERT INTO genre_series (genre_id, series_id) VALUES (2, 17), (18, 17), (19, 17);

-- The Big Bang Theory
INSERT INTO genre_series (genre_id, series_id) VALUES (1, 20), (5, 20);

-- Young Sheldon
INSERT INTO genre_series (genre_id, series_id) VALUES (1, 21);

-- Insert seasons into the 'season' table
INSERT INTO season (season_id, series_id, release_year) VALUES
(1, 1, 2017),
(2, 1, 2019),
(3, 1, 2020),
(1, 2, 1994),
(2, 2, 1995),
(3, 2, 1996),
(4, 2, 1997),
(5, 2, 1998),
(6, 2, 1999),
(7, 2, 2000),
(8, 2, 2001),
(9, 2, 2002),
(10, 2, 2003),
(1, 3, 2011),
(2, 3, 2013),
(3, 3, 2016),
(4, 3, 2017),
(5, 3, 2019),
(1, 4, 2020),
(1, 5, 2019),
(1, 6, 2017),
(2, 6, 2018),
(3, 6, 2019),
(4, 6, 2021),
(1, 8, 2019),
(2, 8, 2021),
(1, 11, 2016),
(2, 11, 2017),
(3, 11, 2019),
(4, 11, 2021),
(1, 15, 2017),
(2, 15, 2018),
(3, 15, 2020),
(4, 15, 2021),
(1, 16, 2020),
(1, 17, 2019),
(1, 18, 2020),
(1, 20, 2007),
(2, 20, 2008),
(3, 20, 2009),
(4, 20, 2010),
(5, 20, 2011),
(6, 20, 2012),
(7, 20, 2013),
(8, 20, 2014),
(9, 20, 2015),
(10, 20, 2016),
(11, 20, 2017),
(12, 20, 2018),
(1, 21, 2017),
(2, 21, 2018),
(3, 21, 2019),
(4, 21, 2020);

-- Insert episodes into the 'episode' table for 'Servant' season 1
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(17, 1, 1, 'Reborn', 8.2),
(17, 2, 1, 'Wood', 8.0),
(17, 3, 1, 'Eel', 8.0),
(17, 4, 1, 'Bear', 7.8),
(17, 5, 1, 'Cricket', 7.6),
(17, 6, 1, 'Rain', 7.8),
(17, 7, 1, 'Haggis', 7.7),
(17, 8, 1, 'Boba', 8.1),
(17, 9, 1, 'Jericho', 8.4),
(17, 10, 1, 'Balloon', 8.0);

-- Insert episodes into the 'episode' table for 'Defending Jacob' season 1
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(4, 1, 1, 'Pilot', 8.1),
(4, 2, 1, 'Everything Is Cool', 8.4),
(4, 3, 1, 'Poker Faces', 8.5),
(4, 4, 1, 'Damage Control', 8.1),
(4, 5, 1, 'Visitors', 8.2),
(4, 6, 1, 'Wishful Thinking', 8.3),
(4, 7, 1, 'Job', 9.2),
(4, 8, 1, 'After', 8.1);

-- Insert episodes into the 'episode' table for 'The Handmaid's Tale' season 1
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(6, 1, 1, 'Offred', 8.3),
(6, 2, 1, 'Birth Day', 8.2),
(6, 3, 1, 'Late', 8.7),
(6, 4, 1, 'Nolite Te Bastardes Carborundorum', 8.2),
(6, 5, 1, 'Faithful', 8.2),
(6, 6, 1, 'A Woman\'s Place', 8.8),
(6, 7, 1, 'The Other Side', 8.0),
(6, 8, 1, 'Jezebels', 8.1),
(6, 9, 1, 'The Bridge', 8.8),
(6, 10, 1, 'Night', 9.1);

-- Insert episodes into the 'episode' table for 'The Handmaid\'s Tale' season 2
INSERT INTO episode 
(series_id, episode_id, season_id, title, rating)
VALUES 
(6, 1, 2, 'June', 8.9),
(6, 2, 2, 'Unwomen', 8.3),
(6, 3, 2, 'Baggage', 8.1),
(6, 4, 2, 'Other Women', 8.0),
(6, 5, 2, 'Seeds', 8.1),
(6, 6, 2, 'First Blood', 8.9),
(6, 7, 2, 'After', 8.3),
(6, 8, 2, 'Women\'s Work', 8.8),
(6, 9, 2, 'Smart Power', 9.0),
(6, 10, 2, 'The Last Ceremony', 9.1),
(6, 11, 2, 'Holly', 8.4),
(6, 12, 2, 'Postpartum', 8.4),
(6, 13, 2, 'The Word', 8.6);

-- Insert episodes into the 'episode' table for 'The Handmaid\'s Tale' season 3
INSERT INTO episode 
(series_id, episode_id, season_id, title, rating)
VALUES 
(6, 1, 3, 'Night', 8.4),
(6, 2, 3, 'Mary and Martha', 7.8),
(6, 3, 3, 'Useful', 8.1),
(6, 4, 3, 'God Bless the Child', 8.0),
(6, 5, 3, 'Unknown Caller', 8.5),
(6, 6, 3, 'Household', 8.2),
(6, 7, 3, 'Under His Eye', 7.2),
(6, 8, 3, 'Unfit', 7.7),
(6, 9, 3, 'Heroic', 6.1),
(6, 10, 3, 'Bear Witness', 8.2),
(6, 11, 3, 'Liars', 9.3),
(6, 12, 3, 'Sacrifice', 8.2),
(6, 13, 3, 'Mayday', 9.4);

-- Insert episodes into the 'episode' table for 'Dark' season 1
INSERT INTO episode 
(series_id, episode_id, season_id, title, rating)
VALUES 
(1, 1, 1, 'Secrets', 8.3),
(1, 2, 1, 'Lies', 8.2),
(1, 3, 1, 'Past and Present', 8.6),
(1, 4, 1, 'Double Lives', 8.3),
(1, 5, 1, 'Truths', 8.9),
(1, 6, 1, 'Sic Mundus Creatus Est', 9.1),
(1, 7, 1, 'Crossroads', 8.7),
(1, 8, 1, 'As You Sow, so You Shall Reap', 9.2),
(1, 9, 1, 'Everything Is Now', 8.7),
(1, 10, 1, 'Alpha and Omega', 9.2);

-- Insert episodes into the 'episode' table for 'Dark' season 2
INSERT INTO episode 
(series_id, episode_id, season_id, title, rating)
VALUES 
(1, 1, 2, 'Beginnings and Endings', 8.9), 
(1, 2, 2, 'Dark Matter', 9.0), 
(1, 3, 2, 'Ghosts', 9.2), 
(1, 4, 2, 'The Travelers', 9.5), 
(1, 5, 2, 'Lost and Found', 9.3), 
(1, 6, 2, 'An Endless Cycle', 9.6), 
(1, 7, 2, 'The White Devil', 9.3), 
(1, 8, 2, 'Endings and Beginnings', 9.5);

-- Insert episodes into the 'episode' table for 'The Mandalorian' season 1
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(5, 1, 1, 'Chapter 1: The Mandalorian', 8.7),
(5, 2, 1, 'Chapter 2: The Child', 8.7),
(5, 3, 1, 'Chapter 3: The Sin', 9.1),
(5, 4, 1, 'Chapter 4: Sanctuary', 7.8),
(5, 5, 1, 'Chapter 5: The Gunslinger', 7.6),
(5, 6, 1, 'Chapter 6: The Prisoner', 8.4),
(5, 7, 1, 'Chapter 7: The Reckoning', 9.1),
(5, 8, 1, 'Chapter 8: Redemption', 9.3);

-- Insert episodes into the 'episode' table for 'The Big Bang Theory' season 1
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(20, 1, 1, 'Pilot', 8.3),
(20, 2, 1, 'The Big Bran Hypothesis', 8.3),
(20, 3, 1, 'The Fuzzy Boots Corollary', 7.8),
(20, 4, 1, 'The Luminous Fish Effect', 8.2),
(20, 5, 1, 'The Hamburger Postulate', 8.0),
(20, 6, 1, 'The Middle Earth Paradigm', 8.5),
(20, 7, 1, 'The Dumpling Paradox', 8.2),
(20, 8, 1, 'The Grasshopper Experiment', 8.3),
(20, 9, 1, 'The Cooper-Hofstadter Polarization', 8.1),
(20, 10, 1, 'The Loobenfeld Decay', 8.1),
(20, 11, 1, 'The Pancake Batter Anomaly', 8.3),
(20, 12, 1, 'The Jerusalem Duality', 8.0),
(20, 13, 1, 'The Bat Jar Conjecture', 8.4),
(20, 14, 1, 'The Nerdvana Annihilation', 8.1),
(20, 15, 1, 'The Pork Chop Indeterminacy', 8.3),
(20, 16, 1, 'The Peanut Reaction', 8.4),
(20, 17, 1, 'The Tangerine Factor', 8.6);

-- Insert episodes into the 'episode' table for 'The Big Bang Theory' season 12
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(20, 1, 12, 'The Conjugal Configuration', 7.2),
(20, 2, 12, 'The Wedding Gift Wormhole', 7.6),
(20, 3, 12, 'The Procreation Calculation', 7.2),
(20, 4, 12, 'The Tam Turbulence', 7.1),
(20, 5, 12, 'The Planetarium Collision', 6.8),
(20, 6, 12, 'The Imitation Perturbation', 8.3),
(20, 7, 12, 'The Grant Allocation Derivation', 7.4),
(20, 8, 12, 'The Consummation Deviation', 7.4),
(20, 9, 12, 'The Citation Negation', 7.3),
(20, 10, 12, 'The VCR Illumination', 7.5),
(20, 11, 12, 'The Paintball Scattering', 7.3),
(20, 12, 12, 'The Propagation Proposition', 7.2),
(20, 13, 12, 'The Confirmation Polarization', 7.2),
(20, 14, 12, 'The Meteorite Manifestation', 7.1),
(20, 15, 12, 'The Donation Oscillation', 7.5),
(20, 16, 12, 'The D & D Vortex', 8.0),
(20, 17, 12, 'The Conference Valuation', 7.1),
(20, 18, 12, 'The Laureate Accumulation', 7.2),
(20, 19, 12, 'The Inspiration Deprivation', 7.0),
(20, 20, 12, 'The Decision Reverberation', 7.2),
(20, 21, 12, 'The Plagiarism Schism', 7.3),
(20, 22, 12, 'The Maternal Conclusion', 8.0),
(20, 23, 12, 'The Change Constant', 9.2),
(20, 24, 12, 'The Stockholm Syndrome', 9.6);

-- Insert episodes into the 'episode' table for 'Young Sheldon' season 1
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(21, 1, 1, 'Pilot', 7.4),
(21, 2, 1, 'Rockets, Communists, and the Dewey Decimal System', 7.4),
(21, 3, 1, 'Poker, Faith and Eggs', 7.7),
(21, 4, 1, 'A Therapist, a Comic Book, and a Breakfast Sausage', 7.5),
(21, 5, 1, 'A Solar Calculator, a Game Ball, and a Cheerleader\'s Bosom', 7.6),
(21, 6, 1, 'A Patch, a Modem, and a Zantac', 8.1),
(21, 7, 1, 'A Brisket, Voodoo, and Cannonball Run', 7.7),
(21, 8, 1, 'Cape Canaveral, Schrödinger\'s Cat, and Cyndi Lauper\'s Hair', 7.7),
(21, 9, 1, 'Spock, Kirk, and Testicular Hernia', 7.9),
(21, 10, 1, 'An Eagle Feather, a String Bean, and an Eskimo', 7.9),
(21, 11, 1, 'Demons, Sunday School, and Prime Numbers', 7.8),
(21, 12, 1, 'A Computer, a Plastic Pony, and a Case of Beer', 7.7),
(21, 13, 1, 'A Sneeze, Detention, and Sissy Spacek', 7.6),
(21, 14, 1, 'Potato Salad, a Broomstick, and Dad\'s Whiskey', 7.8),
(21, 15, 1, 'Dolomite, Apple Slices, and a Mystery Woman', 7.4),
(21, 16, 1, 'Killer Asteroids, Oklahoma, and a Frizzy Hair Machine', 7.4),
(21, 17, 1, 'Jiu-Jitsu, Bubble Wrap, and Yoo-Hoo', 7.4),
(21, 18, 1, 'A Mother, a Child, and a Blue Man\'s Backside', 7.7),
(21, 19, 1, 'Gluons, Guacamole, and the Color Purple', 7.6),
(21, 20, 1, 'A Dog, a Squirrel, and a Fish Named Fish', 7.6),
(21, 21, 1, 'Summer Sausage, a Pocket Poncho, and Tony Danza', 7.6),
(21, 22, 1, 'Vanilla Ice Cream, Gentleman Callers, and a Dinette Set', 7.7);

-- Insert episodes into the 'episode' table for 'Black Mirror' season 1
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(3, 1, 1, 'The National Anthem', 7.8),
(3, 2, 1, 'Fifteen Million Merits', 8.1),
(3, 3, 1, 'The Entire History of You', 8.6);

-- Insert episodes into the 'episode' table for 'Black Mirror' season 2
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(3, 1, 2, 'Be Right Back', 8.1),
(3, 2, 2, 'White Bear', 8.0),
(3, 3, 2, 'The Waldo Moment', 6.7),
(3, 4, 2, 'White Christmas', 9.1);

-- Insert episodes into the 'episode' table for 'Black Mirror' season 3
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(3, 1, 3, 'Nosedive', 8.3),
(3, 2, 3, 'Playtest', 8.1),
(3, 3, 3, 'Shut Up and Dance', 8.5),
(3, 4, 3, 'San Junipero', 8.6),
(3, 5, 3, 'Men Against Fire', 7.6),
(3, 6, 3, 'Hated in the Nation', 8.5);

-- Insert episodes into the 'episode' table for 'Black Mirror' season 4
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(3, 1, 4, 'USS Callister', 8.3),
(3, 2, 4, 'Arkangel', 7.3),
(3, 3, 4, 'Crocodile', 7.3),
(3, 4, 4, 'Hang the DJ', 8.8),
(3, 5, 4, 'Metalhead', 6.7),
(3, 6, 4, 'Black Museum', 8.7);

-- Insert episodes into the 'episode' table for 'Black Mirror' season 5
INSERT INTO episode
(series_id, episode_id, season_id, title, rating)
VALUES
(3, 1, 5, 'Striking Vipers', 6.8),
(3, 2, 5, 'Smithereens', 7.5),
(3, 3, 5, 'Rachel, Jack and Ashley Too', 6.0);

-- Insert actors into the 'actor' table for 'Servant'
INSERT INTO actor (actor_id, name) VALUES
(651, 'Lauren Ambrose'),
(452, 'Toby Kebbell'),
(453, 'Nell Tiger Free'),
(124, 'Rupert Grint'),
(155, 'Mason Belford'),
(456, 'Phillip James Brannon');

-- Insert characters into the 'character' table for 'Servant'
INSERT INTO tv_character (character_id, name) VALUES
(361, 'Dorothy Turner'),
(562, 'Sean Turner'),
(483, 'Leanne Grayson'),
(724, 'Julian Pearce'),
(165, 'Jericho'),
(956, 'Roscoe');

-- Link actors to characters in the 'actor_character' table for 'Servant'
INSERT INTO actor_character (actor_id, character_id) VALUES
(651, 361),
(452, 562),
(453, 483),
(124, 724),
(155, 165),
(456, 956);

-- Insert data into the episode_cast table
INSERT INTO episode_cast (series_id, episode_id, season_id, actor_id, character_id) VALUES
(1, 1, 1, 651, 361),  -- Actor 651 as Character 361 in Episode 1, Season 1 of Series 1
(1, 2, 1, 651, 361),  -- Actor 651 as Character 361 in Episode 2, Season 1 of Series 1
(1, 3, 1, 651, 361),  -- Actor 651 as Character 361 in Episode 3, Season 1 of Series 1
(1, 4, 1, 651, 361),  -- Actor 651 as Character 361 in Episode 4, Season 1 of Series 1
(1, 6, 1, 651, 361),  -- Actor 651 as Character 361 in Episode 6, Season 1 of Series 1
(1, 7, 1, 651, 361),  -- Actor 651 as Character 361 in Episode 7, Season 1 of Series 1
(1, 8, 1, 651, 361),  -- Actor 651 as Character 361 in Episode 8, Season 1 of Series 1
(1, 9, 1, 651, 361),  -- Actor 651 as Character 361 in Episode 9, Season 1 of Series 1
(1, 10, 1, 651, 361), -- Actor 651 as Character 361 in Episode 10, Season 1 of Series 1
(1, 1, 1, 452, 562),  -- Actor 452 as Character 562 in Episode 1, Season 1 of Series 1
(1, 2, 1, 452, 562),  -- Actor 452 as Character 562 in Episode 2, Season 1 of Series 1
(1, 3, 1, 452, 562),  -- Actor 452 as Character 562 in Episode 3, Season 1 of Series 1
(1, 4, 1, 452, 562),  -- Actor 452 as Character 562 in Episode 4, Season 1 of Series 1
(1, 7, 1, 452, 562),  -- Actor 452 as Character 562 in Episode 7, Season 1 of Series 1
(1, 8, 1, 452, 562),  -- Actor 452 as Character 562 in Episode 8, Season 1 of Series 1
(1, 9, 1, 452, 562),  -- Actor 452 as Character 562 in Episode 9, Season 1 of Series 1
(1, 10, 1, 452, 562), -- Actor 452 as Character 562 in Episode 10, Season 1 of Series 1
(1, 1, 1, 453, 483),  -- Actor 453 as Character 483 in Episode 1, Season 1 of Series 1
(1, 4, 1, 453, 483),  -- Actor 453 as Character 483 in Episode 4, Season 1 of Series 1
(1, 5, 1, 453, 483),  -- Actor 453 as Character 483 in Episode 5, Season 1 of Series 1
(1, 6, 1, 453, 483),  -- Actor 453 as Character 483 in Episode 6, Season 1 of Series 1
(1, 7, 1, 453, 483),  -- Actor 453 as Character 483 in Episode 7, Season 1 of Series 1
(1, 8, 1, 453, 483),  -- Actor 453 as Character 483 in Episode 8, Season 1 of Series 1
(1, 9, 1, 453, 483),  -- Actor 453 as Character 483 in Episode 9, Season 1 of Series 1
(1, 10, 1, 453, 483), -- Actor 453 as Character 483 in Episode 10, Season 1 of Series 1
(1, 1, 1, 124, 724),  -- Actor 124 as Character 724 in Episode 1, Season 1 of Series 1
(1, 2, 1, 124, 724),  -- Actor 124 as Character 724 in Episode 2, Season 1 of Series 1
(1, 3, 1, 124, 724),  -- Actor 124 as Character 724 in Episode 3, Season 1 of Series 1
(1, 4, 1, 124, 724),  -- Actor 124 as Character 724 in Episode 4, Season 1 of Series 1
(1, 5, 1, 124, 724),  -- Actor 124 as Character 724 in Episode 5, Season 1 of Series 1
(1, 6, 1, 124, 724),  -- Actor 124 as Character 724 in Episode 6, Season 1 of Series 1
(1, 7, 1, 124, 724),  -- Actor 124 as Character 724 in Episode 7, Season 1 of Series 1
(1, 10, 1, 124, 724), -- Actor 124 as Character 724 in Episode 10, Season 1 of Series 1
(1, 1, 1, 155, 165),  -- Actor 155 as Character 165 in Episode 1, Season 1 of Series 1
(1, 2, 1, 155, 165),  -- Actor 155 as Character 165 in Episode 2, Season 1 of Series 1
(1, 3, 1, 155, 165),  -- Actor 155 as Character 165 in Episode 3, Season 1 of Series 1
(1, 4, 1, 155, 165),  -- Actor 155 as Character 165 in Episode 4, Season 1 of Series 1
(1, 6, 1, 155, 165),  -- Actor 155 as Character 165 in Episode 6, Season 1 of Series 1
(1, 7, 1, 155, 165),  -- Actor 155 as Character 165 in Episode 7, Season 1 of Series 1
(1, 8, 1, 155, 165),  -- Actor 155 as Character 165 in Episode 8, Season 1 of Series 1
(1, 9, 1, 155, 165),  -- Actor 155 as Character 165 in Episode 9, Season 1 of Series 1
(1, 10, 1, 155, 165), -- Actor 155 as Character 165 in Episode 10, Season 1 of Series 1
(1, 1, 1, 456, 956),  -- Actor 456 as Character 956 in Episode 1, Season 1 of Series 1
(1, 2, 1, 456, 956),  -- Actor 456 as Character 956 in Episode 2, Season 1 of Series 1
(1, 3, 1, 456, 956),  -- Actor 456 as Character 956 in Episode 3, Season 1 of Series 1
(1, 4, 1, 456, 956),  -- Actor 456 as Character 956 in Episode 4, Season 1 of Series 1
(1, 5, 1, 456, 956),  -- Actor 456 as Character 956 in Episode 5, Season 1 of Series 1
(1, 6, 1, 456, 956),  -- Actor 456 as Character 956 in Episode 6, Season 1 of Series 1
(1, 7, 1, 456, 956),  -- Actor 456 as Character 956 in Episode 7, Season 1 of Series 1
(1, 8, 1, 456, 956),  -- Actor 456 as Character 956 in Episode 8, Season 1 of Series 1
(1, 10, 1, 456, 956); -- Actor 456 as Character 956 in Episode 10, Season 1 of Series 1

-- The Handmaid's Tale
-- Actors
INSERT INTO actor (actor_id, name) VALUES 
(357, 'Elisabeth Moss'),          -- Actor with ID 357: Elisabeth Moss
(688, 'Amanda Brugel'),          -- Actor with ID 688: Amanda Brugel
(919, 'Madeline Brewer'),        -- Actor with ID 919: Madeline Brewer
(910, 'Max Minghella'),          -- Actor with ID 910: Max Minghella
(911, 'Yvonne Strahovski'),      -- Actor with ID 911: Yvonne Strahovski
(812, 'Joseph Fiennes'),         -- Actor with ID 812: Joseph Fiennes
(713, 'Ann Dowd'),               -- Actor with ID 713: Ann Dowd
(614, 'Samira Wiley'),           -- Actor with ID 614: Samira Wiley
(315, 'Nina Kiri'),              -- Actor with ID 315: Nina Kiri
(416, 'O-T Fagbenle');           -- Actor with ID 416: O-T Fagbenle

-- Characters
INSERT INTO tv_character (character_id, name) VALUES 
(367, 'June Osborne'),            -- Character with ID 367: June Osborne
(878, 'Rita'),                    -- Character with ID 878: Rita
(759, 'Janine Lindo'),            -- Character with ID 759: Janine Lindo
(410, 'Nick Blaine'),             -- Character with ID 410: Nick Blaine
(511, 'Serena Joy Waterford'),    -- Character with ID 511: Serena Joy Waterford
(312, 'Fred Waterford'),          -- Character with ID 312: Fred Waterford
(413, 'Aunt Lydia Clements'),     -- Character with ID 413: Aunt Lydia Clements
(514, 'Moira Strand'),            -- Character with ID 514: Moira Strand
(715, 'Alma'),                    -- Character with ID 715: Alma
(916, 'Luke Bankole');            -- Character with ID 916: Luke Bankole

INSERT INTO actor_character (actor_id, character_id) VALUES 
(357, 367),  -- Actor 357 as Character 367
(688, 878),  -- Actor 688 as Character 878
(919, 759),  -- Actor 919 as Character 759
(910, 410),  -- Actor 910 as Character 410
(911, 511),  -- Actor 911 as Character 511
(812, 312),  -- Actor 812 as Character 312
(713, 413),  -- Actor 713 as Character 413
(614, 514),  -- Actor 614 as Character 514
(315, 715),  -- Actor 315 as Character 715
(416, 916);  -- Actor 416 as Character 916

-- Casting information
INSERT INTO episode_cast (series_id, episode_id, season_id, actor_id, character_id) VALUES
(6, 1, 1, 357, 367),  -- Actor 357 as Character 367 in Episode 1, Season 1 of Series 6
(6, 1, 1, 688, 878),  -- Actor 688 as Character 878 in Episode 1, Season 1 of Series 6
(6, 1, 1, 910, 410),  -- Actor 910 as Character 410 in Episode 1, Season 1 of Series 6
(6, 1, 1, 911, 511),  -- Actor 911 as Character 511 in Episode 1, Season 1 of Series 6
(6, 1, 1, 812, 312),  -- Actor 812 as Character 312 in Episode 1, Season 1 of Series 6
(6, 1, 1, 713, 413),  -- Actor 713 as Character 413 in Episode 1, Season 1 of Series 6
(6, 1, 1, 614, 514),  -- Actor 614 as Character 514 in Episode 1, Season 1 of Series 6
(6, 1, 1, 315, 715),  -- Actor 315 as Character 715 in Episode 1, Season 1 of Series 6
(6, 2, 1, 357, 367),  -- Actor 357 as Character 367 in Episode 2, Season 1 of Series 6
(6, 2, 1, 688, 878),  -- Actor 688 as Character 878 in Episode 2, Season 1 of Series 6
(6, 2, 1, 812, 312),  -- Actor 812 as Character 312 in Episode 2, Season 1 of Series 6
(6, 2, 1, 713, 413),  -- Actor 713 as Character 413 in Episode 2, Season 1 of Series 6
(6, 2, 1, 614, 514),  -- Actor 614 as Character 514 in Episode 2, Season 1 of Series 6
(6, 2, 1, 315, 715),  -- Actor 315 as Character 715 in Episode 2, Season 1 of Series 6
(6, 2, 1, 416, 916),  -- Actor 416 as Character 916 in Episode 2, Season 1 of Series 6
(6, 3, 1, 357, 367),  -- Actor 357 as Character 367 in Episode 3, Season 1 of Series 6
(6, 3, 1, 688, 878),  -- Actor 688 as Character 878 in Episode 3, Season 1 of Series 6
(6, 3, 1, 919, 759),  -- Actor 919 as Character 759 in Episode 3, Season 1 of Series 6
(6, 3, 1, 910, 410),  -- Actor 910 as Character 410 in Episode 3, Season 1 of Series 6
(6, 3, 1, 911, 511),  -- Actor 911 as Character 511 in Episode 3, Season 1 of Series 6
(6, 3, 1, 614, 514),  -- Actor 614 as Character 514 in Episode 3, Season 1 of Series 6
(6, 3, 1, 315, 715),  -- Actor 315 as Character 715 in Episode 3, Season 1 of Series 6
(6, 3, 1, 416, 916),  -- Actor 416 as Character 916 in Episode 3, Season 1 of Series 6
(6, 1, 2, 357, 367),  -- Actor 357 as Character 367 in Episode 1, Season 2 of Series 6
(6, 1, 2, 688, 878),  -- Actor 688 as Character 878 in Episode 1, Season 2 of Series 6
(6, 1, 2, 919, 759),  -- Actor 919 as Character 759 in Episode 1, Season 2 of Series 6
(6, 1, 2, 910, 410),  -- Actor 910 as Character 410 in Episode 1, Season 2 of Series 6
(6, 1, 2, 911, 511),  -- Actor 911 as Character 511 in Episode 1, Season 2 of Series 6
(6, 1, 2, 812, 312),  -- Actor 812 as Character 312 in Episode 1, Season 2 of Series 6
(6, 1, 2, 315, 715),  -- Actor 315 as Character 715 in Episode 1, Season 2 of Series 6
(6, 1, 2, 416, 916),  -- Actor 416 as Character 916 in Episode 1, Season 2 of Series 6
(6, 2, 2, 357, 367),  -- Actor 357 as Character 367 in Episode 2, Season 2 of Series 6
(6, 2, 2, 688, 878),  -- Actor 688 as Character 878 in Episode 2, Season 2 of Series 6
(6, 2, 2, 919, 759),  -- Actor 919 as Character 759 in Episode 2, Season 2 of Series 6
(6, 2, 2, 910, 410),  -- Actor 910 as Character 410 in Episode 2, Season 2 of Series 6
(6, 2, 2, 911, 511),  -- Actor 911 as Character 511 in Episode 2, Season 2 of Series 6
(6, 2, 2, 812, 312),  -- Actor 812 as Character 312 in Episode 2, Season 2 of Series 6
(6, 2, 2, 713, 413),  -- Actor 713 as Character 413 in Episode 2, Season 2 of Series 6
(6, 2, 2, 614, 514),  -- Actor 614 as Character 514 in Episode 2, Season 2 of Series 6
(6, 2, 2, 315, 715),  -- Actor 315 as Character 715 in Episode 2, Season 2 of Series 6
(6, 3, 2, 357, 367),  -- Actor 357 as Character 367 in Episode 3, Season 2 of Series 6
(6, 3, 2, 688, 878),  -- Actor 688 as Character 878 in Episode 3, Season 2 of Series 6
(6, 3, 2, 911, 511),  -- Actor 911 as Character 511 in Episode 3, Season 2 of Series 6
(6, 3, 2, 812, 312),  -- Actor 812 as Character 312 in Episode 3, Season 2 of Series 6
(6, 3, 2, 713, 413),  -- Actor 713 as Character 413 in Episode 3, Season 2 of Series 6
(6, 3, 2, 614, 514),  -- Actor 614 as Character 514 in Episode 3, Season 2 of Series 6
(6, 3, 2, 315, 715),  -- Actor 315 as Character 715 in Episode 3, Season 2 of Series 6
(6, 3, 2, 416, 916),  -- Actor 416 as Character 916 in Episode 3, Season 2 of Series 6
(6, 1, 3, 357, 367),  -- Actor 357 as Character 367 in Episode 1, Season 3 of Series 6
(6, 1, 3, 688, 878),  -- Actor 688 as Character 878 in Episode 1, Season 3 of Series 6
(6, 1, 3, 919, 759),  -- Actor 919 as Character 759 in Episode 1, Season 3 of Series 6
(6, 1, 3, 910, 410),  -- Actor 910 as Character 410 in Episode 1, Season 3 of Series 6
(6, 1, 3, 713, 413),  -- Actor 713 as Character 413 in Episode 1, Season 3 of Series 6
(6, 1, 3, 614, 514),  -- Actor 614 as Character 514 in Episode 1, Season 3 of Series 6
(6, 1, 3, 315, 715);  -- Actor 315 as Character 715 in Episode 1, Season 3 of Series 6

-- The Big Bang Theory
-- Actors
INSERT INTO actor (actor_id, name) VALUES 
(317, 'Johnny Galecki'),          -- Actor with ID 317: Johnny Galecki
(418, 'Jim Parsons'),            -- Actor with ID 418: Jim Parsons
(619, 'Kaley Cuoco'),            -- Actor with ID 619: Kaley Cuoco
(820, 'Simon Helberg'),          -- Actor with ID 820: Simon Helberg
(221, 'Kunal Nayyar'),           -- Actor with ID 221: Kunal Nayyar
(122, 'Mayim Bialik'),           -- Actor with ID 122: Mayim Bialik
(323, 'Melissa Rauch'),          -- Actor with ID 323: Melissa Rauch
(424, 'Christine Baranski'),     -- Actor with ID 424: Christine Baranski
(725, 'Iain Armitage');          -- Actor with ID 725: Iain Armitage

-- Characters
INSERT INTO tv_character (character_id, name) VALUES 
(617, 'Leonard Hofstadter'),       -- Character with ID 617: Leonard Hofstadter
(618, 'Sheldon Cooper'),           -- Character with ID 618: Sheldon Cooper
(819, 'Penny Hofstadter'),         -- Character with ID 819: Penny Hofstadter
(320, 'Howard Wolowitz'),          -- Character with ID 320: Howard Wolowitz
(721, 'Raj Koothrappali'),         -- Character with ID 721: Raj Koothrappali
(322, 'Amy Farrah Fowler'),        -- Character with ID 322: Amy Farrah Fowler
(423, 'Bernadette Rostenkowski'),  -- Character with ID 423: Bernadette Rostenkowski
(524, 'Dr. Beverly Hofstadter'),   -- Character with ID 524: Dr. Beverly Hofstadter
(125, 'Young Sheldon');           -- Character with ID 125: Young Sheldon

-- The Big Bang Theory
-- Actor-Character Relationship
INSERT INTO actor_character (actor_id, character_id) VALUES 
(317, 617),  -- Actor 317 as Character 617
(418, 618),  -- Actor 418 as Character 618
(619, 819),  -- Actor 619 as Character 819
(820, 320),  -- Actor 820 as Character 320
(221, 721),  -- Actor 221 as Character 721
(122, 322),  -- Actor 122 as Character 322
(323, 423),  -- Actor 323 as Character 423
(424, 524),  -- Actor 424 as Character 524
(725, 125);  -- Actor 725 as Character 125

-- Casting information
INSERT INTO episode_cast (series_id, episode_id, season_id, actor_id, character_id) VALUES
(20, 10, 12, 317, 617),  -- Actor 317 as Character 617 in Episode 10, Season 12 of Series 20
(20, 10, 12, 418, 618),  -- Actor 418 as Character 618 in Episode 10, Season 12 of Series 20
(20, 10, 12, 619, 819),  -- Actor 619 as Character 819 in Episode 10, Season 12 of Series 20
(20, 10, 12, 820, 320),  -- Actor 820 as Character 320 in Episode 10, Season 12 of Series 20
(20, 10, 12, 221, 721),  -- Actor 221 as Character 721 in Episode 10, Season 12 of Series 20
(20, 10, 12, 122, 322),  -- Actor 122 as Character 322 in Episode 10, Season 12 of Series 20
(20, 10, 12, 323, 423),  -- Actor 323 as Character 423 in Episode 10, Season 12 of Series 20
(20, 10, 12, 424, 524),  -- Actor 424 as Character 524 in Episode 10, Season 12 of Series 20
(20, 10, 12, 725, 125),  -- Actor 725 as Character 125 in Episode 10, Season 12 of Series 20
(20, 11, 12, 317, 617),  -- Actor 317 as Character 617 in Episode 11, Season 12 of Series 20
(20, 11, 12, 418, 618),  -- Actor 418 as Character 618 in Episode 11, Season 12 of Series 20
(20, 11, 12, 619, 819),  -- Actor 619 as Character 819 in Episode 11, Season 12 of Series 20
(20, 11, 12, 820, 320),  -- Actor 820 as Character 320 in Episode 11, Season 12 of Series 20
(20, 11, 12, 221, 721),  -- Actor 221 as Character 721 in Episode 11, Season 12 of Series 20
(20, 11, 12, 122, 322),  -- Actor 122 as Character 322 in Episode 11, Season 12 of Series 20
(20, 11, 12, 323, 423),  -- Actor 323 as Character 423 in Episode 11, Season 12 of Series 20
(20, 11, 12, 424, 524),  -- Actor 424 as Character 524 in Episode 11, Season 12 of Series 20
(20, 12, 12, 317, 617),  -- Actor 317 as Character 617 in Episode 12, Season 12 of Series 20
(20, 12, 12, 418, 618),  -- Actor 418 as Character 618 in Episode 12, Season 12 of Series 20
(20, 12, 12, 619, 819),  -- Actor 619 as Character 819 in Episode 12, Season 12 of Series 20
(20, 12, 12, 820, 320),  -- Actor 820 as Character 320 in Episode 12, Season 12 of Series 20
(20, 12, 12, 221, 721),  -- Actor 221 as Character 721 in Episode 12, Season 12 of Series 20
(20, 12, 12, 122, 322),  -- Actor 122 as Character 322 in Episode 12, Season 12 of Series 20
(20, 12, 12, 323, 423),  -- Actor 323 as Character 423 in Episode 12, Season 12 of Series 20
(20, 12, 12, 424, 524);  -- Actor 424 as Character 524 in Episode 12, Season 12 of Series 20

-- Young Sheldon
-- Actors
INSERT INTO actor (actor_id, name) VALUES 
(827, 'Zoe Perry'),          -- Actor with ID 827: Zoe Perry
(728, 'Lance Barber'),      -- Actor with ID 728: Lance Barber
(629, 'Montana Jordan'),    -- Actor with ID 629: Montana Jordan
(830, 'Raegan Revord');     -- Actor with ID 830: Raegan Revord

-- Characters
INSERT INTO tv_character (character_id, name) VALUES 
(927, 'Mary Cooper'),        -- Character with ID 927: Mary Cooper
(428, 'George Cooper'),      -- Character with ID 428: George Cooper
(529, 'Georgie Cooper'),     -- Character with ID 529: Georgie Cooper
(330, 'Missy Cooper');       -- Character with ID 330: Missy Cooper

INSERT INTO actor_character (actor_id, character_id) VALUES 
(725, 618),  -- Actor 725 as Character 618
(827, 927),  -- Actor 827 as Character 927
(728, 428),  -- Actor 728 as Character 428
(629, 529),  -- Actor 629 as Character 529
(830, 330);  -- Actor 830 as Character 330

-- Casting information
INSERT INTO episode_cast (series_id, episode_id, season_id, actor_id, character_id) VALUES
(21, 1, 1, 725, 618),  -- Actor 725 as Character 618 in Episode 1, Season 1 of Series 21
(21, 1, 1, 827, 927),  -- Actor 827 as Character 927 in Episode 1, Season 1 of Series 21
(21, 1, 1, 830, 330),  -- Actor 830 as Character 330 in Episode 1, Season 1 of Series 21
(21, 2, 1, 725, 618),  -- Actor 725 as Character 618 in Episode 2, Season 1 of Series 21
(21, 2, 1, 827, 927),  -- Actor 827 as Character 927 in Episode 2, Season 1 of Series 21
(21, 2, 1, 728, 428),  -- Actor 728 as Character 428 in Episode 2, Season 1 of Series 21
(21, 2, 1, 629, 529),  -- Actor 629 as Character 529 in Episode 2, Season 1 of Series 21
(21, 3, 1, 725, 618),  -- Actor 725 as Character 618 in Episode 3, Season 1 of Series 21
(21, 3, 1, 827, 927),  -- Actor 827 as Character 927 in Episode 3, Season 1 of Series 21
(21, 3, 1, 629, 529),  -- Actor 629 as Character 529 in Episode 3, Season 1 of Series 21
(21, 3, 1, 830, 330);  -- Actor 830 as Character 330 in Episode 3, Season 1 of Series 21

-- Supernatural
-- Actors
INSERT INTO actor (actor_id, name) VALUES 
(356, 'Jared Padalecki'),  -- Actor with ID 356: Jared Padalecki
(346, 'Jensen Ackles'),    -- Actor with ID 346: Jensen Ackles
(347, 'Misha Collins');    -- Actor with ID 347: Misha Collins

-- Characters
INSERT INTO tv_character (character_id, name) VALUES 
(758, 'Sam Winchester'),   -- Character with ID 758: Sam Winchester
(864, 'Dean Winchester'),  -- Character with ID 864: Dean Winchester
(952, 'Castiel');          -- Character with ID 952: Castiel


