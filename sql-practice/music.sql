-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;

DROP TABLE IF EXISTS instruments;

DROP TABLE IF EXISTS musicians;

DROP TABLE IF EXISTS bands;

DROP TABLE IF EXISTS musician_instruments;

CREATE TABLE
  bands (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100)
  );

CREATE TABLE
  musicians (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    band_id INTEGER,
    FOREIGN KEY (band_id) REFERENCES bands (id)
  );

CREATE TABLE
  instruments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type VARCHAR(100) NOT NULL
  );

CREATE TABLE
  musician_instruments (
    musician_id INTEGER,
    instrument_id INTEGER,
    FOREIGN KEY (musician_id) REFERENCES musicians(id),
    FOREIGN KEY (instrument_id) REFERENCES instruments(id)
  );

INSERT INTO bands (name)
VALUES
('cyber coderz');

INSERT INTO musicians (first_name, last_name, band_id)
VALUES
('Charles', 'Oller', 1),
('Max', 'Fonda', 1);

INSERT INTO instruments (type)
VALUES
('drums'),
('bass');
