-- Cr�er la base de donn�es si elle n'existe pas
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'garage_parrot2')
BEGIN
    CREATE DATABASE garage_parrot2;
END