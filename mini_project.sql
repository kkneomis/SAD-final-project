CREATE TABLE CUSTOMER(
  CUST_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  CUST_NAME VARCHAR(100) NOT NULL,
  CUST_ADDRESS VARCHAR(500) NOT NULL,
  CUST_PHONE VARCHAR(20) NOT NULL
);



CREATE TABLE ITEM(
  ITEM_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  ITEM_NAME VARCHAR(100) NOT NULL,
  ITEM_DESCRIPTION VARCHAR(500) NOT NULL,
  ITEM_PRICE DECIMAL NOT NULL,
  ITEM_QOH INTEGER NOT NULL
);


CREATE TABLE STORE(
  STORE_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  STORE_NAME VARCHAR(100) NOT NULL,
  STORE_ADDRESS VARCHAR(500) NOT NULL,
  STORE_PHONE  VARCHAR(20) NOT NULL
);


CREATE TABLE DRIVER(
  DRIVER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  DRIVER_NAME VARCHAR(100) NOT NULL
);


CREATE TABLE COOK(
  COOK_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  COOK_NAME VARCHAR(100) NOT NULL,
  STORE_ID INTEGER NOT NULL,
  FOREIGN KEY(STORE_ID) REFERENCES STORE(STORE_ID)
);

CREATE TABLE RECEIPT(
  RECEIPT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  RECEIPT_DATE CURRENT_DATE,
  RECEIPT_TOTAL DECIMAL NOT NULL,
  DRIVER_ID INTEGER NOT NULL,
  FOREIGN KEY(DRIVER_ID) REFERENCES DRIVER(DRIVER_ID)
);

CREATE TABLE REQUEST(
  ORDER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  ITEM_ID INTEGER NOT NULL,
  CUST_ID INTEGER NOT NULL,
  COOK_ID INTEGER NOT NULL,
  RECEIPT_ID INTEGER NOT NULL,
  ORDER_QUANTITY INTEGER NOT NULL,
  FOREIGN KEY(ITEM_ID) REFERENCES ITEM(ITEM_ID),
  FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(CUST_ID),
  FOREIGN KEY(COOK_ID) REFERENCES COOK(COOK_ID),
  FOREIGN KEY(RECEIPT_ID) REFERENCES RECEIPT(RECEIPT_ID)
);



insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (1, 'Michelle Reed', '661 Summit Lane', '387-(294)599-4621');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (2, 'Jose Sullivan', '35753 Sunnyside Hill', '51-(649)680-1348');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (3, 'Jane Adams', '9 Northview Lane', '92-(488)691-4441');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (4, 'Rachel Perez', '123 Canary Court', '48-(807)972-9508');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (5, 'Walter Hunt', '17264 Crowley Court', '63-(667)489-9047');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (6, 'Pamela Rogers', '4905 Holy Cross Crossing', '7-(122)296-8485');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (7, 'Willie Anderson', '9 Lakeland Way', '30-(989)812-6992');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (8, 'Willie Gilbert', '526 Pennsylvania Pass', '234-(586)836-1314');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (9, 'Paul Carpenter', '740 Kensington Circle', '62-(498)392-0511');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (10, 'Gloria Hughes', '668 Rockefeller Place', '62-(332)510-0030');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (11, 'Wayne Edwards', '6758 Helena Junction', '86-(591)486-5682');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (12, 'Patrick Knight', '79142 Hauk Place', '62-(540)555-9281');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (13, 'Julie Fields', '7486 Buena Vista Place', '504-(148)296-4336');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (14, 'Andrew Cooper', '0 New Castle Drive', '66-(301)526-3957');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (15, 'Craig Williamson', '375 Sherman Terrace', '63-(928)748-0654');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (16, 'Raymond Castillo', '9665 Golden Leaf Hill', '86-(971)700-1931');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (17, 'Craig Wright', '527 Columbus Place', '81-(244)904-2992');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (18, 'Norma Howell', '08 Cambridge Terrace', '7-(164)742-5068');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (19, 'Brenda Lane', '7 Porter Junction', '596-(727)960-3357');
insert into Customer (CUST_ID, CUST_NAME, CUST_ADDRESS, CUST_PHONE) values (20, 'Michelle Duncan', '05 Bluestem Trail', '62-(654)260-1141');


insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (1, 'Calzone', 'Generic Description', '$20.27', 960);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (2, 'Soda', 'Generic Description', '$23.13', 56);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (3, 'Soda', 'Generic Description', '$19.18', 798);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (4, 'Calzone', 'Generic Description', '$10.47', 583);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (5, 'Wings', 'Generic Description', '$23.03', 864);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (6, 'Calzone', 'Generic Description', '$19.05', 329);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (7, 'Pizza', 'Generic Description', '$5.81', 690);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (8, 'Calzone', 'Generic Description', '$20.10', 326);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (9, 'Calzone', 'Generic Description', '$8.88', 946);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (10, 'Pizza', 'Generic Description', '$20.00', 5);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (11, 'Calzone', 'Generic Description', '$9.87', 234);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (12, 'Pizza', 'Generic Description', '$8.08', 501);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (13, 'Soda', 'Generic Description', '$22.85', 141);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (14, 'Wings', 'Generic Description', '$15.61', 621);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (15, 'Wings', 'Generic Description', '$12.18', 449);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (16, 'Pizza', 'Generic Description', '$15.12', 220);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (17, 'Wings', 'Generic Description', '$12.22', 113);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (18, 'Calzone', 'Generic Description', '$9.19', 172);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (19, 'Calzone', 'Generic Description', '$6.99', 652);
insert into Item (ITEM_ID, ITEM_NAME, ITEM_DESCRIPTION, ITEM_PRICE, ITEM_QOH) values (20, 'Wings', 'Generic Description', '$28.26', 580);


insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (1, 'Klayusiwalan', '830 Eggendart Parkway', '62-(758)414-0867');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (2, 'San Isidro', '503 Bartillon Court', '52-(110)570-9576');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (3, 'Tam Bình', '4716 Mayer Court', '84-(765)839-7278');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (4, 'Ferrol', '35155 Thierer Trail', '34-(437)225-6994');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (5, 'Hương Sơn', '68509 Haas Way', '84-(213)902-1203');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (6, 'Grajaú', '9675 Elmside Center', '55-(299)838-7362');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (7, 'Uuemõisa', '8427 Springs Trail', '372-(239)326-6920');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (8, 'Nubma', '44459 Fremont Way', '86-(953)427-3310');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (9, 'Vällingby', '91352 Corscot Avenue', '46-(571)103-0253');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (10, 'Coaraci', '54844 North Plaza', '55-(450)230-5078');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (11, 'Chai Badan', '08 Brown Alley', '66-(269)828-7939');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (12, 'Zaria', '5025 Ridge Oak Trail', '234-(972)344-0300');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (13, 'Baoyang', '1 Artisan Avenue', '86-(597)999-6638');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (14, 'Jutiapa', '6431 Muir Point', '502-(837)287-5944');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (15, 'Benito Juarez', '39560 Mcbride Lane', '52-(694)115-5673');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (16, 'Stockholm', '53121 Arizona Trail', '46-(652)441-9837');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (17, 'Guáimaro', '0408 Northridge Terrace', '53-(536)832-4522');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (18, 'Sukoanyar', '1448 Fairfield Terrace', '62-(531)415-9063');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (19, 'Bhairāhawā', '0964 Katie Point', '977-(701)147-7079');
insert into store (STORE_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONE) values (20, 'Yelets', '208 Farwell Point', '7-(533)771-2039');

insert into driver (DRIVER_ID, DRIVER_NAME) values (1, 'Brandon Wright');
insert into driver (DRIVER_ID, DRIVER_NAME) values (2, 'Evelyn Garcia');
insert into driver (DRIVER_ID, DRIVER_NAME) values (3, 'Mark Jordan');
insert into driver (DRIVER_ID, DRIVER_NAME) values (4, 'Deborah Thompson');
insert into driver (DRIVER_ID, DRIVER_NAME) values (5, 'Karen Mills');
insert into driver (DRIVER_ID, DRIVER_NAME) values (6, 'Carol Flores');
insert into driver (DRIVER_ID, DRIVER_NAME) values (7, 'Janet Marshall');
insert into driver (DRIVER_ID, DRIVER_NAME) values (8, 'Rachel Rodriguez');
insert into driver (DRIVER_ID, DRIVER_NAME) values (9, 'Patricia Powell');
insert into driver (DRIVER_ID, DRIVER_NAME) values (10, 'Earl Wheeler');
insert into driver (DRIVER_ID, DRIVER_NAME) values (11, 'Betty Carr');
insert into driver (DRIVER_ID, DRIVER_NAME) values (12, 'Roger Harvey');
insert into driver (DRIVER_ID, DRIVER_NAME) values (13, 'Katherine Gibson');
insert into driver (DRIVER_ID, DRIVER_NAME) values (14, 'Victor Wagner');
insert into driver (DRIVER_ID, DRIVER_NAME) values (15, 'Robin Ferguson');
insert into driver (DRIVER_ID, DRIVER_NAME) values (16, 'Frances Russell');
insert into driver (DRIVER_ID, DRIVER_NAME) values (17, 'Mary Bell');
insert into driver (DRIVER_ID, DRIVER_NAME) values (18, 'Steven Lee');
insert into driver (DRIVER_ID, DRIVER_NAME) values (19, 'Andrew Gordon');
insert into driver (DRIVER_ID, DRIVER_NAME) values (20, 'Jessica Montgomery');

insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (1, '2016-04-14 20:11:16', '25.88', 18);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (2, '2016-06-29 07:30:37', '63.16', 3);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (3, '2016-08-01 08:35:59', '31.96', 13);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (4, '2016-08-16 15:35:34', '94.62', 20);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (5, '2016-06-13 04:18:57', '97.51', 10);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (6, '2015-12-30 19:35:36', '56.28', 12);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (7, '2016-03-11 06:43:41', '47.00', 4);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (8, '2016-04-19 07:30:51', '53.48', 9);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (9, '2016-09-02 09:41:23', '30.58', 9);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (10, '2016-05-27 03:36:59', '44.95', 11);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (11, '2016-02-24 18:14:50', '41.39', 6);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (12, '2016-09-07 03:52:56', '88.56', 19);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (13, '2016-05-09 08:40:35', '56.26', 3);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (14, '2015-12-30 21:15:10', '47.74', 11);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (15, '2016-08-03 22:05:55', '89.78', 7);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (16, '2015-12-20 08:11:38', '29.45', 5);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (17, '2015-11-29 09:22:32', '88.20', 3);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (18, '2016-07-26 10:42:57', '77.26', 18);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (19, '2016-11-19 22:55:44', '34.26', 4);
insert into receipt (RECEIPT_ID, RECEIPT_DATE, RECEIPT_TOTAL, DRIVER_ID) values (20, '2016-07-21 10:03:57', '20.62', 9);

insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (1, 7, 3, 8, 8, 3);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (2, 9, 19, 13, 11, 41);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (3, 7, 15, 17, 15, 35);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (4, 19, 1, 2, 10, 10);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (5, 20, 3, 14, 10, 49);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (6, 7, 9, 12, 1, 47);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (7, 8, 15, 15, 20, 8);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (8, 12, 8, 2, 1, 36);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (9, 18, 3, 15, 14, 49);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (10, 3, 15, 11, 11, 30);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (11, 2, 19, 12, 20, 27);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (12, 3, 14, 12, 6, 12);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (13, 4, 13, 9, 3, 11);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (14, 4, 10, 8, 19, 40);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (15, 13, 14, 11, 12, 38);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (16, 1, 9, 8, 11, 13);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (17, 8, 9, 13, 13, 16);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (18, 5, 19, 17, 10, 27);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (19, 1, 1, 14, 19, 14);
insert into request (ORDER_ID, ITEM_ID, CUST_ID, COOK_ID, RECEIPT_ID, ORDER_QUANTITY) values (20, 6, 8, 1, 6, 25);


SELECT CUSTOMER.CUST_NAME, CUSTOMER.CUST_PHONE, CUSTOMER.CUST_ADDRESS FROM CUSTOMER WHERE CUSTOMER.CUST_ID =1;

SELECT RECEIPT.DRIVER_ID, RECEIPT.RECEIPT_TOTAL, (RECEIPT.RECEIPT_TOTAL *.06) as TAX, CUSTOMER.CUST_NAME, CUSTOMER.CUST_ADDRESS
FROM RECEIPT, REQUEST, CUSTOMER
WHERE CUSTOMER.CUST_ID = REQUEST.CUST_ID
AND RECEIPT.RECEIPT_ID = REQUEST.RECEIPT_ID
AND CUSTOMER.CUST_ID =1
GROUP BY RECEIPT.RECEIPT_ID;


SELECT DRIVER.DRIVER_NAME FROM RECEIPT, DRIVER
WHERE RECEIPT.DRIVER_ID = DRIVER.DRIVER_ID
AND RECEIPT.RECEIPT_DATE BETWEEN '2016-04-14, 20:11:16' AND '2016-14-14 20:11:16'
GROUP BY DRIVER.DRIVER_ID;

SELECT strftime('%W', RECEIPT.RECEIPT_DATE) WeekNumber, sum(RECEIPT.RECEIPT_TOTAL) as 'Weekly Total'
FROM RECEIPT
GROUP BY WeekNumber;
