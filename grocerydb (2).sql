create table grocery_shops(id int not null primary key, name varchar(200) not null);
create table customers(id int not null primary key, address varchar(100) not null, name varchar(200) not null, contact int not null,password varchar(100) not null, location varchar(200) not null, grocery_shop_id int not null, foreign key(grocery_shop_id) references grocery_shops(id));
create table categories(id int not null primary key, name varchar(150) not null);
create table vendors(id int primary key not null, name varchar(255) not null, location varchar(255) not null,email varchar(255) unique, contact int not null,grocery_shop_id int not null, foreign key(grocery_shop_id) references grocery_shops(id));
create table orders(id int not null primary key,status varchar(100) not null,quantity varchar(30) not null,grocery_shop_id int not null, foreign key(grocery_shop_id) references grocery_shops(id),customer_id int not null, foreign key(customer_id) references customers(id),vendor_id int not null, foreign key(vendor_id)references vendors(id));
create table admins(id int not null primary key, name varchar(255) not null, contact int not null,grocery_shop_id int not null, foreign key(grocery_shop_id) references grocery_shops(id));
create table products(id int not null primary key, name varchar(255) not null,price int not null, image bytea not null, description varchar(255) not null,category_id int not null, foreign key(category_id) references categories(id),vendor_id int not null, foreign key(vendor_id) references vendors(id));
drop table products;
create table products(id int not null primary key, name varchar(255) not null,image bytea not null, price int not null, description  varchar(255) not null, category_id int not null, foreign key( category_id)references categories(id), vendor_id int not null, foreign key(vendor_id)references vendors(id),customer_id int not null, foreign key(customer_id) references customers(id),grocery_shop_id int not null, foreign key(grocery_shop_id)references grocery_shops(id));
create table delivery_men(id int not null primary key, name varchar(255) not null,contact int not null,email varchar(255) not null unique, order_id int not null, foreign key(order_id ) references orders(id));
create table cakes(name varchar(255) not null primary key, image bytea not null,price int not null,category varchar(200) not null,description varchar(255) not null, recepies varchar(255) not null,vendor_id int not null, foreign key(vendor_id) references vendors(id));



insert into grocery_shops
values(01,'Precious Grocery Shop');
select * from grocery_shops;

insert into customers
values(1,'Isma Road','Namubiru Cathy',0788923451,'34&catyhnam','Plot 6 ismaRd opp fortress mall',01),(2,'Collins Road','Oburu Peter',070937156,'uytpeter4512','Plot 11 cohen Building',01),(3,'Mutungo','Ayinebyona Dorcus',0701135999,'santhaboo01','Cecil Road',01),(4,'Umar street','Nsubuga Ivan',0726778903,'dguyivo42','Plot 90 Kuruthum rd',01),(5,'Jubile Avenue','Namonyo Angella',0745679023,'angel33nam','Hilton street opp heroes park',01),(6,'Nakawa','Jonney Andrews',0726907688,'89hythjones','Katalima Rd',01);
select * from customers;

insert into categories
values(001,'fruits'),(002,'meats'),(003,'snacks');
select * from categories;

insert into vendors
values(1,'Mark Devis','Oats bakery William street','devswills11@gmail.com',0789054123,01),(2,'Byaruhanga John','Stylish plaza Namanve','johnsbatis50@gmail.com',0781106790,01),(3,'Namutebbi Lydia','Majestic Green','ladynamzz4@gmail.com',0706112689,01),(4,'Marthar Namuli','Bekham Street Mukono','namulimrt2@gmail.com',0788990045,01),(5,'Oloya Stephen','Tripple 4 plaza','stevelows7@gmail.com',0741223390,01);
select * from vendors;	   

insert into orders
values(1,'PENDING','5kg of meat',01,2,4),(2,'PENDING','20 pcs of snacks',01,3,1),(3,'CONFIRMED','40 kgs of fruits',01,5,2),(4,'CONFIRMED','50 kgs of meat',01,4,3),(5,'CONFIRMED','30 kgs of meat',01,6,1);
select * from orders;

alter table products
add posted_by varchar(150) not null;
select * from products;

insert into admins
values(1,'Nakawombe Precious',0726789029,01);
select * from admins;

insert into delivery_men
values(1,'Bbosa Katerega',0789345211,'bosakaterega@gmail.com',2),(2,'Ssemusu Anorld',0709345237,'anoldssemu@gmail.com',5),(3,'Ojambo Anthony',0725679011,'anthojambo1@gmail.com',1),(4,'Ssekamanya Jib',0701178923,'ssekajib55@gmail.com',4);
select * from delivery_men;

insert into products
values(1,'Apples','img1',2000,'Both green and red apples',001,2,6,01,'Admin'),(2,'pop corn','img2',3000,'tasty corns from pure maize',003,1,6,01,'Vendor'),(3,'beef','img10',17000,'Best quality cow beef',002,2,6,01,'Vendor'),(4,'potato chips','img7',1000,'made from local potatoes good for your health',003,5,4,01,'Vendor'),(5,'pine apples','img4',10000,'All types available',001,4,5,01,'Admin'),(6,'Berries','img6',11000,'nutritious berries from different countries',001,3,2,01,'Vendor'),(7,'lamb','img8',12000,'Soft lamb meat and nutritious',002,3,2,01,'Admin'),(8,'Chicken','img11',2000,'All breeds available',002,1,3,01,'Admin'),(9,'cakes','img20',7000,'small sized yummy cakes',003,4,5,01,'Admin'),(10,'Turkey','img5',20000,'mature turkey meat',002,1,2,01,'vendor');
select * from products;

insert into cakes
values('Angel cake','img30',2500,'slice cake','sponge cake made with egg whites, flour, and sugar','egg white, flour, milk, sugar',3),('Chocolate coconut cake','img31',55000,'Birthday cake','light and fluffy and free of dryness rich in chocolate flavor','coconut, milk,flour',1),('Banana cake','img33',45000,'kids cake','prepared using banana as a primary ingredient and typical cake ingredients','steamed banana,milk',5),('Vanilla cake','img35',70000,'Graduation cake','It is made like most plain cakes, but the big difference is egg whites are used pure-white coloring','vanilla,flour,milk',2),('Lemon yorghurt cake','img40',100000,'Wedding cake','preferably for weddings with moderate sugars and soft','cheese,butter,yorghurt,flour',4);
select * from cakes;


select * from products
where posted_by='vendor';

select * from products
where posted_by='Admin';

create table users(id int not null primary key,name varchar(255) not null,user_type varchar(100) not null);
insert into users
values (1,'Mark Devis','vendor'),(2,'Namutebbi Lydia','vendor'),(3,'Nakawombe Precious','Admin'),(4,'Nsubuga Ivan','customer'),(5,'Byaruhanga John','vendor');
select * from users;
select name from users 
where user_type='Admin';


select * from users;
select name from users 
where user_type='vendor';

select * from orders 
where status='CONFIRMED';


