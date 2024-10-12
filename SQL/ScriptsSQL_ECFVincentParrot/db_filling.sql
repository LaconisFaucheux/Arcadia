use garage_parrot2;

INSERT INTO roles (nom) 
	VALUES 
		('admin'),('employee');
        
INSERT INTO app_user (first_name, last_name, app_user_role)
	VALUES
		('Eru', 'Illuvatar', 1),
        ('Manwe', 'Sulimo', 2),
        ('Varda', 'Elentari', 2),
        ('Aule', 'LeForgeron', 2),
        ('Yavanna', 'Kementari', 2),
        ('Orome', 'Aldaron', 2),
        ('Mandos', 'Namo', 2),
        ('Nienna', 'Valie', 2),
        ('Ulmo', 'Seaking', 2)

INSERT INTO brand (brand_name)
	VALUES
		('Opel'), ('Volkswagen'), ('Peugeot'), ('Tesla');
        
INSERT INTO fuel (fuel)
	VALUES
		('Gazole'), ('Essence'), ('Electrique'),('GPL'), ('Hybride');
        
INSERT INTO services (service_name, service_description, min_price)
	VALUES
		('Révision', 'Vidange, changement des filtres, etc etc blablabla', 59),
        ('Diagnostic', 'Diagnostic de pannes avec passage de valise', 29),
        ('Carosserie', 'Réparations, peinture, tout ce qui existe sur les carosseries!', 150);

INSERT INTO car_options (option_name)
	VALUES
		('Climatisation'), ('Toit panoramique'), ('ABS'), ('Bluetooth'),
        ('Régulateur de vitesse'), ('Radar de recul'), ('Radar anti-collision'),
        ('ESP'), ('Régulateur de vitesse adaptatif'), ('Jantes alu');
        
INSERT INTO notation (note, message, name)
	VALUES
		(5, 'Excellent garage, M. Parrot est à l''écoute et propose des services à la fois abordables et haut de gamme.', 'Elessar'),
		(4, 'Bonnes prestations', 'Elrond'),
		(5, 'Merci pour ma carosserie! :-)', 'Beren'),
		(3, 'Un peu déçu par le dépassement de devis, mais les prestations sont de qualités et les employés courtois.', 'Luthien'),
		(5, 'La révision s''est très bien passée, merci beaucoup pour vos précieux conseils!', 'Nienor');

INSERT INTO vehicle (denomination, kilometrage, production_year, price, seats, car_brand, car_fuel)
	VALUES
		('Model Y', 75000, 2021, 29560, 5, 4, 3),
        ('Zafira', 106561, 2017, 15990, 7, 1, 1),
        ('Touran', 98765, 2019, 16990, 7, 2, 2),
        ('5008', 125687, 2015, 7990, 5, 3, 4);
        
INSERT INTO options_vehicles (vehicle_id, option_id)
	VALUES
		(1,1), (1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),
        (2,1), (2,2),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),
        (3,1), (3,2),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),
        (4,1), (4,2),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9);

INSERT INTO car_imgs (img_url, vehicle_id)
	VALUES
		('images/modely_1.jpg', 1), ('images/modely_2.jpg', 1), ('images/modely_3.jpg', 1), ('images/modely_4.jpg', 1),
        ('images/zafira_1.jpg', 2), ('images/zafira_2.jpg', 2), ('images/zafira_3.jpg', 2), ('images/zafira_4.jpg', 2),
        ('images/touran_1.jpg', 3), ('images/touran_2.jpg', 3), ('images/touran_3.jpg', 3), ('images/touran_4.jpg', 3),
        ('images/5008_1.jpg', 4), ('images/5008_2.jpg', 4), ('images/5008_3.jpg', 4), ('images/5008_4.jpg', 4);

INSERT INTO car_thumbnails (thumbnails_url, vehicle_id)
	VALUES
		('images/thumbnails/th_modely_1.jpg', 1), ('images/thumbnails/th_modely_2.jpg', 1), ('images/thumbnails/th_modely_3.jpg', 1), ('images/thumbnails/th_modely_4.jpg', 1),
        ('images/thumbnails/th_zafira_1.jpg', 2), ('images/thumbnails/th_zafira_2.jpg', 2), ('images/thumbnails/th_zafira_3.jpg', 2), ('images/thumbnails/th_zafira_4.jpg', 2),
        ('images/thumbnails/th_touran_1.jpg', 3), ('images/thumbnails/th_touran_2.jpg', 3), ('images/thumbnails/th_touran_3.jpg', 3), ('images/thumbnails/th_touran_4.jpg', 3),
        ('images/thumbnails/th_5008_1.jpg', 4), ('images/thumbnails/th_5008_2.jpg', 4), ('images/thumbnails/th_5008_3.jpg', 4), ('images/thumbnails/th_5008_4.jpg', 4);

INSERT INTO opening_hours (day_of_week, morning_opening, morning_closing, afternoon_opening, afternoon_closing)
	VALUES
		('Lundi', '09:00:00', '12:00:00', '13:00:00', '19:00:00'),
		('Mardi', '09:00:00', '12:00:00', '13:00:00', '19:00:00'),
		('Mercredi', '09:00:00', '12:00:00', '13:00:00', '19:00:00'),
		('Jeudi', '09:00:00', '12:00:00', '13:00:00', '19:00:00'),
		('Vendredi', '09:00:00', '12:00:00', '13:00:00', '19:00:00');
        