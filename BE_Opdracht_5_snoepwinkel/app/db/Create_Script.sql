drop database if exists snoepwinkel;
create database snoepwinkel;
use snoepwinkel;

#CREATE ALL TABLES
create table storage(
	id tinyint primary key auto_increment,
    productId tinyint not null,
    packageUnit decimal(3,1) not null,
    inStorage int
)Engine=InnoDB;

create table product(
	id tinyint primary key auto_increment,
    name varchar(30) not null,
    barcode varchar(255) not null unique key
)Engine=InnoDB;

create table productAllergy(
	id tinyint primary key auto_increment,
    productId tinyint not null,
    allergyId tinyint not null
)Engine=InnoDB;

create table allergy(
	id tinyint primary key auto_increment,
    name varchar(30) not null,
    description varchar(255)
)Engine=InnoDB;

create table productSupplier(
	id tinyint primary key auto_increment,
    productId tinyint not null,
    supplierId tinyint not null,
    dateDelivery date not null,
    amount int not null,
    dateNextDelivery date
)Engine=InnoDB;

create table supplier(
	id tinyint primary key auto_increment,
    name varchar(20) not null,
    contactPerson varchar(150) not null,
    supplierNumber varchar(50) not null,
    phone int not null
)Engine=InnoDB;

#INSERT ALL DATA
insert into storage  (productId, packageUnit, 		 inStorage) values
					 (1, 		 5, 				 453),
					 (2, 		 2.5, 				 400),
					 (3, 		 5, 				 1),
					 (4, 		 1, 				 800),
					 (5, 		 3, 				 234),
					 (6, 		 2, 				 345),
					 (7, 		 1, 				 795),
					 (8, 		 10, 				 233),
					 (9, 		 2.5, 				 123),
					 (10, 		 3, 				 null),
					 (11, 		 2, 				 367),
					 (12, 		 1, 				 467),
					 (13, 		 5, 				 20);

insert into product (name, 				barcode) values
					("Mintnopjes", 		8719587231278),
					("Schoolkrijt", 	8719587326713),
					("Honingdrop", 		8719587327836),
					("Zure Beren", 		8719587321441),
					("Cola Flesjes", 	8719587321237),
					("Turtles", 		8719587322245),
					("Witte Muizen", 	8719587328256),
					("Reuzen Slangen", 	8719587325641),
					("Zoute Rijen", 	8719587322739),
					("Winegums", 		8719587327527),
					("Drop Munten", 	8719587322345),
					("Kruis Drop", 		8719587322265),
					("Zoute Ruitjes", 	8719587323256);
                    
insert into productAllergy   (productId, allergyId) values
							 (1, 		 2),
							 (1, 		 1),
							 (1, 		 3),
							 (3, 		 4),
							 (6, 		 5),
							 (9, 		 2),
							 (9, 		 5),
							 (10, 		 2),
							 (12, 		 4),
							 (13, 		 1),
							 (13, 		 4),
							 (13, 		 5);
                             
insert into allergy (name, 				description) values
					("Gluten", 			'Dit product bevat Gluten'),
					("Gelatine", 		'Dit product bevat Gelatine'),
					("AZO-Kleurstof", 	'Dit product bevat AZO-Kleurstof'),
					("Lactose", 		'Dit product bevat Lactose'),
					("Soja", 			'Dit product bevat Soja');
                    
insert into productSupplier (supplierId, productId, dateDelivery, amount, dateNextDelivery) values
							(1, 		 1,			"2023-04-09", 23,	  "2023-04-16"),
							(1, 		 1,			"2023-04-18", 21,	  "2023-04-25"),
							(1, 		 2,			"2023-04-09", 12,	  "2023-04-16"),
							(1, 		 3,			"2023-04-10", 11,	  "2023-04-17"),
							(2, 		 4,			"2023-04-14", 16,	  "2023-04-21"),
							(2, 		 4,			"2023-04-21", 23,	  "2023-04-28"),
							(2, 		 5,			"2023-04-14", 45,	  "2023-04-21"),
							(2, 		 6,			"2023-04-14", 30,	  "2023-04-21"),
							(3, 		 7,			"2023-04-12", 12,	  "2023-04-19"),
							(3, 		 7,			"2023-04-19", 23,	  "2023-04-26"),
							(3, 		 8,			"2023-04-10", 12,	  "2023-04-17"),
							(3, 		 9,			"2023-04-11", 1,	  "2023-04-18"),
							(4, 		 10,		"2023-04-16", 24,	  "2023-04-30"),
							(5, 		 11,		"2023-04-10", 47,	  "2023-04-17"),
							(5, 		 11,		"2023-04-19", 60,	  "2023-04-26"),
							(5, 		 12,		"2023-04-11", 45,	  null),
							(5, 		 13,		"2023-04-12", 23,	  null);
                            
insert into supplier (name, 			contactPerson, 			supplierNumber, 	phone) values
					 ("Venco", 			"Bert van Linge", 		"L1029384719", 		0628493827),
					 ("Astra Sweets", 	"Jasper del Monte", 	"L1029284315", 		0639398734),
					 ("Haribo", 		"Sven Stalman", 		"L1029324748", 		0624383291),
					 ("Basset", 		"Joyce Stelterberg", 	"L1023845773", 		0648293823),
					 ("De Bron", 		"Remco Veenstra", 		"L1023857736", 		0634291234);
                     

#ALTER TABLES
alter table storage
add foreign key (productId) references product(id);

alter table productAllergy
add foreign key (productId) references product(id),
add foreign key (allergyId) references allergy(id);

alter table productSupplier
add foreign key (supplierId) references supplier(id),
add foreign key (productId) references product(id);