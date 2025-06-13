-- DROP DATABASE soti_barber;
CREATE DATABASE soti_barber;
USE soti_barber;


CREATE TABLE user(
	user_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(50),
	lastname VARCHAR(100),
	email VARCHAR(150) UNIQUE NOT NULL,
	password VARCHAR(200) NOT NULL,
	phone VARCHAR(20),
	birth_date DATE,
    description VARCHAR (255),
	avatar VARCHAR(200),
	user_type TINYINT NOT NULL DEFAULT 3,
	user_is_deleted BOOLEAN NOT NULL DEFAULT 0,
	user_is_confirmed BOOLEAN NOT NULL DEFAULT 0,
	user_is_enabled BOOLEAN NOT NULL DEFAULT 0,
	user_has_accepted BOOLEAN NOT NULL DEFAULT 0,
    registered_date DATETIME NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE service(
	service_id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	service_name VARCHAR(60) NOT NULL,
	price DECIMAL (6,2) NOT NULL,  -- 9999.99
    service_description VARCHAR(255) NOT NULL,
    estimated_time TINYINT NOT NULL DEFAULT 0,
    promo_name VARCHAR(30),
	promo_price DECIMAL (6,2), -- 9999.99 	
	promo_start_date DATE,
	promo_end_date DATE,
    service_promo BOOLEAN DEFAULT 0,
    service_avatar VARCHAR(250),
	service_is_enabled BOOLEAN NOT NULL DEFAULT 0,
	service_is_deleted BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE image(
	service_id TINYINT UNSIGNED NOT NULL,
	image_id TINYINT UNSIGNED NOT NULL,
	PRIMARY KEY (service_id, image_id),
	image_name VARCHAR(200) NOT NULL,
	image_is_deleted BOOLEAN NOT NULL DEFAULT 0,
	CONSTRAINT fk_service_1 FOREIGN KEY (service_id)
	REFERENCES service(service_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE appointment(
	appointment_id BIGINT UNSIGNED NOT NULL,
    employee_user_id INT UNSIGNED NOT NULL,
    client_user_id INT UNSIGNED NOT NULL,
	service_id TINYINT UNSIGNED NOT NULL,
    primary key(appointment_id, employee_user_id, client_user_id, service_id),
	created_by_user_id INT UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
    end_date DATE NOT NULL,
	start_hour TIME NOT NULL,
    end_hour TIME NOT NULL,
	observation VARCHAR(255),
	status TINYINT NOT NULL DEFAULT 1, -- 1 - reservado  | 2 - cancelado | 3 - no se ha presentado
    creation_date DATETIME NOT NULL default CURRENT_TIMESTAMP,
	CONSTRAINT fk_user_1 FOREIGN KEY (created_by_user_id)
	REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user_2 FOREIGN KEY (employee_user_id)
	REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user_3 FOREIGN KEY (client_user_id)
	REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_service_2 FOREIGN KEY (service_id)
	REFERENCES service(service_id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO service (service_name, price, estimated_time, service_description) VALUES ("Corte caballero", 10.00, 30, "Corte de caballero con estilo a elección, limpieza de contornos, lavado y peinado. Servicio rápido, preciso y adaptado a tu imagen");
INSERT INTO service (service_name, price, estimated_time, service_description) VALUES ("Rapado", 0.00, 30, "Rapado uniforme o degradado, preciso y rápido. Incluye limpieza de contornos y acabado profesional para un look limpio. Precio varía");
INSERT INTO service (service_name, price, estimated_time, service_description) VALUES ("Recorte de barba", 5.00, 15, "Diseño y arreglo de barba con navaja, contornos definidos, hidratación y acabado con productos especiales. Estilo y cuidado en cada detalle.");
INSERT INTO service (service_name, price, estimated_time, service_description) VALUES ("Cejas", 2.00, 5, "Perfilado de cejas con técnica precisa, limpieza de vello sobrante y definición natural para resaltar tu mirada.");


INSERT INTO user (
    user_name, lastname, email, password, phone, birth_date, description, avatar, user_type, user_is_confirmed, user_is_enabled, user_has_accepted
) VALUES ('Invitado', 'Invitado', 'invitado@invitado.com', 'Invitado.2025', NULL, NULL, 'Cliente ocasional', NULL, 3, 1, 0, 0);



SELECT * FROM user;
SELECT * FROM service;
SELECT * FROM appointment;
SELECT * FROM image;


