create database ecommerce;
use ecommerce;
 
  
 CREATE TABLE SUPPLIER(
     SUPP_ID INT unsigned PRIMARY KEY auto_increment, 
     SUPP_NAME VARCHAR(50) NOT NULL, 
     SUPP_CITY VARCHAR(50) NOT NULL, 
     SUPP_PHONE VARCHAR(50) NOT NULL
  );
  
 CREATE TABLE `customer` (
  `cust_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(20) NOT NULL,
  `cust_phone` varchar(10) NOT NULL,
  `cust_city` varchar(30) NOT NULL,
  `cust_gender` enum('M','F') NOT NULL,
  PRIMARY KEY (`cust_id`)
);

CREATE TABLE `category` (
  `cat_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cat_id`)
);

CREATE TABLE PRODUCT(
  PRO_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
  PRO_NAME VARCHAR(20) NOT NULL, 
  PRO_DESC VARCHAR(60), 
    CAT_ID INT UNSIGNED, 
    FOREIGN KEY(CAT_ID) REFERENCES CATEGORY(CAT_ID)
);
  
CREATE table supplier_pricing (
		PRICING_ID int unsigned primary key AUTO_INCREMENT,
    PRO_ID int unsigned, foreign key(PRO_ID) references product(PRO_ID),
    SUPP_ID int unsigned, foreign key(SUPP_ID) references supplier(SUPP_ID),
    SUPP_PRICE int default 0
);

CREATE table orders (
		ORD_ID int unsigned primary key AUTO_INCREMENT,
    ORD_AMOUNT int NOT NULL,
    ORD_DATE date NOT NULL,
    CUST_ID int unsigned, foreign key(CUST_ID) references customer(CUST_ID),
    PRICING_ID int unsigned, foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

CREATE TABLE RATING(
	RAT_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
     ORD_ID INT, 
     FOREIGN KEY(ORD_ID) REFERENCES ORDERS(ORD_ID), 
      RAT_RATSTARTS INT NOT NULL
);

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

-- Display the total number of customers based on gender who have placed orders of worth at least Rs.3000
SELECT cust_gender, COUNT(DISTINCT customer.cust_id) as TotalCustomers
FROM customer
JOIN orders ON customer.cust_id = orders.cust_id
WHERE orders.ORD_AMOUNT >= 3000
GROUP BY cust_gender;

-- Display all the orders along with product name ordered by a customer having Customer_Id=2
select cust_name, cust_city, o.ORD_AMOUNT, o.pricing_id, s.PRO_ID, p.PRO_NAME, p.PRO_DESC
   from customer inner join orders as o 
     on customer.cust_id=o.CUST_ID 
     inner join supplier_pricing as s
       on o.PRICING_ID = s.PRICING_ID
     inner join product as p
       on s.PRO_ID=p.PRO_ID
     and customer.cust_id=2;

-- Display the Supplier details who can supply more than one product.
select s.supp_name, count(p.PRO_NAME) as num_of_products from supplier as s inner join supplier_pricing as sp on s.SUPP_ID=sp.SUPP_ID
        inner join product as p on sp.PRO_ID=p.PRO_ID
        group by s.SUPP_NAME
        having num_of_products > 1;

-- Display the Id and Name of the Product ordered after “2021-10-05”.
select c.cust_name, o.ord_amount, o.ord_date, p.pro_name, p.PRO_DESC  from orders as o inner join supplier_pricing as sp 
         on o.PRICING_ID=sp.PRICING_ID
     inner join product as p on sp.pro_id=p.PRO_ID   
     inner join customer as c
       on o.CUST_ID=c.cust_id
    where o.ORD_DATE > "2021-10-05"  

-- Display customer name and gender whose names start or end with character 'A'.
SELECT customer.cus_name,customer.cus_gender 
FROM customer 
WHERE customer.cus_name like 'A%' or customer.cus_name like '%A'
