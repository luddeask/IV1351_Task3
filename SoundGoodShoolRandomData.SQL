-- Exempeldata för Contact_Detail Tabell
INSERT INTO contact_detail (contact_detail_id, value) VALUES
(1, 'olivia.johnson@gmail.com'),
(2, 'benjamin.smith@yahoo.com'),
(3, 'ava.davis@hotmail.com'),
(4, 'liam.jackson@example.com'),
(5, 'emma.williams@example.com'),
(6, 'noah.anderson@example.com'),
(7, 'mia.jones@example.com'),
(8, 'jackson.taylor@hotmail.com'),
(9, 'sophia.white@gmail.com'),


(10, 'elijah.martinez@hotmail.com'),
(11, 'grace.hernandez@gmail.com'),
(12, 'alexander.garcia@yahoo.com'),
(13, 'ludwig.martinez@example.com'),
(14, 'harry.hernandez@example.com'),
(15, 'christoffer.garcia@example.com'),

(20, 'thomas.rodriguez@example.com'),
(21, 'clara.rodriguez@example.com'),
(22, 'peter.rodriguez@example.com'),
(23, 'karl.rodriguez@example.com'),


(30, 'elijah.martinez.contact@example.com'),
(31, 'grace.hernandez.contact@example.com'),
(32, 'stefan.garcia.contact@example.com'),
(33, 'bo.hernandez.contact@example.com'),
(34, 'mikael.garcia.contact@example.com'),


(35, 'karl.gracia@example.com'),
(36, 'tommy.yamal@example.com'),
(37, 'gerard.pique@example.com');

-- Exempeldata för Person Tabell
INSERT INTO person (person_id, person_number, first_name, last_name) VALUES

--Students--
(1, '030402-1234', 'Olivia', 'Johnson'),
(2, '041214-5678', 'Benjamin', 'Smith'),
(3, '050725-9012', 'Ava', 'Davis'),
(4, '050314-3456', 'Liam', 'Jackson'),
(5, '060614-7890', 'Emma', 'Williams'),
(6, '060725-2345', 'Noah', 'Anderson'),
(7, '060925-8765', 'Mia', 'Jones'),
(8, '070515-4321', 'Jackson', 'Taylor'),
(9, '030725-6789', 'Sophia', 'White'),

(10, '900302-1234', 'Elijah', 'Martinez'),
(11, '910614-5678', 'Grace', 'Hernandez'),
(12, '920725-9012', 'Alexander', 'Garcia'),
(13, '000302-3456', 'Ludwig', 'Martinez'),
(14, '010614-7890', 'Harry', 'Hernandez'),
(15, '020725-2345', 'Christoffer', 'Ga'),

--Instructors--
(20, '831108-6789', 'Thomas', 'Rodriguez'),
(21, '730508-1234', 'Clara', 'Rodriguez'),
(22, '630114-5678', 'Peter', 'Rodriguez'),
(23, '530314-9012', 'Karl', 'Rodriguez'),

--Contact_person--
(30, '801022-4567', 'Elijah', 'Martinez'),
(31, '800904-8901', 'Grace', 'Hernandez'),
(32, '80725-2345', 'Stefan', 'Garcia'),
(33, '800904-6789', 'Bo', 'Hernandez'),
(34, '80725-1234', 'Mikael', 'Garcia'),
(35, '790203-2340', 'Karl', 'Gracia'),
(36, '730103-6740', 'Tommy', 'Yamal'),
(37, '760503-8940', 'Gerard', 'Pique');


-- Exempeldata för Person_Contact_Detail Tabell (Many-to-Many relation mellan Person och Contact_Detail)
INSERT INTO person_contact_detail (person_id, contact_detail_id) VALUES

--Student--
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),

(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),

--Instructor--
(20, 20),
(21, 21),
(22, 22),
(23, 23),

--Contact_person--
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37);


-- Exempeldata för Adress Tabell
INSERT INTO address (address_id, zip_code, city, street_name) VALUES
(1, '12345', 'Stockholm', 'Main Street'),
(2, '54321', 'Stockholm', 'Broadway'),
(3, '67890', 'Stockholm', 'Oak Avenue'),
(4, '98765', 'Stockholm', 'Maple Street'),
(5, '54321', 'Stockholm', 'Sunset Boulevard'),
(6, '67890', 'Stockholm', 'Park Avenue'),
(7, '98765', 'Stockholm', 'Riverside Drive'),
(8, '23456', 'Stockholm', 'Ocean View Street'),
(9, '87654', 'Stockholm', 'Mountain View Road'),
(10, '21098', 'Stockholm', 'Green Valley Lane'),
(11, '34567', 'Stockholm', 'Lakefront Terrace'),
(12, '45678', 'Stockholm', 'Hillside Avenue'),
(13, '56789', 'Stockholm', 'Meadow Lane'),

(14, '11223', 'Stockholm', 'Riverwalk Street'),
(15, '22334', 'Stockholm', 'Harborview Avenue'),
(16, '33445', 'Stockholm', 'Highland Drive'),
(17, '44556', 'Stockholm', 'Lakeside Road'),
(18, '55667', 'Stockholm', 'Sunnyvale Lane');

-- Exempeldata för Student Tabell
INSERT INTO student (student_id, address_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(7, 3),
(8, 4),
(9, 5),

(10, 5),
(11, 5),
(12, 6),
(13, 7),
(14, 7),
(15, 8);


-- Exempeldata för Contact_Person Tabell
INSERT INTO contact_person (contact_person_id) VALUES
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37);


-- Exempeldata för Contact_Person_Relation Tabell (Many-to-Many relation mellan Contact_Person och Student)
INSERT INTO contact_person_relation (contact_person_id, student_id) VALUES
(30, 1),
(30, 2),
(30, 3),
(30, 4),

(31, 5),
(31, 6),

(32, 7),
(32, 8),

(33, 9),
(33, 10),
(33, 11),



(34, 12),
(35, 13),
(36, 14),
(37, 15);



-- Exempeldata för Sibling Tabell
INSERT INTO sibling (sibling_id) VALUES
(1),
(2),
(3),
(4),

(5),
(6),

(7),
(8),

(9),
(10),
(11),
(12);


-- Exempeldata för Sibling_Relation Tabell (Many-to-Many relation mellan Sibling och Student)
INSERT INTO sibling_relation (sibling_id, student_id) VALUES

--4 siblings--
(1, 2),
(2, 1),
(1, 3),
(3, 1),
(1, 4),
(4, 1),
(2, 3),
(3, 2),
(2, 4),
(4, 2),
(3, 4),
(4, 3),

(5, 6),
(6, 5),

(7, 8),
(8, 7),

(9, 10),
(10, 9),
(9, 11),
(11, 9),
(9, 12),
(12, 9),
(10, 11),
(11, 10),
(10, 12),
(12, 10),
(11, 12),
(12, 11);


-- Exempeldata för Instructor Tabell
INSERT INTO instructor (instructor_id, address_id) VALUES
(20, 6),
(21, 7),
(22, 8),
(23, 9);

-- Exempeldata för Instrument_Type Tabell
INSERT INTO instrument_type (instrument_type_id, value) VALUES
(1, 'Guitar'),
(2, 'Piano'),
(3, 'Violin'),
(4, 'Drums'),
(5, 'Flute');


-- Exempeldata för Instrument Tabell
INSERT INTO instrument (instrument_id, instrument_type_id, serial_number, brand, quantity, rental_price) VALUES
(301, 1, 'ABC123', 'Fender', 5, 50),
(302, 2, 'XYZ789', 'Yamaha', 3, 50),
(303, 1, 'XYZ789', 'Yamaha', 9, 60),
(304, 3, 'DEF456', 'Gibson', 7, 60);

-- Exempeldata för Rental Tabell
INSERT INTO rental (student_id, instrument_id, start_date, end_date) VALUES
(6, 301, '2023-11-15', '2023-11-30'),
(6, 302, '2023-11-15', '2024-09-30'),
(7, 302, '2023-11-10', '2024-03-25'),
(8, 303, '2023-11-15', '2024-01-30'),
(9, 304, '2023-11-10', '2023-12-25'),
(10, 301, '2023-11-15', '2024-11-15'),
(11, 302, '2023-11-10', '2023-11-25'),
(12, 303, '2023-11-20', '2023-12-05');


-- Exempeldata för Can_Teach_Instrument Tabell
INSERT INTO can_teach_instrument (instructor_id, instrument_type_id) VALUES
(20, 1),
(20, 2),
(21, 2),
(22, 3),
(23, 4);



-- Exempeldata för Difficulty Tabell
INSERT INTO difficulty (difficulty_id, value) VALUES
(1, 'Beginner'),
(2, 'Intermediate'),
(3, 'Advance');

-- Exempeldata för Genre_Type Tabell
INSERT INTO genre_type (genre_type_id, value) VALUES
(1, 'Rock'),
(2, 'Jazz'),
(3, 'Pop'),
(4, 'Classical');


-- Exempeldata för Pricing_Scheme Tabell
INSERT INTO pricing_scheme (pricing_scheme_id, discount_percent, student_price, instructor_price) VALUES
(1, 10, 50, 100),
(2, 15, 45, 95),
(3, 20, 40, 90),
(4, 12, 55, 80),
(5, 18, 48, 85);


-- Exempeldata för Lesson_Type Tabell
INSERT INTO lesson_type (lesson_type_id, value, pricing_scheme_id, instrument_type_id, genre_type_id, difficulty_id) VALUES
(401, 'Private', 	1, 		1, 		null,		1),
(402, 'Group', 		2,		5, 		null, 		2),
(403, 'Ensemble', 	2,		null, 	3, 			null),
(404, 'Private', 	1, 		1, 		null,		1),
(405, 'Group', 		2,		5, 		null, 		2),
(406, 'Ensemble', 	2,		null, 	3, 			null),

(407, 'Private',    1, 		1,		null,		3),
(408, 'Group',    	2, 		4,		null,		3),
(409, 'Ensemble',   2, 		null,	2,			null),
(410, 'Ensemble',   3, 		null,	4,			null),
(411, 'Ensemble',   5, 		null,	1,			null);

-- Exempeldata för Lesson Tabell
INSERT INTO lesson (lesson_id, start_time, end_time, minimum_of_students, max_of_students, instructor_id, lesson_type_id) VALUES
(501, '2023-09-17 10:00:00', '2023-09-17 12:00:00', 1, 1, 20, 401),
(502, '2023-09-18 15:30:00', '2023-09-18 17:30:00', 1, 1, 21, 401),
(503, '2023-09-19 09:00:00', '2023-09-19 11:00:00', 4, 10, 22, 402),
(504, '2023-09-17 13:00:00', '2023-09-17 15:00:00', 3, 6, 20, 403),
(505, '2023-10-18 15:30:00', '2023-10-18 17:30:00', 4, 8, 21, 403),
(506, '2023-10-19 09:00:00', '2023-10-19 11:00:00', 3, 5, 22, 403),
(507, '2023-10-17 10:00:00', '2023-10-17 12:00:00', 1, 1, 20, 404),
(508, '2023-11-18 15:30:00', '2023-11-18 17:30:00', 2, 6, 21, 405),
(509, '2023-11-19 09:00:00', '2023-11-19 11:00:00', 4, 10, 22, 406),





(510, '2023-12-04 09:00:00', '2023-12-04 11:00:00', 1, 1, 21, 407),
(511, '2023-12-05 09:00:00', '2023-12-05 11:00:00', 2, 7, 21, 408),
(512, '2023-12-05 13:00:00', '2023-12-05 15:00:00', 2, 4, 21, 409),
(513, '2023-12-05 15:00:00', '2023-12-05 17:00:00', 2, 4, 21, 410),
(514, '2023-12-06 09:00:00', '2023-12-06 11:00:00', 4, 6, 21, 409),
(515, '2023-12-06 13:00:00', '2023-12-06 15:00:00', 4, 6, 21, 410),
(516, '2023-12-06 15:00:00', '2023-12-06 17:00:00', 3, 5, 21, 411),
(517, '2023-12-07 15:00:00', '2023-12-07 17:00:00', 2, 4, 21, 411),
(518, '2023-12-08 15:00:00', '2023-12-08 17:00:00', 4, 5, 21, 410);


-- Exempeldata för Lesson_Booking Tabell
INSERT INTO lesson_booking (student_id, lesson_id) VALUES

--Private--
(10, 501),

--Group--
(11, 502),
(12, 502),
(13, 502),

--Ensemble--
(14, 503),
(15, 503),

(5, 501),
(6, 503),



(1, 512),
(2, 512),
(3, 512),
(4, 512),

(5, 513),
(6, 513),
(7, 513),
(8, 513);

