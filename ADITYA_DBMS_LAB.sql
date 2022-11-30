--CREATING SUPPLIER TABLE--------------------------
--1)- CREATE TABLE SUPPLIER(
				SUPP_ID INT PRIMARY KEY,
                SUPP_NAME VARCHAR(50) NOT NULL,
                SUPP_CITY VARCHAR(50) NOT NULL,
                SUPP_PHONE VARCHAR(50) NOT NULL);

--CREATING CUSTOMER TABLE-----------------------------
     CREATE TABLE CUSTOMER(
				CUS_ID INT PRIMARY KEY,
                    CUS_NAME VARCHAR(20) NOT NULL,
                    CUS_PHONE VARCHAR(10) NOT NULL,
                    CUS_CITY VARCHAR(30) NOT NULL,
                    CUS_GENDER CHAR);

--CREATING CATEGORY TABLE----------------------------
     CREATE TABLE CATEGORY(
				CAT_ID INT PRIMARY KEY,
                    CAT_NAME VARCHAR(20) NOT NULL);


--CREATING PRODUCT TABLE-----------------------------
     CREATE TABLE PRODUCT(
				PRO_ID INT PRIMARY KEY,
                    PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
                    PRO_DESC VARCHAR(60),
                    CAT_ID INT,
                    FOREIGN KEY (CAT_ID) REFERENCES CATEGORY(CAT_ID));

--CREATING SUPPLIER_PRICING TABLE-----------------------------
     CREATE TABLE SUPPLIER_PRICING(
						PRICING_ID INT PRIMARY KEY,
                            PRO_ID INT,
                            SUPP_ID INT,
                            SUPP_PRICE INT DEFAULT 0,
                            FOREIGN KEY (PRO_ID) REFERENCES PRODUCT(PRO_ID),
                            FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID));

--CREAING ORDERS TABLE----------------------------------------- 
     CREATE TABLE ORDERS(
				ORD_ID INT PRIMARY KEY,
                ORD_AMOUNT INT NOT NULL,
                ORD_DATE DATE NOT NULL,
                CUS_ID INT,
                PRICING_ID INT,
                FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
                FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID));



--CREAING RATING TABLE---------------------------------------------------
    CREATE TABLE RATING(
				RAT_ID INT PRIMARY KEY,
                ORD_ID INT,
                RAT_RATSTARS INT NOT NULL,
                FOREIGN KEY (ORD_ID) REFERENCES ORDERS(ORD_ID));


--2)--inserting the data which has created above---------------------

---Inserting values in SUPPLIER table---------------------------

INSERT into SUPPLIER VALUES(1,"Rajesh Retails","Delhi",1234567890); 
INSERT into SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",2589631470); 
INSERT into SUPPLIER VALUES(3,"Knome products","Banglore",9785461458); 
INSERT into SUPPLIER VALUES(4,"Bansal Retails","Kochi",9754634512); 
INSERT into SUPPLIER VALUES(5,"Mittal Ltd","Lucknow",7898562321); 


                          
-- INSERTING VALUES IN CUSTOMER TABLE-------------------------
insert into customer values(1,"AAKASH",9999999999,"DELHI","M");
insert into customer values(2,"AMAN",9785463215,"NOIDA","M");
insert into customer values(3,"AAKASH",9785463215,"MUMBAI","F");
insert into customer values(4,"AAKASH",9994562388,"KOLKATA","F");
insert into customer values(5,"AAKASH",789599999,"LUCKNOW","M");




--INSERTING VALUES INTO CETEGORY TABLE---------------------------
INSERT INTO CATEGORY VALUES(1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES(4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

--inserting data into Product table--------------------------------
insert into product values(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into product values(2,"T SHIRT","SIZE-L with Black, Blue and White variations",5);
insert into product values(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
insert into product values(4,"OATS","Highly Nutritious from Nestle",3);
insert into product values(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
insert into product values(6,"MILK","1L Toned MIlk	",3);
insert into product values(7,"Boat Earphones","1.5Meter long Dolby Atmos",4);
insert into product values(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
insert into product values(9,"Project IGI","compatible with windows 7 and above",2);
insert into product values(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
insert into product values(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
insert into product values(12,"Train Your Brain","By Shireen Stephen",1);



--inserting values into supplier_pricing table----------------------
insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);


--INSERTING VALUSE INTO ORDERS TABLE-----------------
insert into orders values(101,1500,'2021-10-06',2,1);
insert into orders values(102,1000,'2021-10-12',3,5);
insert into orders values(103,30000,'2021-09-16',5,2);
insert into orders values(104,1500,'2021-10-05',1,1);
insert into orders values(105,3000,'2021-08-16',4,3);
insert into orders values(106,1450,'2021-08-18',1,9);
insert into orders values(107,789,'2021-09-01',3,7);
insert into orders values(108,780,'2021-09-07',5,6);
insert into orders values(109,3000,'2021-00-10',5,3);
insert into orders values(110,2500,'2021-09-10',2,4);
insert into orders values(111,1000,'2021-09-15',4,5);
insert into orders values(112,789,'2021-09-16',4,7);
insert into orders values(113,31000	,'2021-09-16',1,8);
insert into orders values(114,1000,'2021-09-16',3,5);
insert into orders values(115,3000,'2021-09-16',5,3);
insert into orders values(116,99,'2021-09-17',2,14);


--inserting values in rating table------------------
insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);



------ANSWER----------------------------
--3)-
select cus_gender,count(cus_name) from customer  where cus_id in  
(select cus_id from orders where ord_amount >=3000) group by cus_gender;


--4)-
SELECT product.PRO_NAME, orders.* 
FROM orders, supplier_pricing, product
WHERE orders.CUS_ID=2 
AND orders.PRICING_ID=supplier_pricing.PRICING_ID 
AND supplier_pricing.PRO_ID=product.PRO_ID;



--5)--.Display the Supplier details who can supply more than one product.
 SELECT supplier.* FROM supplier 
WHERE supplier.SUPP_ID in( 
SELECT SUPP_ID FROM supplier_pricing
GROUP BY SUPP_ID having count(SUPP_ID)>1)
GROUP BY supplier.SUPP_ID;





 --6)-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product

SELECT category.CAT_ID,category.CAT_NAME, MIN(t3.min_price) as Min_Price
 FROM category 
 INNER JOIN
   (SELECT product.CAT_ID, PRO_NAME, t2.*
    FROM  product 
     INNER JOIN
       (SELECT PRO_ID, MIN(SUPP_PRICE) as Min_Price
        FROM  supplier_pricing GROUP BY PRO_ID)
        as t2 WHERE t2.PRO_ID = product.PRO_ID)
        as t3 WHERE t3.CAT_ID = category.CAT_ID GROUP BY t3.CAT_ID;
        
		
		
		
		
		
		
--7) -- Display the Id and Name of the Product ordered after “2021-10-05”.

 SELECT product.PRO_ID,product.PRO_NAME
FROM orders
  INNER JOIN
	supplier_pricing ON supplier_pricing.PRICING_ID = orders.PRICING_ID 
	 INNER JOIN
	  product on product.PRO_ID = supplier_pricing.PRO_ID
	  WHERE orders.ORD_DATE>"2021-10-05";
	  
	  
	  
	  
	  
	  
	  
	  
 
--8)---- Display customer name and gender whose names start or end with character 'A'.
 
   SELECT customer.CUS_NAME,customer.CUS_GENDER
  FROM customer 
  WHERE customer.CUS_NAME LIKE 'A%' OR customer.CUS_NAME LIKE '%A';
  
  
  
  
  
  
  
  
9)--.Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
  
 --  Step-1. Create a new procedure using MySQL Workbench.
DELIMITER //
CREATE PROCEDURE proc()
--  Step-2. Embed the following block of code within the BEGIN and END statements
BEGIN
SELECT report.supp_id,report.supp_name,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
WHEN report.Average >4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service FROM
(SELECT final.SUPP_ID, supplier.SUPP_NAME, final.Average 
FROM
   (SELECT test2.SUPP_ID, SUM(test2.rat_ratstars)/COUNT(test2.rat_ratstars) AS Average 
     FROM
        (SELECT supplier_pricing.SUPP_ID, test.ORD_ID, test.RAT_RATSTARS 
              FROM supplier_pricing 
                INNER JOIN
                    (SELECT orders.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS  
                          FROM orders  
                             INNER JOIN  
                                  rating ON rating.ORD_ID = orders.ORD_ID ) AS test
                                     ON test.PRICING_ID = supplier_pricing.PRICING_ID)
                                          AS test2 group by supplier_pricing.SUPP_ID)
                                             AS final 
                                               INNER JOIN 
                                                 supplier WHERE final.SUPP_ID = supplier.SUPP_ID) AS report;




