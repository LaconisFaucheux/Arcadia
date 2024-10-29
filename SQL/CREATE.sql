-- Créer la base de données si elle n'existe pas
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Arcadia')
BEGIN
    CREATE DATABASE Arcadia;
END

USE Arcadia;

-- Supprimer les tables si elles existent
IF OBJECT_ID('ZooServices', 'U') IS NOT NULL DROP TABLE ZooServices;
IF OBJECT_ID('Reviews', 'U') IS NOT NULL DROP TABLE Reviews;
IF OBJECT_ID('OpeningHours', 'U') IS NOT NULL DROP TABLE OpeningHours;
IF OBJECT_ID('WeightUnits', 'U') IS NOT NULL DROP TABLE WeightUnit;
IF OBJECT_ID('Healths', 'U') IS NOT NULL DROP TABLE Healths;
IF OBJECT_ID('SizeUnits', 'U') IS NOT NULL DROP TABLE SizeUnits;
IF OBJECT_ID('Diets', 'U') IS NOT NULL DROP TABLE Diets;
IF OBJECT_ID('Speciess', 'U') IS NOT NULL DROP TABLE Speciess;
IF OBJECT_ID('Habitats', 'U') IS NOT NULL DROP TABLE Habitats;
IF OBJECT_ID('HabitatImages', 'U') IS NOT NULL DROP TABLE HabitatImages;
IF OBJECT_ID('SpeciesHabitats', 'U') IS NOT NULL DROP TABLE SpeciesHabitats;
IF OBJECT_ID('Animals', 'U') IS NOT NULL DROP TABLE Animals;
IF OBJECT_ID('AnimalImages', 'U') IS NOT NULL DROP TABLE AnimalImages;
IF OBJECT_ID('VetVisits', 'U') IS NOT NULL DROP TABLE VetVisits;
IF OBJECT_ID('EmployeeFeedings', 'U') IS NOT NULL DROP TABLE EmployeeFeedings;

-- Créer la table ZooServices
CREATE TABLE ZooServices (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    FullPrice REAL NOT NULL,
    ChildPrice REAL NOT NULL,
    Pic VARCHAR(150) NOT NULL
);

-- Créer la table Reviews
CREATE TABLE Reviews (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Pseudo VARCHAR(100) NOT NULL,
    Content TEXT NOT NULL,
    IsValidated BIT NOT NULL,
    Note TINYINT NOT NULL,
);

-- Créer la table OpeningHours
CREATE TABLE OpeningHours(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	DayOfWeek VARCHAR(10) NOT NULL,
	MorningOpening TIME,
	MorningClosing TIME,
	AfternoonOpening TIME,
	AfternoonClosing TIME
)

--Créer la table WeightUnits
CREATE TABLE WeightUnits(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(20) NOT NULL,
    Abbr NVARCHAR(2) NOT NULL
)

--Créer la table Healths
CREATE TABLE Healths(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    State NVARCHAR(20)
)

--Creér la table SizeUnits
CREATE TABLE SizeUnits(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(20) NOT NULL,
    Abbr NVARCHAR(2) NOT NULL
)

--Créer la table Diets
CREATE TABLE Diets(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL    
)

--Créer la table Speciess
CREATE TABLE Speciess(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(150) NOT NULL,
    ScientificName NVARCHAR(150) NOT NULL,
    Description TEXT NOT NULL,
    MaleMaxSize REAL NOT NULL,
    FemaleMaxSize REAL,
    MaleMaxWeight REAL NOT NULL,
    FemaleMaxWeight REAL,
    IdSizeUnit INT NOT NULL,
    IdWeightUnit INT NOT NULL,
    Lifespan TINYINT NOT NULL,
    IdDiet INT NOT NULL
    FOREIGN KEY (IdSizeUnit) REFERENCES SizeUnits(Id),
    FOREIGN KEY (IdWeightUnit) REFERENCES WeightUnits(Id),
    FOREIGN KEY (IdDiet) REFERENCES Diets(Id)
)

--Créer la table Habitats
CREATE TABLE Habitats(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Description TEXT NOT NULL
)

--Créer la table HabitatImages
CREATE TABLE HabitatImages(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Slug NVARCHAR(150),
    IdHabitat INT NOT NULL,
    MiniSlug NVARCHAR(150)
)

--Créer la table SpeciesHabitats
CREATE TABLE SpeciesHabitats(
    IdSpecies INT NOT NULL,
    IdHabitat INT NOT NULL,
    PRIMARY KEY (IdSpecies, IdHabitat),
    FOREIGN KEY(IdSpecies) REFERENCES Speciess(Id),
    FOREIGN KEY(IdHabitat) REFERENCES Habitats(Id)
)

--Créer la table Animals
CREATE TABLE Animals(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    IsMale BIT NOT NULL,
    IdSpecies INT NOT NULL,
    IdHealth INT NOT NULL,
    FOREIGN KEY(IdSpecies) REFERENCES Speciess(Id),
    FOREIGN KEY(IdHealth) REFERENCES Healths(Id),
)

--Créer la table AnimalImages
CREATE TABLE AnimalImages(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Slug NVARCHAR(150) NOT NULL,
    IdAnimal INT NOT NULL,
    MiniSlug NVARCHAR(150),
    FOREIGN KEY(IdAnimal) REFERENCES Animals(Id)
)

--Créer la table VetVisits
CREATE TABLE VetVisits(    
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Food NVARCHAR(200) NOT NULL,
    FoodWeight REAL NOT NULL,
    IdWeightUnit INT NOT NULL,
    VisitDate DATE NOT NULL,
    Observations TEXT NOT NULL,
    IdAnimal INT NOT NULL,
    IdVet INT NOT NULL,
    FOREIGN KEY(IdWeightUnit) REFERENCES WeightUnits(Id),
    FOREIGN KEY (IdAnimal) REFERENCES Animals(Id)
)

--Créer la table EmployeeFeedings
CREATE TABLE EmployeeFeedings(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    EmployeeEmail TEXT NOT NULL,
    IdAnimal INT NOT NULL,
    Food TEXT NOT NULL,
    Date DATE NOT NULL,
    Weight FLOAT NOT NULL,
    IdWeightUnit INT NOT NULL,
    FOREIGN KEY(IdAnimal) REFERENCES Animals(Id),
    FOREIGN KEY(IdWeightUnit) REFERENCES WeightUnits(Id)
)