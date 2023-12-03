CREATE TABLE address (
 address_id INT NOT NULL,
 zip_code VARCHAR(500) NOT NULL,
 city VARCHAR(500) NOT NULL,
 street_name VARCHAR(500) NOT NULL
);

ALTER TABLE address ADD CONSTRAINT PK_address PRIMARY KEY (address_id);


CREATE TABLE contact_detail (
 contact_detail_id INT NOT NULL,
 value VARCHAR(500) NOT NULL
);

ALTER TABLE contact_detail ADD CONSTRAINT PK_contact_detail PRIMARY KEY (contact_detail_id);


CREATE TABLE difficulty (
 difficulty_id INT NOT NULL,
 value VARCHAR(500) NOT NULL CHECK (value IN ('Beginner', 'Intermediate', 'Advance'))
);

ALTER TABLE difficulty ADD CONSTRAINT PK_difficulty PRIMARY KEY (difficulty_id);


CREATE TABLE genre_type (
 genre_type_id INT NOT NULL,
 value VARCHAR(500) NOT NULL
);

ALTER TABLE genre_type ADD CONSTRAINT PK_genre_type PRIMARY KEY (genre_type_id);


CREATE TABLE instrument_type (
 instrument_type_id INT NOT NULL,
 value VARCHAR(500) NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instrument_type_id);


CREATE TABLE person (
 person_id INT NOT NULL,
 person_number VARCHAR(500) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE person_contact_detail (
 person_id INT NOT NULL,
 contact_detail_id INT NOT NULL
);

ALTER TABLE person_contact_detail ADD CONSTRAINT PK_person_contact_detail PRIMARY KEY (person_id,contact_detail_id);


CREATE TABLE pricing_scheme (
 pricing_scheme_id INT NOT NULL,
 discount_percent INT NOT NULL,
 student_price INT NOT NULL,
 instructor_price INT NOT NULL
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (pricing_scheme_id);


CREATE TABLE student (
 student_id INT NOT NULL,
 address_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE contact_person (
 contact_person_id INT NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (contact_person_id);


CREATE TABLE contact_person_relation (
 contact_person_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE contact_person_relation ADD CONSTRAINT PK_contact_person_relation PRIMARY KEY (contact_person_id,student_id);


CREATE TABLE instructor (
 instructor_id INT NOT NULL,
 address_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instrument (
 instrument_id INT NOT NULL,
 instrument_type_id INT NOT NULL,
 serial_number VARCHAR(500) NOT NULL,
 brand VARCHAR(500) NOT NULL,
 quantity INT NOT NULL,
 rental_price INT NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE lesson_type (
 lesson_type_id INT NOT NULL,
 value VARCHAR(500) NOT NULL CHECK (value IN ('Group', 'Private', 'Ensemble')),
 pricing_scheme_id INT NOT NULL,
 instrument_type_id INT,
 genre_type_id INT,
 difficulty_id INT
);

ALTER TABLE lesson_type ADD CONSTRAINT PK_lesson_type PRIMARY KEY (lesson_type_id);


CREATE TABLE rental (
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL
);

-- Function to check the number of rentals for a student and the rental period
CREATE OR REPLACE FUNCTION check_max_rentals()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        (SELECT COUNT(*) FROM rental WHERE student_id = NEW.student_id) > 2
    ) THEN
        RAISE EXCEPTION 'A student cannot have more than 2 rentals';
    END IF;
    IF (
        NEW.end_date > NEW.start_date + INTERVAL '1 year'
    ) THEN
        RAISE EXCEPTION 'The rental period cannot be more than 1 year';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to enforce the maximum number of rentals
CREATE TRIGGER max_rentals_trigger
BEFORE INSERT OR UPDATE ON rental
FOR EACH ROW EXECUTE FUNCTION check_max_rentals();

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (student_id,instrument_id);


CREATE TABLE sibling (
 sibling_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (sibling_id);


CREATE TABLE sibling_relation (
 sibling_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE sibling_relation ADD CONSTRAINT PK_sibling_relation PRIMARY KEY (sibling_id,student_id);


CREATE TABLE can_teach_instrument (
 instructor_id INT NOT NULL,
 instrument_type_id INT NOT NULL
);

ALTER TABLE can_teach_instrument ADD CONSTRAINT PK_can_teach_instrument PRIMARY KEY (instructor_id,instrument_type_id);


CREATE TABLE lesson (
 lesson_id INT NOT NULL,
 start_time TIMESTAMP(6) NOT NULL,
 end_time TIMESTAMP(6) NOT NULL,
 minimum_of_students INT NOT NULL,
 max_of_students INT NOT NULL,
 instructor_id INT NOT NULL,
 lesson_type_id INT NOT NULL
);

-- Function to check for overlapping lessons for the same instructor
CREATE OR REPLACE FUNCTION check_instructor_schedule()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        EXISTS (
            SELECT 1
            FROM lesson l1, lesson l2
            WHERE
                l1.instructor_id = NEW.instructor_id
                AND l1.lesson_id <> NEW.lesson_id
                AND (
                    (NEW.start_time, NEW.end_time) OVERLAPS (l2.start_time, l2.end_time)
                )
        )
    ) THEN
        RAISE EXCEPTION 'Instructor cannot be scheduled for two lessons at the same time';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Attach the trigger to the lesson table
CREATE TRIGGER check_instructor_schedule_trigger
BEFORE INSERT OR UPDATE ON lesson
FOR EACH ROW EXECUTE FUNCTION check_instructor_schedule();

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE lesson_booking (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE lesson_booking ADD CONSTRAINT PK_lesson_booking PRIMARY KEY (student_id,lesson_id);


ALTER TABLE person_contact_detail ADD CONSTRAINT FK_person_contact_detail_0 FOREIGN KEY (contact_detail_id) REFERENCES contact_detail (contact_detail_id);
ALTER TABLE person_contact_detail ADD CONSTRAINT FK_person_contact_detail_1 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (student_id) REFERENCES person (person_id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (address_id) REFERENCES address (address_id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (contact_person_id) REFERENCES person (person_id);


ALTER TABLE contact_person_relation ADD CONSTRAINT FK_contact_person_relation_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (contact_person_id);
ALTER TABLE contact_person_relation ADD CONSTRAINT FK_contact_person_relation_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (instructor_id) REFERENCES person (person_id);
ALTER TABLE instructor ADD CONSTRAINT FK_instructor_1 FOREIGN KEY (address_id) REFERENCES address (address_id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);


ALTER TABLE lesson_type ADD CONSTRAINT FK_lesson_type_0 FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (pricing_scheme_id);
ALTER TABLE lesson_type ADD CONSTRAINT FK_lesson_type_1 FOREIGN KEY (genre_type_id) REFERENCES genre_type (genre_type_id);
ALTER TABLE lesson_type ADD CONSTRAINT FK_lesson_type_2 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE lesson_type ADD CONSTRAINT FK_lesson_type_3 FOREIGN KEY (difficulty_id) REFERENCES difficulty (difficulty_id);


ALTER TABLE rental ADD CONSTRAINT FK_rental_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE rental ADD CONSTRAINT FK_rental_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (sibling_id) REFERENCES student (student_id);


ALTER TABLE sibling_relation ADD CONSTRAINT FK_sibling_relation_0 FOREIGN KEY (sibling_id) REFERENCES sibling (sibling_id);
ALTER TABLE sibling_relation ADD CONSTRAINT FK_sibling_relation_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE can_teach_instrument ADD CONSTRAINT FK_can_teach_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE can_teach_instrument ADD CONSTRAINT FK_can_teach_instrument_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (lesson_type_id) REFERENCES lesson_type (lesson_type_id);


ALTER TABLE lesson_booking ADD CONSTRAINT FK_lesson_booking_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE lesson_booking ADD CONSTRAINT FK_lesson_booking_1 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


