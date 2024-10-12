USE garage_parrot2;

SELECT v.denomination, v.kilometrage, v.production_year, v.price, v.seats, b.brand_name, f.fuel
FROM vehicle v
LEFT JOIN brand b ON b.id = v.car_brand
LEFT JOIN fuel f ON f.id = v.car_fuel;

SELECT v.denomination, co.option_name
FROM options_vehicles ov
JOIN car_options co ON ov.option_id = co.id
JOIN vehicle v ON ov.vehicle_id = v.id
WHERE ov.vehicle_id = 1;

SELECT n.note, n.message, n.name
FROM notation n

SELECT v.denomination, ci.img_url
FROM car_imgs ci
JOIN vehicle v ON ci.vehicle_id = v.id
WHERE ci.vehicle_id = 4;

SELECT v.denomination, ct.thumbnails_url
FROM car_thumbnails ct
JOIN vehicle v ON ct.vehicle_id = v.id
WHERE ct.vehicle_id = 2;

SELECT * FROM opening_hours;

SELECT * FROM app_user;