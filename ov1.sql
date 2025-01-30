CREATE TABLE borettslag (
    borettslag_id INT AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    antall_hus INT NOT NULL,
    antall_enheter INT NOT NULL,
    etableringsar INT NOT NULL
);
CREATE TABLE bygning (
    bygning_id INT AUTO_INCREMENT PRIMARY KEY,
    borettslag_id INT,
    adresse VARCHAR(255) NOT NULL,
    antall_etasjer INT NOT NULL,
    antall_leiligheter INT NOT NULL,
    FOREIGN KEY (borettslag_id) REFERENCES borettslag(borettslag_id) ON DELETE CASCADE
);
CREATE TABLE leilighet (
    leilighet_id INT AUTO_INCREMENT PRIMARY KEY,
    bygning_id INT,
    etasje INT NOT NULL,
    leilighetsnummer VARCHAR(50) NOT NULL,
    antall_rom INT NOT NULL,
    areal INT NOT NULL,  -- Areal i kvadratmeter
    andelseier_id INT,
    FOREIGN KEY (bygning_id) REFERENCES bygning(bygning_id) ON DELETE CASCADE,
    FOREIGN KEY (andelseier_id) REFERENCES andelseier(andelseier_id) ON DELETE SET NULL
);
CREATE TABLE andelseier (
    andelseier_id INT AUTO_INCREMENT PRIMARY KEY,
    fornavn VARCHAR(255) NOT NULL,
    etternavn VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    telefon VARCHAR(50),
    email VARCHAR(100),
    eier_av_leilighet INT,  -- Referanse til leilighet
    FOREIGN KEY (eier_av_leilighet) REFERENCES leilighet(leilighet_id) ON DELETE SET NULL
);


INSERT INTO borettslag (navn, adresse, antall_hus, antall_enheter, etableringsar)
VALUES ('Bygg & Bo', 'veiveien 42, 1234 Oslo', 3, 50, 1995);

INSERT INTO bygning (borettslag_id, adresse, antall_etasjer, antall_leiligheter)
VALUES (1, 'veiveien 42', 3, 10);


INSERT INTO andelseier (fornavn, etternavn, adresse, telefon, email)
VALUES ('Ola', 'Nordmann', 'veiveien 42, 1234 Oslo', '12345678', 'ola@email.com');


INSERT INTO leilighet (bygning_id, etasje, leilighetsnummer, antall_rom, areal, andelseier_id)
VALUES (1, 2, '2B', 3, 75, 1);


INSERT INTO borettslag (navn, adresse, antall_hus, antall_enheter, etableringsar)
VALUES ('Bygg & Bo', 'veiveien 42, 1234 Oslo', 3, 50, 1995);


INSERT INTO bygning (borettslag_id, adresse, antall_etasjer, antall_leiligheter)
VALUES (1, 'Solveien 12', 3, 10);


INSERT INTO andelseier (fornavn, etternavn, adresse, telefon, email)
VALUES ('Ola', 'Nordmann', 'veiveien 42, 1234 Oslo', '12345678', 'ola@email.com');


INSERT INTO leilighet (bygning_id, etasje, leilighetsnummer, antall_rom, areal, andelseier_id)
VALUES (1, 2, '2B', 3, 75, 1);

