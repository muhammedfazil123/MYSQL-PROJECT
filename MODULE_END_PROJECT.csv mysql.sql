CREATE DATABASE library;

USE library;

CREATE TABLE Branch(Branch_no int PRIMARY KEY,
    Manager_Id int,
    Branch_address VARCHAR(25),
    Contact_no VARCHAR(20));

desc Branch;
insert INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
values (1, 101, 'AAA', '7510538657'),
       (2, 102, 'BBB', '7510538658'),
       (3, 103, ' CCC', '7510538659'),
       (4, 104, 'DDD', '7510538654'),
       (5, 105, 'EEE', '7510538544'),
       (6, 106, 'FFF', '7510825687');
       
select * from Branch;
CREATE table Employee(Eml_Id INT PRIMARY KEY,
    Eml_name VARCHAR(25),
    Position VARCHAR(20),
    Salary DECIMAL(10, 2),
    Branch_no int,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));
desc Employee;

INSERT into Employee (Eml_Id, Eml_name, Position, Salary, Branch_no)
values (101, 'Ajmal', 'Manager', 70000, 1),
       (102, ' Abdul', ' it', 50000, 2),
       (103, 'Rashik', 'accountant', 45000, 3),
       (104,'Savad', 'Hr', 30000, 4),
       (105, 'Shahid', 'teacher', 45000, 1),
       (106, 'Thoufi', 'hair cuting', 40000, 1),
       (107, 'Emily', 'it', 35000, 1),
       (108, 'James Wilson', 'Security', 30000, 1),
       (109, 'Jhon', 'dr', 45000, 2),
       (110, 'Alex', 'hr', 45000, 1);

select * from Employee;
CREATE table Books(
    Bkl VARCHAR(30) PRIMARY KEY,
    Book_title VARCHAR(35),
    Category VARCHAR(30),
    Rental_Price DECIMAL(20, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(30),
    Publisher VARCHAR(35));
desc Books;

INSERT into Books (Bkl, Book_title, Category, Rental_Price, Status, Author, Publisher)
values ('978', 'To Kill a Mockingbird', 'Fiction', 10.99, 'yes', 'Harper Lee', 'Harper Perennial'),
       ('977', '1984', 'Science Fiction', 12.99, 'yes', 'George Orwell', 'Penguin Books'),
       ('979', 'The Catcher in the Rye', 'Fiction', 11.99, 'no', 'J.D. Salinger', 'Little, Brown and Company'),
       ('980', 'The cartoon', 'History', 12.99, 'no', 'Sangeeth R', 'Red and Company'),
       ('981', 'Pride and Prejudice', 'Fiction', 9.99, 'yes', 'Jane Austen', 'Penguin Classics'),
       ('982', 'The Great Gatsby', 'Fiction', 11.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
       ('983', 'To the Lighthouse', 'Fiction', 10.99, 'no', 'Virginia Woolf', 'Woolf Publishing');
select * from Books;

CREATE TABLE Customer(
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(25),
    Customer_address VARCHAR(25),
    Reg_date DATE);
desc Customer;


insert INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
values (101, 'Alex', '23 CSK ', '2021-06-13'),
       (102, 'Jhon', '45 KNR nm', '2020-08-03'),
       (103, 'Envik', '56 Tly Pyn', '2023-10-28'),
       (104, 'Vargees', '56 KOK Era','2023-07-08'),
       (105, 'Ramesh', '12 DEL rd', '2021-09-15'),
       (106, 'Sneha pk', '34 MUM st', '2022-01-05'),
       (107, 'thomas', '789 ABC Street', '2021-10-15'),
       (108, 'Ajmal', '456 XYZ Avenue', '2021-12-20');
select * from Customer;
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(25),
    Issue_date DATE,
    Bkl_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Bkl_book) REFERENCES Books(Bkl));
desc IssueStatus;

INSERT into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Bkl_book)
values (1, 101, 'To Kill a Mockingbird', '2024-05-15', '978'),
       (2, 102, '1984', '2024-05-20', '977'),
       (3, 103, 'The Catcher in the Rye', '2024-05-25', '979'),
       (4, 104,'The cartoon','2024-05-10','980'),
       (5, 101, '1984', '2024-06-01', '977'),
       (6, 103, 'To Kill a Mockingbird', '2024-06-05', '978'),
       (7, 102, 'The Catcher in the Rye', '2024-06-10', '979'),
       (8, 104, 'The cartoon', '2024-06-15', '980'),
       (9, 101, 'To Kill a Mockingbird', '2023-06-05', '978'),
       (10, 102, '1984', '2023-06-10', '977');
select * from IssueStatus;

CREATE table ReturnStatus(
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(25),
    Return_date DATE,
    Bkl_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Bkl_book2) REFERENCES Books(Bkl));
  
  desc ReturnStatus;
  
INSERT into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Bkl_book2)
values (1, 101, 'To Kill a Mockingbird', '2024-06-05', '978'),
       (2, 102, '1984', '2024-06-10', '977'),
       (3, 103, 'The Catcher in the Rye', '2024-06-15', '979'),
       (4, 104,'The cartoon', '2024-06-10','980'),
       (5, 105, 'Pride and Prejudice', '2024-06-15', '981'),
       (6, 106, 'The Great Gatsby', '2024-06-20', '982');

select * from ReturnStatus;

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';


SELECT Eml_name, Salary
FROM Employee
ORDER BY Salary DESC;



SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Bkl_book = b.Bkl
JOIN Customer c ON i.Issued_cust = c.Customer_Id;



SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;



SELECT Eml_name, Position
FROM Employee
WHERE Salary > 50000;



SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);



SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;



SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE YEAR(i.Issue_date) = 2023 AND MONTH(i.Issue_date) = 6;



SELECT Book_title
FROM Books
WHERE Category = 'History';




SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;