/* ****************************************************************************/
/*										              	                      */
/*														                      */
/*	    Bank Database         			      */
/*																		      */
/*	                                            			                  */
/* ****************************************************************************/
USE bank;

/* insert data into account table */

INSERT INTO account VALUES 
  ('A-1011','B-1010',500.00,'savings'), 
  ('A-1021','B-3030',400.00,'Checking'), 
  ('A-2011','B-3030',9000.00,'savings'), 
  ('A-2151','B-4040',7000.00,'Checking'), 
  ('A-2171','B-8080',750.00,'Checking'), 
  ('A-2221','B-2020',700.00,'Checking'), 
  ('A-3051','B-5050',350.00,'savings'), 
  ('A-3331','B-9090',850.00,'Checking'), 
  ('A-4441','B-7070',625.00,'savings'), 
  ('A-7771','B-7070',6625.00,'savings'); 

  
/* insert sample data into borrow table */

INSERT INTO borrow VALUES 
  (1000,'L-1101'), 
  (1033,'L-1401'), 
  (1041,'L-1501'), 
  (1001,'L-1601'), 
  (1015,'L-1701'), 
  (1051,'L-1701'), 
  (1034,'L-2001'), 
  (1033,'L-2101'), 
  (1040,'L-2301'), 
  (1034,'L-9301');


/* insert sample data into BRANCH table */

INSERT INTO branch VALUES 
  ('B-1010','Downtown','San Francisco',4900000), 
  ('B-2020','Santa Clara','Palo Alto',2100000), 
  ('B-3030','Alameda','Albany',1700000), 
  ('B-4040','San Mateo','Redwood City',6000000), 
  ('B-5050','Los Angeles','Avalon',8000000), 
  ('B-6060','Contra Costa','Richmond',9400000), 
  ('B-7070','Sacramento','Sacramento',3700000), 
  ('B-8080','Fresno','Fresno',7000000), 
  ('B-9090','Orange','Orange',5400280);


/* insert sample data into customer table */


INSERT INTO customer VALUES 
  (1000,'Janes','Jeffrey','Jeffrey.Janes@somewhere.com','ng76tG9E','123 W.Elm St','San Mateo','CA','98055','USA','543-2345'), 
  (1001,'Smith','David','David.Smith@somewhere.com','ttr67i23','813 Tumbleweed Lane','Santa Clara','CA','81201','USA','654-9876'), 
  (1015,'Twilight','Tiffany','Tiffany.Twilight@somewhere.com','gr44t5uz','88 1st Avenue','Palo Alto','CA','98260','USA','765-5566'), 
  (1033,'Smathers','Fred','Fred.Smathers@somewhere.com','mnF3D00Q','10899 88th Ave','Foster City','CA','98110','USA','876-9911'), 
  (1034,'Frederickson','Mary Beth','MaryBeth.Frederickson@somewhere.com','Nd5qr4Tv','25 South Lafayette','San Francisco','CA','80201','USA','513-8822'), 
  (1036,'Warning','Selma','Selma.Warning@somewhere.com','CAe3Gh98','205 Burnaby','Vancouver','BC','V6Z 1W2','Canada','988-0512'), 
  (1037,'Wu','Susan','Susan.Wu@somewhere.com','Ues3thQ2','105 Locust Ave','Redwood City','CA','30322','USA','653-3465'), 
  (1040,'Gray','Donald','Donald.Gray@somewhere.com','NULL','55 Bodega Ave','Los Angeles','CA','94923','USA','568-4839'), 
  (1041,'Johnson','Lynda','NULL','NULL','117 C Street','Frenso','CA','20003','USA','438-5498'), 
  (1051,'Wilkens','Chris','Chris.Wilkens@somewhere.com','45QZjx59','87 Highland Drive','Orange','CA','98508','USA','876-8822');

/* insert sample data into credit table */


INSERT INTO credit VALUES 
  (1000,'A-1011'), 
  (1001,'A-1011'), 
  (1033,'A-1021'), 
  (1033,'A-2011'), 
  (1015,'A-2151'), 
  (1037,'A-2171'), 
  (1036,'A-2221'), 
  (1034,'A-3051'), 
  (1040,'A-3331'), 
  (1041,'A-4441'), 
  (1040,'A-7771');
  
  
/* insert sample data into employee table */


INSERT INTO employee VALUES 
  (101,'Alex','John','G','2000-11-08 00:00:00','650-654-9855','B-1010'), 
  (102,'Smith','David','H','1989-07-12 00:00:00','650-765-9876','B-2020'), 
  (103,'Arbough','June','E','1997-12-01 00:00:00','415-654-9996','B-4040'), 
  (104,'Ramoras','Anne','K','1988-11-15 00:00:00','650-456-9876','B-1010'), 
  (105,'Johnson','Alice','K','1994-02-01 00:00:00','718-448-5498','B-9090'), 
  (106,'Smithfield','William',' ','2005-06-22 00:00:00','650-438-5888','B-5050'), 
  (107,'Alonzo','Maria','D','1994-10-10 00:00:00','415-438-5564','B-9090'), 
  (108,'Washington','Ralph','B','1989-08-22 00:00:00','425-444-5498','B-1010'), 
  (109,'Smith','Larry','W','1999-07-18 00:00:00','344-333-5498','B-6060'), 
  (110,'Olenko','Gerald','A','1996-12-11 00:00:00','650-438-5564','B-7070'), 
  (111,'Wabash','Geoff','B','1989-04-04 00:00:00','650-489-5498','B-7070'), 
  (112,'Smithson','Darlene','M','1995-10-23 00:00:00','650-555-5498','B-5050'), 
  (113,'Lee','Delbert','K','1994-11-15 00:00:00','650-888-5498','B-5050'), 
  (114,'Jones','Annelise',' ','1991-08-20 00:00:00','650-478-5498','B-8080'), 
  (115,'Ali','Travis','B','1990-01-25 00:00:00','650-231-5498','B-6060'), 
  (116,'Pratt','Gerald','L','1995-03-05 00:00:00','650-564-5478','B-2020'), 
  (117,'Williams','Angie','H','1994-06-19 00:00:00','650-438-2222','B-3030'), 
  (118,'Matt','James','J','2006-01-04 00:00:00','650-438-2312','B-3030');

  
/* insert sample data into LOAN table */

INSERT INTO loan VALUES 
  ('L-1101','B-5050',900.00,4.5), 
  ('L-1401','B-1010',1500.00,2.5), 
  ('L-1501','B-3030',1500.00,2.5), 
  ('L-1601','B-3030',1300.00,2.5), 
  ('L-1701','B-1010',1000.00,2.5), 
  ('L-2001','B-7070',7500.00,2.5), 
  ('L-2101','B-9090',570.00,4.5), 
  ('L-2301','B-2020',2000.00,2.5), 
  ('L-9301','B-4040',500.00,4.5);