/* Project - 5: Create a new database based on the schema diagram */

-- Create the human_clinic database

CREATE DATABASE human_clinic;

-- Create the medical_histories table

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
	admitted_at TIMESTAMP,
	patient_id INT,
	status VARCHAR(100),
	PRIMARY KEY(id)
);

-- Create patients table

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	date_of_birth DATE,
	PRIMARY KEY(id)
);

-- Create treatments table

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
	type VARCHAR(100),
	name VARCHAR(100),
	PRIMARY KEY(id)
);

-- Create invoices table

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
	total_amount DECIMAL(8, 2),
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT,
	PRIMARY KEY(id)
);

-- Create invoice_items

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
	unit_price DECIMAL(8, 2),
	quantity INT,
	total_price DECIMAL(8, 2),
	invoice_id INT,
	treatment_id INT,
	PRIMARY KEY(id)
);

-- Add foreign keys

-- Add foreign key connecting patients and medical_histories

ALTER TABLE medical_histories
ADD CONSTRAINT fk_patient_id
FOREIGN KEY(patient_id)
REFERENCES patients(id);

-- Add foreign key connecting invoices and medical_histories

ALTER TABLE invoices
ADD CONSTRAINT fk_medical_history_id
FOREIGN KEY(medical_history_id)
REFERENCES medical_histories(id);

ALTER TABLE invoices
ADD CONSTRAINT unique_medical_history_id
UNIQUE (medical_history_id);

-- Add foreign key connecting invoices and treatments

ALTER TABLE invoice_items
ADD CONSTRAINT fk_treatment_id
FOREIGN KEY(treatment_id)
REFERENCES treatments(id);

-- Add foreign key connecting invoices and invoice_items

ALTER TABLE invoice_items
ADD CONSTRAINT fk_invoice_id
FOREIGN KEY(invoice_id)
REFERENCES invoices(id);
