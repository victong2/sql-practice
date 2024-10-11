
-- Names were generated with Faker

INSERT INTO patients (name, surname) VALUES 
    ('Mary', 'Santiago'),
    ('Holly', 'Freeman'),
    ('Joshua', 'Hodge'),
    ('Cynthia', 'Cruz'),
    ('Harry', 'Potter');

INSERT INTO care_providers (name, surname) VALUES
    ('Thomas', 'Dillon'),
    ('Christopher', 'Oliver'),
    ('Amy', 'Johnson'),
    ('Victor', 'Hugo'),
    ('Alice','Bob');


-- Create function to get next tuesday
CREATE OR REPLACE FUNCTION next_tuesday() RETURNS TIMESTAMP AS $$
BEGIN
  RETURN CURRENT_DATE + INTERVAL '1 day' * (7 - EXTRACT(DOW FROM CURRENT_DATE) + 2);
END;
$$ LANGUAGE plpgsql;

INSERT INTO appointments (patient_id, care_provider_id, start_datetime, end_datetime) VALUES
    (1, 1, next_tuesday() + INTERVAL '10 hours', next_tuesday() + INTERVAL '10 hours 15 minutes'),
    (2, 2, next_tuesday() + INTERVAL '10 hours 15 minutes', next_tuesday() + INTERVAL '10 hours 55 minutes'),
    (3, 3, next_tuesday() + INTERVAL '9 hours 45 minutes', next_tuesday() + INTERVAL '10 hours 15 minutes'),
    (4, 4, next_tuesday() + INTERVAL '9 hours 15 minutes', next_tuesday() + INTERVAL '9 hours 45 minutes'),
    (4, 5, next_tuesday() + INTERVAL '10 hours 50 minutes', next_tuesday() + INTERVAL '11 hours 45 minutes');
