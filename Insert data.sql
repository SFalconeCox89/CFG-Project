
Insert into bars (bar_id, bar_name, bar_type)
values (01, 'Bee and Barb', 'Cocktail'),
(02, 'Ragged Flagon', 'Craft beer'),
(03, 'Drunken Huntsman', 'Irish pub'),
(04, 'Sleeping Giant Inn', 'Retro'),
(05, 'Windpeak Inn', 'Karaoke'),
(06, 'Nightgate', 'Whisky Bar'),
(07, 'La Catrina', 'Cocktail'); 


Insert into customers (customer_id, customer_first_name, customer_last_name, customer_telephone_number, customer_email)
values (101, 'Jon', 'Snow', 0803759, 'north@thewall.com'),
(102, 'David', 'Patrick', 9234587, 'davepatrick@mersey.co.uk'),
(103, 'Jack', 'Dawson', 8210568, 'jackdawson@titanic.com'),
(104, 'Steve', 'Harrington', 2304586, 'stevehair@hawkinshigh.com'),
(105, 'Jack', 'Peralta', 340987789, 'jackp@nypd.com'),
(106, 'Jaquen', 'Griffin', 0171890765, 'jaqueng93@outlook.com'), 
(107, 'Marie', 'Behan', 0987335671, 'MarieB@hotmail.ie');


insert into snack_suppliers (s_supplier_id, s_supplier_name, s_supplier_telephone_number, s_supplier_postcode, s_supplier_email)
values (201, 'Snowdons', 01412870090, 'NY234', 'snacks@snowdons.com'),
(202, 'Cunards confectionary', 0123457852, 'MCR24', 'confectionary@cunards.com'),
(203, 'Lowells', 01612920070, 'LDN26', 'lowells@gmail.co.uk'),
(204, 'Smiths Sweets', 01518956785, 'PLY27', 'sweets@smiths.co.uk'),
(205, 'Belfast Bites', 765438761, 'BEL34', 'belfastbites@outlook.ie'),
(206, 'Scottish Snacks', 098432671, 'AB43', 'info@scottishsnacks.co.uk'),
(207, 'Norfolk Nibbles', 086521358, 'NOR45', 'ordering@norfolknibbles.com'),
(208, 'Tree Treats', 053268612, 'BSL218', 'orders@treetreats.co.uk');

Insert into drink_suppliers (d_supplier_id, d_supplier_name, d_supplier_telephone_number, d_supplier_postcode, d_supplier_email)
values (301, 'Orange Club', 0912765439, 'EDN219', 'orange@club.com'),
(302, 'Atlantic Drinks Ltd', 0997765421, 'GLWY56', 'drinks@atlantic.ie'),
(303, 'Rose Drinks', 0876512344, 'PEM65', 'rosedrinks@yahoo.com'),
(304, 'Mountain drink supplier', 0921364768, 'LIV98', 'orders@mountaindrinks.com'),
(305, 'Breeze Beverages', 234659375, 'CAR76', 'beverages@breeze.co.uk'),
(306, 'Timmys', 0876346279, 'SWN87', 'ordering@timmys.com'), 
(307, 'Jurassic Drinks', 096438291, 'MUR78', 'orders@jurassicdrinks.com'),
(308, 'Irish Coffee Co', 086252732, 'CRK89', 'order@irishcoffeeco.ie'); 

Insert into stock (stock_id, stock_name, stock_type, quantity, supplier_id)
values (112, 'Guinness', 'Alcohol', 15, 302),
(113, 'Gin', 'Alcohol', 25, 303),
(114, 'Tonic Water', 'Soft drink', 30, 304),
(115, 'Coke', 'Soft drink', 50, 304),
(116, 'Rum', 'Alcohol','20', 301),
(117, 'Whiskey', 'Alcohol', 25, 302),
(991, 'Pringles', 'Snacks', 50, 201),
(992, 'Peanuts', 'Snacks', 50, 201),
(993, 'RS Crisps', 'Snacks', 75, 203),
(994, 'Assorted Sweets', 'Snacks', 80, 204); 

Insert into events (event_id, event_date, event_name, event_type, event_postcode, number_of_guests, customer_id, bar_id)
values (401, '2022-08-02', 'Daves Birthday', 'Birthday', 'CH436YE', 10, 102, 03),
(402, '2022-08-25', 'Lake Fest', 'Festival', 'L43', 500, 104, 04),
(403, '2022-12-23', 'Dawson Wedding', 'Wedding', 'TI356', 200, 103, 01),
(404, '2022-11-30', 'Snow Party', 'Bachelor party', 'WES23', 25, 104, 05),
(405, '2023-04-02', 'Baby Griffin', 'Christening', 'EDI27', 60, 106, 04),
(406, '2023-05-09', 'Behan Party', 'Hen Party', 'GH09', 50, 107, 07),
(407, '2023-04-07', 'Dawson Party', 'Graduation', 'RW98', 150, 103, 06), 
(408, '2023-05-24', 'Behan Birthday', 'Birthday', 'GH09', 100, 107, 07); 

Insert into event_finance (event_id, deposit, stock_cost, takings)
values (401, 100, 200, 350),
(402, 500, 1000, 5000),
(403, 350, 500, 2000),
(404, 200, 350, 700),
(405, 325, 500, 800),
(406, 250, 300, 680), 
(407, 380, 500, 1900); 

INSERT INTO bar_maintenance (bar_id, clean, insurance_due, MOT_due)
VALUES (01, '2022-12-24', '2022-12-12', '2023-04-22'),
(02, NULL, '2023-05-14', '2022-11-26'),
(03, '2022-08-23', '2022-09-15', '2022-10-01'),
(04, '2022-08-26', '2022-09-15', '2022-10-01'),
(05, '2022-12-01', '2023-01-05', '2022-08-26');
