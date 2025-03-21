USE Activity1Feb05;

DROP TABLE IF EXISTS ORDERLINE;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS [ORDER];

CREATE TABLE [ORDER] (
    Order_ID INT PRIMARY KEY IDENTITY (100, 1),
    Order_Date DATETIME DEFAULT (GETDATE())
);

CREATE TABLE PRODUCT (
    Product_ID INT PRIMARY KEY,
    Product_Description VARCHAR(80),
    Product_Finish VARCHAR(30),
    Standard_Price INT,
    Product_Line_ID INT
);

CREATE TABLE ORDERLINE (
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Ordered_Quantity INT NOT NULL,
    CONSTRAINT FK_Order FOREIGN KEY (Order_ID) REFERENCES [ORDER] (Order_ID),
	CONSTRAINT FK_Product FOREIGN KEY (Product_ID) REFERENCES PRODUCT (Product_ID)
);

ALTER TABLE ORDERLINE
ADD CONSTRAINT PK_Orderline PRIMARY KEY (Order_ID, Product_ID);


SELECT * FROM [ORDER]
SELECT * FROM ORDERLINE
SELECT * FROM PRODUCT

INSERT INTO [ORDER]
VALUES (getdate())

INSERT INTO ORDERLINE
VALUES (100, 1001, 24)

INSERT INTO PRODUCT
VALUES (1001, '3in1 Instant Coffee', 'Brown', 30.00, 10101)

