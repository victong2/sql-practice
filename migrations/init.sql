
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    UNIQUE(name, surname)
);

CREATE TABLE care_providers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    UNIQUE(name, surname)
);

CREATE TABLE appointments (
    patient_id INT NOT NULL,
    care_provider_id INT NOT NULL,
    start_datetime TIMESTAMP NOT NULL,
    end_datetime TIMESTAMP NOT NULL,
    PRIMARY KEY (patient_id, care_provider_id),
    CONSTRAINT fk_branch
        FOREIGN KEY(patient_id)
        REFERENCES patients(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_requirement
        FOREIGN KEY(care_provider_id)
        REFERENCES care_providers(id)
        ON DELETE CASCADE
);