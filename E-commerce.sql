create database Ecommerce 
use Ecommerce
show tables (//to check tables in database)

CREATE TABLE IF NOT EXISTS supplier ( 
SUPP_ID INT NOT NULL, 
SUPP_NAME varchar(50) NOT NULL, 
SUPP_CITY varchar(50) NOT NULL, 
SUPP_PHONE varchar(50) NOT NULL, 
PRIMARY KEY(SUPP_ID));

CREATE TABLE IF NOT EXISTS customer ( 
CUS_ID INT NOT NULL,
 CUS_NAME varchar(20) NOT NULL, 
CUS_PHONE varchar(10) NOT NULL, 
CUS_CITY varchar(30) NOT NULL, 
CUS_GENDER VARCHAR (2) NOT NULL, 
PRIMARY KEY(CUS_ID));

CREATE TABLE IF NOT EXISTS category ( 
CAT_ID INT NOT NULL, 
CAT_NAME varchar(20) NOT NULL, 
PRIMARY KEY (CAT_ID));

CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID)
REFERENCES category(CAT_ID));

Create Table supplier_pricing (
    PRICING_ID INT NOT NULL,
    PRIMARY KEY (PRICING_ID),
    PRO_ID INT NOT NULL,
    FOREIGN KEY (PRO_ID) REFERENCES product (PRO_ID),
    SUPP_ID INT NOT NULL,
    FOREIGN KEY (SUPP_ID) REFERENCES supplier (SUPP_ID),
    SUPP_PRICE INT DEFAULT (0));

CREATE TABLE IF NOT EXISTS order1(
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
PRIMARY KEY (ORD_ID),
CUS_ID INT NOT NULL,
FOREIGN KEY (CUS_ID) REFERENCES customer (CUS_ID),
PRICING_ID INT NOT NULL,
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing (PRICING_ID));

CREATE TABLE rating ( 
RAT_ID INT NOT NULL,  
PRIMARY KEY (RAT_ID), 
ORD_ID INT NOT NULL, 
foreign key (ORD_ID) references order1 (ORD_ID),
RAT_RATSTARS INT NOT NULL )

insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values ('1' ,'Rajesh Retails', 'Delhi' , '1234567890');
insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values ('2', 'Appario Ltd.', 'Mumbai','258963470');
insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values ('3', 'Knome products', 'Banglore', '9785462315');
insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values ('4', 'Bansal retails', 'kochi', '8975463285');
insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values ('5' ,'Mittal Ltd.', 'Lucknow', '7898456532');

select * from supplier  // to check the details list in database 

insert into customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values ('1', 'AAKASH',  '9999999999', 'DELHI', 'M');
insert into customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values ('2', 'AMAN',  '9785463215', 'NOIDA', 'M');
insert into customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values ('3', 'NEHA',  '9999999999', 'MUMBAI', 'F');
insert into customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values ('4', 'MEGHA',  '9994562399', 'KOLKATA', 'F');
insert into customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values ('5', 'PULKIT',  '7895999999', 'LUCKNOW', 'M');

insert into category (CAT_ID, CAT_NAME) values ('1', 'BOOKS');
insert into category (CAT_ID, CAT_NAME) values ('2', 'GAMES');
insert into category (CAT_ID, CAT_NAME) values ('3', 'GROCERIES');
insert into category (CAT_ID, CAT_NAME) values ('4', 'ELECTRONICS');
insert into category (CAT_ID, CAT_NAME) values ('5', 'CLOTHES');

insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('1', 'GTAV',  'Windows 7 and above with i5 processor and 8GB RAM', '2');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('2', 'TSHIRTS',  'SIZE-L with Black, Blue and White variations', '5');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('3', 'ROG LAPTOP',  'Windows 10 with 15inch screen, i7 processor, 1TB SSD', '4');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('4', 'OATS',  'Highly Nutritious from Nestle', '3');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('5', 'HARRY POTTER',  'Best Collection of all time by J.K Rowling', '1');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('6', 'MILK',  '1L Toned MIlk', '3');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('7', 'BOAT Earphones',  '1.5Meter long Dolby Atmos', '4');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('8', 'Jeans',  'Stretchable Denim Jeans with various sizes and color', '5');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('9', 'Project IGI',  'compatible with windows 7 and above', '2');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('10', 'Hoodie',  'Black GUCCI for 13 yrs and above', '5');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('11', 'Rich Dad Poor Dad',  'Written by RObert Kiyosaki', '1');
insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values ('12', 'Train Your Brain',  'By Shireen Stephen', '1');


insert into supplier_pricing  (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values ('1', '1',  '2', '1500');
insert into supplier_pricing  (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values ('2', '3',  '5', '30000');
insert into supplier_pricing   (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values ('3', '5',  '1', '3000');
insert into supplier_pricing  (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values ('4', '2',  '3', '2500');
insert into supplier_pricing   (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values ('5', '4',  '1', '1000');

insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('101',			'1500',		'2021-10-06','2','1');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('102',			'1000',		'2021-10-12','3','5');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('103',			'30000',	'2021-09-16','5','2');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('104',		        '1500',		'2021-10-05',	'1','1');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('105',		        '3000	',	'2021-08-16',	'4','3');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('106',			'1450	',	'2021-08-18',	'1','9');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('107','789	',	'2021-09-01',	'3','7');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('108','780	',	'2021-09-07',	'5','6');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('109',			'3000	',	'2021-01-10',	'5','3');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('110',			'2500	',	'2021-09-10',	'2','4');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('111',			'1000	',	'2021-09-15',	'4','5');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('112',			'789	',	'2021-09-16',	'4','7');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('113',			'31000	',	'2021-09-16',	'1','8');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('114',			'1000	',	'2021-09-16',	'3','5');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('115',			'3000	',	'2021-09-16',	'5','3');
insert into order1 (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values('116',			'99	',	'2021-09-17',	'2','14');

insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('1', '101', '4');
insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('2', '102', '3');
insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('3', '103', '1');
insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('4', '104', '2');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('5', '105', '4');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('6', '106', '3');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('7', '107', '4');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('8', '108', '4');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('9', '109', '3');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('10', '110', '3');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('11', '111', '4');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('12', '112', '4');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('13', '113', '2');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('14', '114', '1');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('15', '115', '1');
 insert into rating  (RAT_ID, ORD_ID, RAT_RATSTARS) values ('16', '116', '0');


