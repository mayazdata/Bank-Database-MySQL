/* ****************************************************************************/
/*	                                                				          */
/*														                      */
/*	    bank Database         			      */
/*																		      */
/*	                                            			                  */
/* ****************************************************************************/
USE bank; 
/* drop the tables */

DROP TABLE IF EXISTS account; 
DROP TABLE IF EXISTS borrow; 
DROP TABLE IF EXISTS branch; 
DROP TABLE IF EXISTS customer; 
DROP TABLE IF EXISTS credit; 
DROP TABLE IF EXISTS employee; 
DROP TABLE IF EXISTS loan; 

/* create the account table */

CREATE TABLE account ( 
    account_number VARCHAR(6) NOT NULL UNIQUE, 
    branch_number VARCHAR(6) NOT NULL, 
    balance DECIMAL(9,2) NOT NULL, 
    type VARCHAR(10) NOT NULL, 
    PRIMARY KEY (account_number) 
) ENGINE=INNODB; 

/* create the borrow table */

CREATE TABLE borrow( 
	customer_id INT(4) NOT NULL, 
    loan_number VARCHAR(6) NOT NULL  
) ENGINE=INNODB; 

/*  create the branch table */

CREATE TABLE branch ( 
    branch_number VARCHAR(6) PRIMARY KEY,  
    branch_name VARCHAR(30), 
    branch_city VARCHAR(30), 
    assets DECIMAL(30,0)

)  ENGINE=INNODB;


/* create the customer table */

CREATE TABLE customer( 
    customer_id INT(4) NOT NULL, 
    last_name CHAR(20) NOT NULL, 
    first_name CHAR(20) NOT NULL, 
    email_address VARCHAR(100), 
    encrypted_password VARCHAR(100), 
    streer VARCHAR(100) NOT NULL, 
    city VARCHAR(30) NOT NULL, 
    State CHAR(2) NOT NULL, 
    zip_code VARCHAR(10) NOT NULL, 
    country CHAR(10) NOT NULL, 
    phone_number VARCHAR(8) NOT NULL, 
    PRIMARY KEY (customer_id) 
)  ENGINE=INNODB;  

/* create the credit table  */ 

CREATE TABLE credit ( 
    customer_id INT(4) NOT NULL, 
    account_number VARCHAR(6), 
    FOREIGN KEY (account_number) 
        REFERENCES account (account_number) 
)  ENGINE=INNODB; 

/* create the employee table  */

CREATE TABLE employee ( 
    emp_id INT(3) NOT NULL, 
    lname CHAR(30) NOT NULL, 
    fname CHAR(30) NOT NULL, 
    initial CHAR(1), 
    hire_date DATETIME, 
    phone_number VARCHAR(12), 
    branch_number VARCHAR(6) NOT NULL, 
    PRIMARY KEY (emp_id), 
    FOREIGN KEY (branch_number) 
        REFERENCES branch (branch_number) 
)  ENGINE=INNODB;

/* create the loan table  */

CREATE TABLE loan ( 
    loan_number VARCHAR(6) NOT NULL, 
    branch_number VARCHAR(6), 
    amount DECIMAL(10,2) NOT NULL, 
    interest_rate DECIMAL(10,1),  
    PRIMARY KEY (loan_number), 
    FOREIGN KEY (branch_number) 
        REFERENCES branch (branch_number) 
)  ENGINE=INNODB;


-- Correct answer The primary and foreign keys
/* Create table credit */

CREATE TABLE credit
(
	customer_id			INT 		NOT NULL,
	account_number		VARCHAR(6)	NOT NULL,
	CONSTRAINT credit_pk
	  PRIMARY KEY (customer_id, account_number), 
	CONSTRAINT credit_fk_customer
	  FOREIGN KEY (customer_id)
	  REFERENCES customer (customer_id),
    CONSTRAINT credit_fk_account
  	  FOREIGN KEY (account_number)
  	  REFERENCES account (account_number)  
) ENGINE=INNODB;	
	
/* Create table borrow */

CREATE TABLE borrow
(
	customer_id 	INT 		NOT NULL,
	loan_number		VARCHAR(6)	NOT NULL,
	CONSTRAINT borrow_pk
	PRIMARY KEY (customer_id, loan_number),
	CONSTRAINT borrow_fk_customer
	  FOREIGN KEY (customer_id)
	  REFERENCES customer (customer_id),
	CONSTRAINT borrow_fk_loan
	  FOREIGN KEY (loan_number)
	  REFERENCES loan (loan_number)
) ENGINE=INNODB;