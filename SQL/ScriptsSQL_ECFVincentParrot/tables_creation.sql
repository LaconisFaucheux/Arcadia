USE garage_parrot2;

-- Supprimer les tables si elles existent
IF OBJECT_ID('services', 'U') IS NOT NULL DROP TABLE services;
IF OBJECT_ID('notation', 'U') IS NOT NULL DROP TABLE notation;
IF OBJECT_ID('options_vehicles', 'U') IS NOT NULL DROP TABLE options_vehicles;
IF OBJECT_ID('car_imgs', 'U') IS NOT NULL DROP TABLE car_imgs;
IF OBJECT_ID('car_thumbnails', 'U') IS NOT NULL DROP TABLE car_thumbnails;
IF OBJECT_ID('vehicle', 'U') IS NOT NULL DROP TABLE vehicle;
IF OBJECT_ID('car_options', 'U') IS NOT NULL DROP TABLE car_options;
IF OBJECT_ID('fuel', 'U') IS NOT NULL DROP TABLE fuel;
IF OBJECT_ID('brand', 'U') IS NOT NULL DROP TABLE brand;
IF OBJECT_ID('app_user', 'U') IS NOT NULL DROP TABLE app_user;
IF OBJECT_ID('roles', 'U') IS NOT NULL DROP TABLE roles;
IF OBJECT_ID('opening_hours', 'U') IS NOT NULL DROP TABLE opening_hours;

-- Créer la table roles
CREATE TABLE roles (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nom VARCHAR(50) NOT NULL
);

-- Créer la table app_user avec la clé étrangère
CREATE TABLE app_user (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    app_user_role INT,
    FOREIGN KEY (app_user_role) REFERENCES roles(id) ON DELETE CASCADE
);

-- Créer la table brand
CREATE TABLE brand (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    brand_name VARCHAR(15) NOT NULL
);

-- Créer la table fuel
CREATE TABLE fuel (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    fuel VARCHAR(15) NOT NULL
);

-- Créer la table services
CREATE TABLE services (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    service_name VARCHAR(150) NOT NULL,
    service_description TEXT NOT NULL,
    min_price SMALLINT
);

-- Créer la table car_options
CREATE TABLE car_options (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    option_name VARCHAR(150) NOT NULL
);

-- Créer la table notation avec la clé étrangère
CREATE TABLE notation (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    note TINYINT NOT NULL,
    message TEXT,
	name VARCHAR(150)
);

-- Créer la table vehicle avec les clés étrangères
CREATE TABLE vehicle (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    denomination VARCHAR(50) NOT NULL,
    kilometrage INT NOT NULL,
    production_year SMALLINT NOT NULL,
    price INT NOT NULL,
    seats TINYINT NOT NULL,
    car_brand INT NOT NULL,
    car_fuel INT NOT NULL,
    FOREIGN KEY (car_brand) REFERENCES brand(id) ON DELETE CASCADE,
    FOREIGN KEY (car_fuel) REFERENCES fuel(id) ON DELETE CASCADE
);

-- Créer la table options_vehicles avec les clés étrangères
CREATE TABLE options_vehicles (
    vehicle_id INT NOT NULL,
    option_id INT NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id) ON DELETE CASCADE,
    FOREIGN KEY (option_id) REFERENCES car_options(id) ON DELETE CASCADE,
    PRIMARY KEY (vehicle_id, option_id),
    UNIQUE (vehicle_id, option_id)
);

-- Créer la table car_imgs avec la clé étrangère
CREATE TABLE car_imgs (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    img_url VARCHAR(150),
    vehicle_id INT,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id) ON DELETE CASCADE
);

CREATE TABLE car_thumbnails (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    thumbnails_url VARCHAR(150),
    vehicle_id INT,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id) ON DELETE CASCADE
);

CREATE TABLE opening_hours(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	day_of_week VARCHAR(15),
	morning_opening TIME,
	morning_closing TIME,
	afternoon_opening TIME,
	afternoon_closing TIME
)