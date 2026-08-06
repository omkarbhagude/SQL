
use banking_db;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

select * from Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);  

alter table Accounts add column CustomerID int;

alter table Accounts add constraint fkp_customers foreign key(CustomerID) references Customers (CustomerID);

select * from Accounts

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

select * from Transactions;

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

select * from Transactions;

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

select * from AccountBranches;

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

select * from Loans;

ALTER TABLE Customers
ADD Date_Of_Birth DATE;

select * from Customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

select * from Customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

select * from Accounts;

DROP TABLE AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID); 

ALTER TABLE Accounts
ADD CustomerID INT;

drop database banking_db ;



