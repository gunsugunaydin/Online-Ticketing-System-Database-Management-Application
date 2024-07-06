create table Client (
  	Client_ID char(11) not null,
  	Name varchar(45) not null,
  	Surname varchar(45) not null,
  	primary key (Client_ID));
  
create table Client_PhoneNumber (
  	Client_ID char(11) not null,
  	Phone_Number varchar(19) not null,
	primary key (Client_ID, Phone_Number),
	foreign key (Client_ID) references Client
  	on delete cascade
  	on update cascade);

create table Event (
  	Event_ID varchar(11) not null,
    Name varchar(45) not null,
  	Genre varchar(45) not null,
    Date_of_Start date not null,
    Date_of_End date not null,
	primary key (Event_ID));

create table Castt (
  	CastEventID varchar(11) not null,
    Name varchar(45) not null,
  	Surname varchar(45) not null,
    Profession varchar(45) not null,
    Email varchar(100) not null,
    Salary int,
    primary key (CastEventID, Email),
    foreign key(CastEventID) references event
  	on delete cascade
  	on update cascade);

create table Event_Review (
  	ReviewEventID varchar(11) not null,
    Evaluating_Client_ID char(11) not null,
  	Evaluating_Date date not null,
    Given_Score numeric(3,1) not null,
    primary key (ReviewEventID, Evaluating_Client_ID),
    foreign key(ReviewEventID) references Event
  	on delete cascade
  	on update cascade);
   
create table Venue (
  	VenueEventID varchar(11) not null,
    Venue_ID varchar(11) not null,
  	VPhone_Number char(10) not null,
    Name varchar(100) not null,
    Section varchar(20) not null,
    Information varchar(200) not null,
    Seating_Arrangment bytea,
	Number_of_Seat int not null,
	State varchar(100) not null, 
	City varchar(163) not null,
	County varchar(163) not null,
	Street_Name varchar(163) not null,
	Building_No varchar(10) not null, 
	unique (Venue_ID),
	primary key(VenueEventID, Venue_ID),
    foreign key(VenueEventID) references Event
  	on delete cascade
  	on update cascade);
   
create table Seat (
  	Client_ID char(11) not null,
    Event_ID varchar(11) not null,
  	Venue_ID varchar(11) not null,
    Seat_ID varchar(11) not null,
    Seat_Name varchar(5) not null,
	Seat_Type varchar(8) not null,
	unique (Seat_ID),
 	primary key (Client_ID, Event_ID, Venue_ID, Seat_ID),
	foreign key(Client_ID) references Client
  	on delete cascade
  	on update cascade,
	foreign key(Event_ID) references Event
  	on delete cascade
  	on update cascade,
	foreign key(Venue_ID) references Venue(Venue_ID)
  	on delete cascade
  	on update cascade);

create table Seat_Review (
  	Client_ID char(11) not null,
	Event_ID varchar(11) not null,
  	Venue_ID varchar(11) not null,
	Seat_ID char(11) not null,
	Review_ID varchar(11) not null,
	Seat_Angle numeric(3,1) not null,
	Seat_Image bytea,
	Comment_Date date not null,
	primary key (Client_ID, Event_ID, Venue_ID, Seat_ID),
	foreign key(Client_ID) references Client
  	on delete cascade
  	on update cascade,
	foreign key(Event_ID) references Event
  	on delete cascade
  	on update cascade,
	foreign key(Venue_ID) references Venue(Venue_ID)
  	on delete cascade
  	on update cascade,
	foreign key(Seat_ID) references Seat(Seat_ID)
  	on delete cascade
  	on update cascade);

create table Event_days(
  	Event_ID varchar(11) not null,
  	Working_Days varchar(50) not null,
  	Starting_Hours time not null,
  	Working_Hours varchar(5) not null,
  	primary key(Event_ID),
	foreign key(Event_ID) references Event
  	on delete cascade
  	on update cascade);

create table Attend(
	Client_ID char(11) not null,
  	Event_ID varchar(11) not null,
  	Attended_Clients boolean not null,
  	primary key (Client_ID ,Event_ID),
	foreign key(Client_ID) references Client
  	on delete cascade
  	on update cascade,
	foreign key(Event_ID) references Event
  	on delete cascade
  	on update cascade);

create table Buy_Cancel(
	Seat_ID varchar(11) not null,
	Ticket_ID varchar(11) not null,
	Seat_Price numeric(6,2)not null,
	Bought_seats boolean not null,
	Cancelled_seats boolean not null,
	primary key (Seat_ID),
	foreign key(Seat_ID) references Seat(Seat_ID)
  	on delete cascade
  	on update cascade);

create view Cast_View as
	select CastEventID,Name,Surname,Profession,Email
       from Castt;
      
      
select * from Client;
select * from Client_PhoneNumber;
insert into client
          values ('18098680134', 'Günsu', 'Günaydýn');
         
insert into client_phonenumber
         values ('18098680134','+90(5315159499)');
         
insert into client
          values ('16429085948', 'Fuat Yiðit', 'Koçyiðit');
         
insert into client_phonenumber
         values ('16429085948','+90(5536602269)'); 
         
insert into client
          values ('14945614554', 'Mehmet Batuhan', 'Þenol');
  
insert into client_phonenumber
         values ('14945614554','+90(5077933353)'); 
         
insert into client
          values ('11985981251', 'Umut', 'Fýrat');
         
insert into client_phonenumber
         values ('11985981251','+90(5151596151)'); 
         
insert into client
          values ('18958959898', 'Ege', 'Aslan');
         
insert into client_phonenumber
         values ('18958959898','+90(5186594189)');
         
insert into client
          values ('15165195818', 'Berra', 'Çam');
         
insert into client_phonenumber
         values ('15165195818','+1(5525615618)');
         
insert into client
          values ('18951951581', 'Yeþim', 'Mete');
         
insert into client_phonenumber
         values ('18951951581','+90(5191591198)');
         
insert into client
          values ('19848948981', 'Asena', 'Anýk');
         
insert into client_phonenumber
         values ('19848948981','+90(5436241267)');
         
insert into client
          values ('19846516516', 'Hakan', 'Gürgün');
         
insert into client_phonenumber
         values ('19846516516','+1(5515752757)');
         
insert into client
          values ('11651526516', 'Miray', 'Erdemli');
         
insert into client_phonenumber
         values ('11651526516','+90(5882743584)'); 
         
insert into client
          values ('15995095950', 'Baþak', 'Arslan');
         
insert into client_phonenumber
         values ('15995095950','+90(5589195198)');
         
insert into client
          values ('15020955900', 'Berkan', 'Güneþ');
         
insert into client_phonenumber
         values ('15020955900','+90(5649819519)');
         
insert into client
          values ('10020566506', 'Elif', 'Iþýk');
         
insert into client_phonenumber
         values ('10020566506','+90(5195151951)');
         
insert into client
          values ('10561898914', 'Esra', 'Koçak');
         
insert into client_phonenumber
         values ('10561898914','+90(5551951915)');
         
insert into client
          values ('19859819785', 'Meryem', 'Demircan');
         
insert into client_phonenumber
         values ('19859819785','+90(5051851918)');
         
insert into client
          values ('15814985519', 'Neslihan', 'Erdoðan');
         
insert into client_phonenumber
         values ('15814985519','+90(5594148489)');        
         
insert into client
          values ('15620505060', 'Pýnar', 'Ertenoðlu');
         
insert into client_phonenumber
         values ('15620505060','+90(5536618519)'); 
         
insert into client
          values ('14065159815', 'Abbas', 'Kurt');
         
insert into client_phonenumber
         values ('14065159815','+90(5551541981)');        
         
insert into client
          values ('17561590505', 'Doðukan', 'Paslý');
         
insert into client_phonenumber
         values ('17561590505','+90(5568498561)'); 
         
insert into client
          values ('18789195516', 'Ahmet', 'Þimþek');
         
insert into client_phonenumber
         values ('18789195516','+90(5521981910)'); 
         
insert into client
          values ('16059159050', 'Ali Adil', 'Yaþlý');
         
insert into client_phonenumber
         values ('16059159050','+1(5419418954)'); 
         
insert into client
          values ('17115961595', 'Kemal', 'Þener');
         
insert into client_phonenumber
         values ('17115961595','+50(5456151981)'); 
         
insert into client
          values ('17818495050', 'Atakan', 'Apan');
         
insert into client_phonenumber
         values ('17818495050','+90(5589815151)'); 
         
insert into client
          values ('14845919514', 'Avþar', 'Coþkun');
         
insert into client_phonenumber
         values ('14845919514','+90(5551818914)');  
        
insert into client_phonenumber
         values ('14845919514','+90(5324668783)');
         
insert into client
          values ('18915615959', 'Kemalcan', 'Aydoðdu');
         
insert into client_phonenumber
         values ('18915615959','+90(5125889485)'); 
         
insert into client
          values ('16518948912', 'Hasan', 'Ünal');
         
insert into client_phonenumber
         values ('16518948912','+90(5072519515)'); 
          
insert into client_phonenumber
         values ('16518948912','+90(5324668783)');   
        
insert into client
          values ('18561591599', 'Göksu', 'Tümer');
         
insert into client_phonenumber
         values ('18561591599','+90(5165158851)'); 
         
insert into client
          values ('11591985191', 'Umay', 'Güven');
         
insert into client_phonenumber
         values ('11591985191','+90(5345654765)');
         
insert into client
          values ('12059591958', 'Tuna', 'Özdemir');
         
insert into client_phonenumber
         values ('12059591958','+90(5564565151)');
        
insert into client_phonenumber
         values ('12059591958','+90(5148951911)');        
         
insert into client
          values ('18956159198', 'Albina', 'Gülerman');
         
insert into client_phonenumber
         values ('18956159198','+76(5579619515)');
         
insert into client
          values ('17988948919', 'Asya', 'Aktaþ');
         
insert into client_phonenumber
         values ('17988948919','+90(5581561651)');
         
insert into client
          values ('10259059005', 'Öykü', 'Davud');
         
insert into client_phonenumber
         values ('10259059005','+99(5165165210)');
         
insert into client
          values ('13473735750', 'Lisa', 'Manoban');
         
insert into client_phonenumber
          values ('13473735750','+2(5558948515)');
         
insert into client
          values ('13068841891', 'Jisoo', 'Kim');
         
insert into client_phonenumber
          values ('13068841891','+5(5849851562)');
         
insert into client
          values ('16841818154', 'Henry', 'Federick');
         
insert into client_phonenumber
          values ('16841818154','+15(5165161554)');
         
insert into client
          values ('16841818177', 'Caleb', 'Stone');
         
insert into client_phonenumber
          values ('16841818177','+27(5444894515)');
         
               
select * from Event;
insert into event
          values('1111', '12 Angry Men', 'Cinema', '2020-03-29', '2020-03-30');
         
insert into event
          values('1214', 'Hamlet', 'Theater', '2020-03-23', '2020-03-25');
         
insert into event
          values('1224', 'Revival Tour', 'Concert', '2016-03-23', '2020-03-24');         
         
insert into event
          values('1981', 'Europa Galante', 'Opera', '2020-03-23', '2020-03-24');         
         
insert into event
          values('1676', 'Harry Potter and the Deathly Hallows – Part 1', 'Cinema', '2020-03-23', '2020-03-24');        
         
insert into event
          values('1237', 'Çalýkuþu', 'Theater', '2020-03-24', '2020-03-25');         
         
insert into event
          values('1785', 'Harry Potter and the Deathly Hallows – Part 2', 'Cinema', '2020-03-25', '2020-05-26');         
         
insert into event
          values('1573', 'Tarkan Concert', 'Concert', '2020-03-25', '2020-03-27');         
         
insert into event
          values('1025', 'Siyahlý Kadýn', 'Theater', '2020-03-26', '2020-03-27');         

insert into event
          values('1783', 'Otto Barok', 'Opera', '2020-03-27', '2020-03-28');    
          
insert into event 
		  values('1023','Star Wars','Cinema','2020-03-25','2020-03-26');
		 
insert into event 
		  values('1092','Pride and Prejudice','Cinema','2020-03-23','2020-03-27');
		 
insert into event 
		  values('1293','Turandot','Opera','2020-03-24','2020-03-27');
		  
insert into event 
		  values('1862','Truva Sonatý','Concert','2020-03-23','2020-03-25');
		 
insert into event 
		  values('1795','Operadaki Hayalet','Opera','2020-03-23','2020-03-25');
		  
insert into event 
		  values('9516','Eyvah Nadir','Theater','2020-03-23','2020-03-25');
		  
insert into event 
		  values('9846','Lüküs Hayat','Theater','2020-03-24','2020-03-27');
		  
insert into event 
		  values('1985','The Irishman','Cinema','2020-03-24','2020-03-27');
		  
insert into event 
		  values('7961','Aida','Opera','2020-03-26','2020-03-27');
		  
insert into event 
		  values('5515','Evgeny Grinko','Concert','2020-03-24','2020-03-24');
		 
insert into event 
		  values('9573','Inception','Cinema','2020-03-24','2020-03-26');
		 
insert into event 
		  values ('1811','Thelma and Louise','Cinema','2020-03-23','2020-03-25');

insert into event
		  values ('6486','Groundhog Day','Cinema','2020-03-24','2020-03-27');		 

		 
		  
select * from Castt;
insert into castt
		  values('1111','Martin','Balsam','Actor','martin.balsam@gmail.com','7000');
		 
insert into castt
		  values('1111','John','Fiedler','Actor','john.fiedler@gmail.com','7500');
		 
insert into castt
		  values('1111','Lee J.','Cobb','Actor','leej.cobb@gmail.com','7200');
		 
insert into castt
		  values('1111','E. G.','Marshall','Actor','eg.marshall@gmail.com','7700');

insert into castt
		  values('1111','Jack','Klugman','Actor','jack.klugman@gmail.com','6000');
		 
insert into castt
		  values('1111','Edward','Binns','Actor','edward.binns@gmail.com','7900');
		 
insert into castt
		  values('1111','Jack','Warden','Actor','jack.warden@gmail.com','2000');
		 
insert into castt
		  values('1111','Henry','Fonda','Actor','henry.fonda@gmail.com','9000');
		 
insert into castt
		  values('1111','Joseph','Sweeney','Actor','joseph.sweeney@gmail.com','7200');
		  
insert into castt
		  values('1111','George','Voskovec','Actor','george.voskovec@gmail.com','5000');
		 
insert into castt
		  values('1111','Robert','Webber','Actor','robert.webber@gmail.com','7200');		 
		  
insert into castt
		  values('1214','Bülent Emin','Yarar','Actor','bemin.yarar@gmail.com','3000');		  
		 
insert into castt
		  values('1224','Selena','Gomez','Artist','selena.gomez@gmail.com','9000000');
		 
insert into castt
		  values('1981','Vivica','Genaux','Artist','miss.vivica@gmail.com','10000');
		 
insert into castt
		  values('1676','Daniel','Ratcliffe','Actor','daniel.ratcliffe@gmail.com','12000');
		 
insert into castt
		  values('1676','Emma','Watson','Actor','emma.watson@gmail.com','12000');
		 
insert into castt
		  values('1676','Rupertz','Grint','Actor','rupertz.grint@gmail.com','12000');
		 
insert into castt
		  values('1237','Nur','Yazar','Actor','nur.yazar@gmail.com','7000');
		 
insert into castt
		  values('1237','Sinem','Þahin','Actor','sinem.sahin@gmail.com','7000');
		 
insert into castt
		  values('1237','E. Çaðrý','Turan','Actor','cagri.turan@gmail.com','7000');
		 
insert into castt
		  values('1785','Daniel','Ratcliffe','Actor','daniel.ratcliffe@gmail.com','12000');
		 
insert into castt
		  values('1785','Emma','Watson','Actor','emma.watson@gmail.com','12000');
		 
insert into castt
		  values('1785','Rupertz','Grint','Actor','rupertz.grint@gmail.com','12000');	 
		 
insert into castt
		  values('1573','Tarkan','Tevetoðlu','Singer','tarkan@gmail.com','950000');		 
		 
insert into castt
		  values('1025','Mazda','Özdemir','Actor','m.ozdemir@gmail.com','8700');
		 
insert into castt
		  values('1783','Orhan','Avcý','Chef and Violinist','orhan.avci@gmail.com','7800');
		 
insert into castt
		  values('1023','Carrie','Fisher','Actor','carrie.fisher@gmail.com','86000');
		 
insert into castt
		  values('1092','Keira','Knightley','Actor','keira.knightley@gmail.com','234000');		 
		 
insert into castt
		  values('1293','Franco','Alfano','Composer','falfano@gmail.com','39000');

insert into castt
		  values('1862','Fazýl','Say','Pianist','fazil.say@gmail.com','340000');
		 
insert into castt
		  values('1795','Caston','Leroux','Singer','casleroux@gmail.com','283000');		 
		 
insert into castt
		  values('9516','Koray','Karaca','Actor','kkaraca@gmail.com','495000');	
		 
insert into castt
		  values('9846','Mehmet Ali','Toklu','Actor','matoklu@gmail.com','49000');	
		 
insert into castt
		  values('1985','Al','Pacino','Actor','alpacino@gmail.com','584000');			 
		 
insert into castt
		  values('7961','Antonio','Ghislanzoni','Composer','aghislanzoni@gmail.com','599000');			 
		 
insert into castt
		  values('5515','Yevgeny','Grinko','Pianist','yevgrinko@gmail.com','602000');
		 
insert into castt
		  values('9573','Leonardo','Dicaprio','Actor','leo.dicaprio@gmail.com','959000');		 
		 
insert into castt		
		  values ('1811','Susan','Sarandon','Actor','ssarandon@gmail.com',null);

insert into castt		
		  values ('1811','Geena','Davis','Actor','geena.davis@gmail.com',null);

insert into castt		
		  values ('1811','Brad','Pitt','Actor','brad.pitt@gmail.com',null);

insert into castt		
		  values ('6486','Bill','Murray','Actor','bill.murray@gmail.com',null);		
		
insert into castt		
		  values ('6486','Andie','MacDowell','Actor','andie.macdowell@gmail.com',null);				
		
insert into castt		
		  values ('6486','Chris','Elliott','Actor','chris.elliott@gmail.com',null);		

		 
         
select * from Event_Review;
insert into event_review
		 values('1676','18098680134','2020-06-17','9');
		
insert into event_review
		 values('1785','18098680134','2020-08-10','8');		
		
insert into event_review
		 values('1224','18098680134','2020-05-17','10');	
		
insert into event_review
		 values('1224','16429085948','2020-05-16','10');		
		
insert into event_review
		 values('1676','16429085948','2020-11-19','9.5');

insert into event_review
		 values('1214','14945614554','2020-08-15','5');

insert into event_review
		 values('1111','16841818154','2020-07-02','7.4');

insert into event_review
		 values('1224','16841818154','2020-12-11','11');

insert into event_review
		 values('1981','14845919514','2020-12-30','2');
		
insert into event_review
		 values('1981','17115961595','2020-03-11','5');		
		
insert into event_review
		 values('1785','12059591958','2020-04-03','8');		
		
insert into event_review
		 values('1676','15620505060','2020-09-17','8');		
		
insert into event_review
		 values('1224','11651526516','2020-05-25','9.9');		
		
insert into event_review
		 values('1785','10020566506','2020-05-26','7.9');		
		
insert into event_review
		 values('1676','10020566506','2020-11-01','8.5');		
		
insert into event_review
		 values('1111','10020566506','2020-10-19','3.5');		
		
insert into event_review
		 values('1573','11985981251','2020-08-08','4');		
		
insert into event_review
		 values('1573','12059591958','2020-08-08','5.5');
		
insert into event_review
		 values('1111','12059591958','2020-07-07','6');		
		
insert into event_review
		 values('1023','19859819785','2020-07-17','8');		
		
insert into event_review
		 values('1676','19859819785','2020-09-28','9');		
		
insert into event_review
		 values('1224','14065159815','2020-10-12','9');		
		
insert into event_review
		 values('1785','14065159815','2020-12-29','9');		
		
insert into event_review
		 values('1224','18958959898','2020-07-11','10');		
		
insert into event_review
		 values('1676','18958959898','2020-07-16','10');		
		
insert into event_review
		 values('1985','19846516516','2020-10-11','6.8');		
		
insert into event_review
		 values('1785','19846516516','2020-10-12','8.2');
		
insert into event_review
		 values('1092','19846516516','2020-11-30','6');		
		
insert into event_review
		 values('9516','19846516516','2020-12-30','6');		
		
insert into event_review
		 values('1111','10561898914','2020-12-25','5');		
		
insert into event_review
		 values('9516','10561898914','2020-08-18','1');
		
insert into event_review
		 values('1025','17988948919','2020-08-21','1');		
		
insert into event_review
		 values('9846','17988948919','2020-07-15','4');	
		
insert into event_review
		 values('1111','17988948919','2020-08-10','5');		
		
insert into event_review
		 values('1676','13068841891','2020-09-10','8');

insert into event_review
		 values('1111','13068841891','2020-07-12','6');

insert into event_review
		 values('7961','13068841891','2020-08-16','6');

insert into event_review
		 values('1023','17818495050','2020-05-17','7');

insert into event_review
		 values('1224','17818495050','2020-05-18','90');
		
insert into event_review
		 values('1785','17818495050','2020-06-20','9');		
		
insert into event_review
		 values('1676','17115961595','2020-06-29','9');		
		
insert into event_review
		 values('1783','17115961595','2020-06-25','6');		
		
insert into event_review
		 values('1785','17115961595','2020-07-13','10');		
		
insert into event_review
		 values('1224','17115961595','2020-08-30','9.5');		
		
insert into event_review
		 values('1023','17115961595','2020-09-30','7');		
		
insert into event_review
		 values('1111','15165195818','2020-10-17','7');		
		
insert into event_review
		 values('1237','15165195818','2020-11-17','7');		
		
insert into event_review
		 values('9573','15165195818','2020-12-17','9.5');
		
insert into event_review
		 values('1023','15165195818','2020-07-18','6.9');		
		
insert into event_review
		 values('1111','18098680134','2020-08-27','2');		
		
insert into event_review
		 values('1862','10259059005','2020-09-02','2');		
		
insert into event_review
		 values('1111','10259059005','2020-09-15','3');		
		
insert into event_review
		 values('1111','18561591599','2020-07-17','3.5');		
		
insert into event_review
		 values('1795','18561591599','2020-07-15','44.5');		
		
insert into event_review
		 values('1785','18561591599','2020-07-16','5');		
		
insert into event_review
		 values('1795','16518948912','2020-10-10','5.5');
		
insert into event_review
		 values('1785','16518948912','2020-11-16','7.5');
		
insert into event_review
		 values('1676','18789195516','2020-02-07','8');		
		
insert into event_review
		 values('1237','18789195516','2020-02-25','7');		
		
insert into event_review
		 values('1785','18789195516','2020-05-17','99');		
		
		
select * from Venue;
insert into venue
		 values('1214','1','3122400091','Cüneyt Gökçer Stage','Hall 1','https://tiyatrolar.com.tr/sahne/ankara/cuneyt-gokcer-sahnesi',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Çankaya','Ahmet Taner Kýþlalý','1');
	
insert into venue
		 values('1237','2','3122400091','Cüneyt Gökçer Stage','Hall 2','https://tiyatrolar.com.tr/sahne/ankara/cuneyt-gokcer-sahnesi',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Çankaya','Ahmet Taner Kýþlalý','1');		
		
insert into venue
		 values('1025','3','3122400091','Cüneyt Gökçer Stage','Hall 3','https://tiyatrolar.com.tr/sahne/ankara/cuneyt-gokcer-sahnesi',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Çankaya','Ahmet Taner Kýþlalý','1');		
		
insert into venue
		 values('9516','4','3124671744','Þinasi Stage','Hall 1','https://tiyatrolar.com.tr/sahne/ankara/sinasi-sahnesi',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Kavaklýdere','Tunus Caddesi','92');
		
insert into venue
		 values('9846','5','3124671744','Þinasi Stage','Hall 2','https://tiyatrolar.com.tr/sahne/ankara/sinasi-sahnesi',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Kavaklýdere','Tunus Caddesi','92');
	
insert into venue
		 values('1981','6','2125722070','Leyla Gencer Opera and Art Center','Hall 1','http://www.leylagenceropera.net/',bytea('D:/seatarr.jpg'),'10','Türkiye','Ýstanbul','Bakýrköy','Osmaniye Mah. Ýncirli Yolu Sok.','27/31');
			
insert into venue
		 values('1783','7','2125722070','Leyla Gencer Opera and Art Center','Hall 2','http://www.leylagenceropera.net/',bytea('D:/seatarr.jpg'),'10','Türkiye','Ýstanbul','Bakýrköy','Osmaniye Mah. Ýncirli Yolu Sok.','27/31');
				
insert into venue
		 values('1293','8','3123242214','Ankara General Directorate of Opera and Ballet','Hall 1','https://www.operabale.gov.tr/tr-tr/ankara/Sayfalar/repertoire.aspx',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Ulus','Ankara Bulvarý','20');				
		
insert into venue
		 values('1795','9','3123242214','Ankara General Directorate of Opera and Ballet','Hall 2','https://www.operabale.gov.tr/tr-tr/ankara/Sayfalar/repertoire.aspx',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Ulus','Ankara Bulvarý','20');		

insert into venue
		 values('7961','10','3123242214','Ankara General Directorate of Opera and Ballet','Hall 3','https://www.operabale.gov.tr/tr-tr/ankara/Sayfalar/repertoire.aspx',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Ulus','Ankara Bulvarý','20');				
		
insert into venue
		 values('1111','11','3122411241','Arcadium Cinema','Hall 1','http://www.arcadiumsinemalari.com.tr/',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Çankaya','Koru Mahallesi 2432. Cad.','192/121');		

insert into venue
		 values('1676','12','3122411241','Arcadium Cinema','Hall 2','http://www.arcadiumsinemalari.com.tr/',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Çankaya','Koru Mahallesi 2432. Cad.','192/121');				
		
insert into venue
		 values('1785','13','3122199393','Prestige Cinema','Hall 1','http://www.prestigecinema.com.tr/',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Çankaya','Mustafa Kemal MAh','164');		
		
insert into venue
		 values('1023','14','8502200967','Cinemaximum AnkaMall','Hall 1','https://www.cinemaximum.com.tr/ankamall-sinema-salonu',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Yenimahalle','Gazi, Akköprü','2/242');		
		
insert into venue
		 values('1092','15','2124813383','Cinemaximum AnkaMall','Hall 2','https://www.cinemaximum.com.tr/ankamall-sinema-salonu',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Yenimahalle','Gazi, Akköprü','2/242');		
			
insert into venue
		 values('1985','16','2124813383','Cinemaximum AnkaMall','Hall 3','https://www.cinemaximum.com.tr/ankamall-sinema-salonu',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Yenimahalle','Gazi, Akköprü','2/242');		
				
insert into venue
		 values('9573','17','2124813383','Metropol Cinema','Hall 6','https://www.avsarsinema.com.tr/sinema-salonlari/ankara-metropol-avsar/',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Kýzýlay','Selanik Cad.','76');		
			
insert into venue
		 values('1224','18','3122850385','Congresium Kongre ve Sergi Merkezi','Main Section','https://www.cinemaximum.com.tr/ankamall-sinema-salonu',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Çankaya','Söðütözü Cad.','1');		
		
insert into venue
		 values('1573','19','2129123776','Zorlu Center Performing Arts Center','Main Section','https://www.zorlupsm.com/tr',bytea('D:/seatarr.jpg'),'10','Türkiye','Ýstanbul','Beþiktaþ','Koru Sok.','2');		
		
insert into venue
		 values('1862','20','8505490126','Jolly Joker','Main Section','https://jollyjoker.com.tr/',bytea('D:/seatarr.jpg'),'10','Türkiye','Ankara','Çankaya','Kýzýlýrmak Cad.','14');		
		
insert into venue
		 values('5515','21','2129123776','Babylon','Main Section','https://babylon.com.tr/',bytea('D:/seatarr.jpg'),'10','Türkiye','Ýstanbul','Þiþli','Silahþör Cad. Birahane Sok.','1');		
		
		

select * from Seat
insert into seat
		 values('18098680134','1214','1','000001','B1','Standart');
		
insert into seat
		 values('16429085948','1214','1','000002','B2','Standart');		
		
insert into seat
		 values('14945614554','1214','1','000003','B3','Standart');		
		
insert into seat
		 values('11985981251','1214','1','000004','C1','Standart');		
		
insert into seat
		 values('18958959898','1214','1','000005','C2','Standart');		
		
insert into seat
		 values('15620505060','1214','1','000006','C3','Standart');		
		
insert into seat
		 values('15165195818','1214','1','000007','D1','Standart');		
		
insert into seat
		 values('18951951581','1214','1','000008','A1','VIP');		
		
insert into seat
		 values('19848948981','1214','1','000009','A2','VIP');		
		
insert into seat
		 values('11651526516','1214','1','000010','A3','VIP');
				
		
insert into seat
		 values('15020955900','1237','2','000011','B1','Standart');
		
insert into seat
		 values('10020566506','1237','2','000012','B2','Standart');		
		
insert into seat
		 values('10561898914','1237','2','000013','B3','Standart');		
		
insert into seat
		 values('19859819785','1237','2','000014','C1','Standart');		
		
insert into seat
		 values('15814985519','1237','2','000015','C2','Standart');		
		
insert into seat
		 values('15620505060','1237','2','000016','C3','Standart');		
		
insert into seat
		 values('14065159815','1237','2','000017','D1','Standart');		
		
insert into seat
		 values('17561590505','1237','2','000018','A1','VIP');		
		
insert into seat
		 values('18789195516','1237','2','000019','A2','VIP');		
		
insert into seat
		 values('16059159050','1237','2','000020','A3','VIP');		
		
		
insert into seat
		 values('15995095950','1025','3','000021','B1','Standart');
		
insert into seat
		 values('19859819785','1025','3','000022','B2','Standart');		
		
insert into seat
		 values('12059591958','1025','3','000023','B3','Standart');		
		
insert into seat
		 values('16518948912','1025','3','000024','C1','Standart');		
		
insert into seat
		 values('16429085948','1025','3','000025','C2','Standart');		
		
insert into seat
		 values('18951951581','1025','3','000026','C3','Standart');		
		
insert into seat
		 values('15020955900','1025','3','000027','D1','Standart');		
		
insert into seat
		 values('10561898914','1025','3','000028','A1','VIP');		
		
insert into seat
		 values('17988948919','1025','3','000029','A2','VIP');		
		
insert into seat
		 values('18956159198','1025','3','000030','A3','VIP');		
		
		
insert into seat
		 values('18098680134','9516','4','000031','B1','Standart');
		
insert into seat
		 values('11651526516','9516','4','000032','B2','Standart');		
		
insert into seat
		 values('14945614554','9516','4','000033','B3','Standart');		
		
insert into seat
		 values('10020566506','9516','4','000034','C1','Standart');		
		
insert into seat
		 values('10561898914','9516','4','000035','C2','Standart');		
		
insert into seat
		 values('14065159815','9516','4','000036','C3','Standart');		
		
insert into seat
		 values('18789195516','9516','4','000037','D1','Standart');		
		
insert into seat
		 values('17115961595','9516','4','000038','A1','VIP');		
		
insert into seat
		 values('18915615959','9516','4','000039','A2','VIP');		
		
insert into seat
		 values('16518948912','9516','4','000040','A3','VIP');		
		
		
insert into seat
		 values('18561591599','9846','5','000041','B1','Standart');
		
insert into seat
		 values('11591985191','9846','5','000042','B2','Standart');		
		
insert into seat
		 values('12059591958','9846','5','000043','B3','Standart');		
		
insert into seat
		 values('18956159198','9846','5','000044','C1','Standart');		
		
insert into seat
		 values('17988948919','9846','5','000045','C2','Standart');		
		
insert into seat
		 values('11985981251','9846','5','000046','C3','Standart');		
		
insert into seat
		 values('18958959898','9846','5','000047','D1','Standart');		
		
insert into seat
		 values('15165195818','9846','5','000048','A1','VIP');		
		
insert into seat
		 values('18951951581','9846','5','000049','A2','VIP');		
		
insert into seat
		 values('19848948981','9846','5','000050','A3','VIP');		
		
		
insert into seat
		 values('19859819785','1981','6','000051','B1','Standart');
		
insert into seat
		 values('15814985519','1981','6','000052','B2','Standart');		
		
insert into seat
		 values('15620505060','1981','6','000053','B3','Standart');		
		
insert into seat
		 values('14065159815','1981','6','000054','C1','Standart');		
		
insert into seat
		 values('17561590505','1981','6','000055','C2','Standart');		
		
insert into seat
		 values('18789195516','1981','6','000056','C3','Standart');		
		
insert into seat
		 values('16059159050','1981','6','000057','D1','Standart');		
		
insert into seat
		 values('17115961595','1981','6','000058','A1','VIP');		
		
insert into seat
		 values('17818495050','1981','6','000059','A2','VIP');		
		
insert into seat
		 values('14845919514','1981','6','000060','A3','VIP');	
		
		
insert into seat
		 values('18098680134','1783','7','000061','B1','Standart');
		
insert into seat
		 values('16429085948','1783','7','000062','B2','Standart');		
		
insert into seat
		 values('11985981251','1783','7','000063','B3','Standart');		
		
insert into seat
		 values('18951951581','1783','7','000064','C1','Standart');		
		
insert into seat
		 values('17988948919','1783','7','000065','C2','Standart');		
		
insert into seat
		 values('18956159198','1783','7','000066','C3','Standart');		
		
insert into seat
		 values('12059591958','1783','7','000067','D1','Standart');		
		
insert into seat
		 values('10020566506','1783','7','000068','A1','VIP');		
		
insert into seat
		 values('10561898914','1783','7','000069','A2','VIP');		
		
insert into seat
		 values('19859819785','1783','7','000070','A3','VIP');		
		

insert into seat
		 values('15814985519','1293','8','000071','B1','Standart');
		
insert into seat
		 values('18958959898','1293','8','000072','B2','Standart');		
		
insert into seat
		 values('15165195818','1293','8','000073','B3','Standart');		
		
insert into seat
		 values('18951951581','1293','8','000074','C1','Standart');		
		
insert into seat
		 values('19848948981','1293','8','000075','C2','Standart');		
		
insert into seat
		 values('17818495050','1293','8','000076','C3','Standart');		
		
insert into seat
		 values('14845919514','1293','8','000077','D1','Standart');		
		
insert into seat
		 values('18915615959','1293','8','000078','A1','VIP');		
		
insert into seat
		 values('11591985191','1293','8','000079','A2','VIP');		
		
insert into seat
		 values('12059591958','1293','8','000080','A3','VIP');		
		
		
insert into seat
		 values('14945614554','1795','9','000081','B1','Standart');
		
insert into seat
		 values('11985981251','1795','9','000082','B2','Standart');		
		
insert into seat
		 values('18951951581','1795','9','000083','B3','Standart');		
		
insert into seat
		 values('10561898914','1795','9','000084','C1','Standart');		
		
insert into seat
		 values('19859819785','1795','9','000085','C2','Standart');		
		
insert into seat
		 values('18098680134','1795','9','000086','C3','Standart');		
		
insert into seat
		 values('12059591958','1795','9','000087','D1','Standart');		
		
insert into seat
		 values('11591985191','1795','9','000088','A1','VIP');		
		
insert into seat
		 values('16518948912','1795','9','000089','A2','VIP');		
		
insert into seat
		 values('14845919514','1795','9','000090','A3','VIP');				
		
		
insert into seat
		 values('18958959898','7961','10','000091','B1','Standart');
		
insert into seat
		 values('18951951581','7961','10','000092','B2','Standart');		
		
insert into seat
		 values('19846516516','7961','10','000093','B3','Standart');		
		
insert into seat
		 values('15995095950','7961','10','000094','C1','Standart');		
		
insert into seat
		 values('15020955900','7961','10','000095','C2','Standart');		
		
insert into seat
		 values('15620505060','7961','10','000096','C3','Standart');		
		
insert into seat
		 values('17561590505','7961','10','000097','D1','Standart');		
		
insert into seat
		 values('18098680134','7961','10','000098','A1','VIP');		
		
insert into seat
		 values('17818495050','7961','10','000099','A2','VIP');		
		
insert into seat
		 values('16518948912','7961','10','000100','A3','VIP');			
		
		
insert into seat
		 values('16518948912','1111','11','000101','B1','Standart');
		
insert into seat
		 values('16429085948','1111','11','000102','B2','Standart');		
		
insert into seat
		 values('17988948919','1111','11','000103','B3','Standart');		
		
insert into seat
		 values('15020955900','1111','11','000104','C1','Standart');		
		
insert into seat
		 values('18958959898','1111','11','000105','C2','Standart');		
		
insert into seat
		 values('15620505060','1111','11','000106','C3','Standart');		
		
insert into seat
		 values('16059159050','1111','11','000107','D1','Standart');		
		
insert into seat
		 values('11985981251','1111','11','000108','A1','Standart');		
		
insert into seat
		 values('10020566506','1111','11','000109','A2','Standart');		
		
insert into seat
		 values('14945614554','1111','11','000110','A3','Standart');		
		
		
insert into seat
		 values('10561898914','1676','12','000111','B1','Standart');
		
insert into seat
		 values('15814985519','1676','12','000112','B2','Standart');		
		
insert into seat
		 values('16059159050','1676','12','000113','B3','Standart');		
		
insert into seat
		 values('17818495050','1676','12','000114','C1','Standart');		
		
insert into seat
		 values('14845919514','1676','12','000115','C2','Standart');		
		
insert into seat
		 values('11591985191','1676','12','000116','C3','Standart');		
		
insert into seat
		 values('12059591958','1676','12','000117','D1','Standart');		
		
insert into seat
		 values('18789195516','1676','12','000118','A1','Standart');		
		
insert into seat
		 values('11651526516','1676','12','000119','A2','Standart');		
		
insert into seat
		 values('14945614554','1676','12','000120','A3','Standart');		
		
		
insert into seat
		 values('16429085948','1785','13','000121','B1','Standart');
		
insert into seat
		 values('18098680134','1785','13','000122','B2','Standart');		
		
insert into seat
		 values('18958959898','1785','13','000123','B3','Standart');		
		
insert into seat
		 values('17561590505','1785','13','000124','C1','Standart');		
		
insert into seat
		 values('12059591958','1785','13','000125','C2','Standart');		
		
insert into seat
		 values('14845919514','1785','13','000126','C3','Standart');		
		
insert into seat
		 values('15620505060','1785','13','000127','D1','Standart');		
		
insert into seat
		 values('15995095950','1785','13','000128','A1','Standart');		
		
insert into seat
		 values('17988948919','1785','13','000129','A2','Standart');		
		
insert into seat
		 values('15020955900','1785','13','000130','A3','Standart');			
		
		
insert into seat
		 values('14845919514','1023','14','000131','B1','Standart');
		
insert into seat
		 values('17561590505','1023','14','000132','B2','Standart');		
		
insert into seat
		 values('15620505060','1023','14','000133','B3','Standart');		
		
insert into seat
		 values('15995095950','1023','14','000134','C1','Standart');		
		
insert into seat
		 values('15020955900','1023','14','000135','C2','Standart');		
		
insert into seat
		 values('19848948981','1023','14','000136','C3','Standart');		
		
insert into seat
		 values('18958959898','1023','14','000137','D1','Standart');		
		
insert into seat
		 values('11651526516','1023','14','000138','A1','Standart');		
		
insert into seat
		 values('10020566506','1023','14','000139','A2','Standart');		
		
insert into seat
		 values('14945614554','1023','14','000140','A3','Standart');			
		
		
insert into seat
		 values('14065159815','1092','15','000141','B1','Standart');
		
insert into seat
		 values('11985981251','1092','15','000142','B2','Standart');		
		
insert into seat
		 values('18951951581','1092','15','000143','B3','Standart');		
		
insert into seat
		 values('19848948981','1092','15','000144','C1','Standart');		
		
insert into seat
		 values('11651526516','1092','15','000145','C2','Standart');		
		
insert into seat
		 values('18561591599','1092','15','000146','C3','Standart');		
		
insert into seat
		 values('11591985191','1092','15','000147','D1','Standart');		
		
insert into seat
		 values('12059591958','1092','15','000148','A1','Standart');		
		
insert into seat
		 values('18956159198','1092','15','000149','A2','Standart');		
		
insert into seat
		 values('17988948919','1092','15','000150','A3','Standart');			
		
		
insert into seat
		 values('14945614554','1985','16','000151','B1','Standart');
		
insert into seat
		 values('11985981251','1985','16','000152','B2','Standart');		
		
insert into seat
		 values('19859819785','1985','16','000153','B3','Standart');		
		
insert into seat
		 values('19848948981','1985','16','000154','C1','Standart');		
		
insert into seat
		 values('19846516516','1985','16','000155','C2','Standart');		
		
insert into seat
		 values('11651526516','1985','16','000156','C3','Standart');		
		
insert into seat
		 values('15995095950','1985','16','000157','D1','Standart');		
		
insert into seat
		 values('15020955900','1985','16','000158','A1','Standart');		
		
insert into seat
		 values('17561590505','1985','16','000159','A2','Standart');		
		
insert into seat
		 values('18789195516','1985','16','000160','A3','Standart');	
		
		
insert into seat
		 values('16059159050','9573','17','000161','B1','Standart');
		
insert into seat
		 values('17115961595','9573','17','000162','B2','Standart');		
		
insert into seat
		 values('17818495050','9573','17','000163','B3','Standart');		
		
insert into seat
		 values('14845919514','9573','17','000164','C1','Standart');		
		
insert into seat
		 values('18915615959','9573','17','000165','C2','Standart');		
		
insert into seat
		 values('16518948912','9573','17','000166','C3','Standart');		
		
insert into seat
		 values('18561591599','9573','17','000167','D1','Standart');		
		
insert into seat
		 values('11591985191','9573','17','000168','A1','Standart');		
		
insert into seat
		 values('12059591958','9573','17','000169','A2','Standart');		
		
insert into seat
		 values('14945614554','9573','17','000170','A3','Standart');		
		
		
insert into seat
		 values('18951951581','1224','18','000171','B1','Standart');
		
insert into seat
		 values('16518948912','1224','18','000172','B2','Standart');		
		
insert into seat
		 values('10561898914','1224','18','000173','B3','Standart');		
		
insert into seat
		 values('19848948981','1224','18','000174','C1','Standart');		
		
insert into seat
		 values('15020955900','1224','18','000175','C2','Standart');		
		
insert into seat
		 values('14065159815','1224','18','000176','C3','Standart');		
		
insert into seat
		 values('17115961595','1224','18','000177','D1','Standart');		
		
insert into seat
		 values('16429085948','1224','18','000178','A1','VIP');		
		
insert into seat
		 values('17561590505','1224','18','000179','A2','VIP');		
		
insert into seat
		 values('18098680134','1224','18','000180','A3','VIP');
		
		
insert into seat
		 values('16429085948','1573','19','000181','B1','Standart');
		
insert into seat
		 values('16059159050','1573','19','000182','B2','Standart');		
		
insert into seat
		 values('14065159815','1573','19','000183','B3','Standart');		
		
insert into seat
		 values('15814985519','1573','19','000184','C1','Standart');		
		
insert into seat
		 values('10561898914','1573','19','000185','C2','Standart');		
		
insert into seat
		 values('10020566506','1573','19','000186','C3','Standart');		
		
insert into seat
		 values('15995095950','1573','19','000187','D1','Standart');		
		
insert into seat
		 values('11651526516','1573','19','000188','A1','VIP');		
		
insert into seat
		 values('15020955900','1573','19','000189','A2','VIP');		
		
insert into seat
		 values('17818495050','1573','19','000190','A3','VIP');		
		
	
insert into seat
		 values('16518948912','1862','20','000191','B1','Standart');
		
insert into seat
		 values('11651526516','1862','20','000192','B2','Standart');		
		
insert into seat
		 values('10020566506','1862','20','000193','B3','Standart');		
		
insert into seat
		 values('14065159815','1862','20','000194','C1','Standart');		

insert into seat
		 values('14845919514','1862','20','000195','C2','Standart');		
		
insert into seat
		 values('16429085948','1862','20','000196','C3','Standart');		
		
insert into seat
		 values('14945614554','1862','20','000197','D1','Standart');		
		
insert into seat
		 values('19846516516','1862','20','000198','A1','VIP');		
		
insert into seat
		 values('19859819785','1862','20','000199','A2','VIP');		
		
insert into seat
		 values('18789195516','1862','20','000200','A3','VIP');		
		
		
insert into seat
		 values('18098680134','5515','21','000201','B1','Standart');
		
insert into seat
		 values('15814985519','5515','21','000202','B2','Standart');		
		
insert into seat
		 values('17988948919','5515','21','000203','B3','Standart');		
		
insert into seat
		 values('14065159815','5515','21','000204','C1','Standart');		
		
insert into seat
		 values('18958959898','5515','21','000205','C2','Standart');		
		
insert into seat
		 values('19848948981','5515','21','000206','C3','Standart');		
		
insert into seat
		 values('15020955900','5515','21','000207','D1','Standart');		
		
insert into seat
		 values('10020566506','5515','21','000208','A1','VIP');		
		
insert into seat
		 values('15620505060','5515','21','000209','A2','VIP');		
		
insert into seat
		 values('16059159050','5515','21','000210','A3','VIP');			
		
		
		
select * from Seat_Review;
insert into seat_review
		 values('18098680134','1214','1','000001','000001','5',bytea('D:/seatrev.jpg'),'1995-04-07');
		
insert into seat_review
		 values('16429085948','1214','1','000002','000002','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('14945614554','1214','1','000003','000003','5',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('11985981251','1214','1','000004','000004','10',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('18958959898','1214','1','000005','000005','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('15620505060','1214','1','000006','000006','10',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('15165195818','1214','1','000007','000007','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('18951951581','1214','1','000008','000008','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('19848948981','1214','1','000009','000009','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('11651526516','1214','1','000010','000010','0',bytea('D:/seatrev.jpg'),'1995-04-07');
				
		
insert into seat_review
		 values('15020955900','1237','2','000011','000011','5',bytea('D:/seatrev.jpg'),'1995-04-07');
		
insert into seat_review
		 values('10020566506','1237','2','000012','000012','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('10561898914','1237','2','000013','000013','5',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('19859819785','1237','2','000014','000014','10',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('15814985519','1237','2','000015','000015','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('15620505060','1237','2','000016','000016','10',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('14065159815','1237','2','000017','000017','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('17561590505','1237','2','000018','000018','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('18789195516','1237','2','000019','000019','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('16059159050','1237','2','000020','000020','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
		
insert into seat_review
		 values('15995095950','1025','3','000021','000021','5',bytea('D:/seatrev.jpg'),'1995-04-07');
		
insert into seat_review
		 values('19859819785','1025','3','000022','000022','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('12059591958','1025','3','000023','000023','5',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('16518948912','1025','3','000024','000024','10',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('16429085948','1025','3','000025','000025','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('18951951581','1025','3','000026','000026','10',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('15020955900','1025','3','000027','000027','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('10561898914','1025','3','000028','000028','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('17988948919','1025','3','000029','000029','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
insert into seat_review
		 values('18956159198','1025','3','000030','000030','0',bytea('D:/seatrev.jpg'),'1995-04-07');		
		
		
insert into seat_review
		 values('18098680134','9516','4','000031','000031','5',bytea('D:/seatrev.jpg'),'1988-01-01');
		
insert into seat_review
		 values('11651526516','9516','4','000032','000032','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('14945614554','9516','4','000033','000033','5',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('10020566506','9516','4','000034','000034','10',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('10561898914','9516','4','000035','000035','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('14065159815','9516','4','000036','000036','10',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('18789195516','9516','4','000037','000037','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('17115961595','9516','4','000038','000038','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('18915615959','9516','4','000039','000039','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('16518948912','9516','4','000040','000040','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
		
insert into seat_review
		 values('18561591599','9846','5','000041','000041','5',bytea('D:/seatrev.jpg'),'1988-01-01');
		
insert into seat_review
		 values('11591985191','9846','5','000042','000042','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('12059591958','9846','5','000043','000043','5',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('18956159198','9846','5','000044','000044','10',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('17988948919','9846','5','000045','000045','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('11985981251','9846','5','000046','000046','10',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('18958959898','9846','5','000047','000047','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('15165195818','9846','5','000048','000048','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('18951951581','9846','5','000049','000049','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
insert into seat_review
		 values('19848948981','9846','5','000050','000050','0',bytea('D:/seatrev.jpg'),'1988-01-01');		
		
		
insert into seat_review
		 values('19859819785','1981','6','000051','000051','5',bytea('D:/seatrev.jpg'),'1948-04-02');
		
insert into seat_review
		 values('15814985519','1981','6','000052','000052','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('15620505060','1981','6','000053','000053','5',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('14065159815','1981','6','000054','000054','10',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('17561590505','1981','6','000055','000055','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('18789195516','1981','6','000056','000056','10',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('16059159050','1981','6','000057','000057','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('17115961595','1981','6','000058','000058','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('17818495050','1981','6','000059','000059','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('14845919514','1981','6','000060','000060','0',bytea('D:/seatrev.jpg'),'1948-04-02');	
		
		
insert into seat_review
		 values('18098680134','1783','7','000061','000061','5',bytea('D:/seatrev.jpg'),'1948-04-02');
		
insert into seat_review
		 values('16429085948','1783','7','000062','000062','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('11985981251','1783','7','000063','000063','5',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('18951951581','1783','7','000064','000064','10',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('17988948919','1783','7','000065','000065','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('18956159198','1783','7','000066','000066','10',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('12059591958','1783','7','000067','000067','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('10020566506','1783','7','000068','000068','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('10561898914','1783','7','000069','000069','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		
insert into seat_review
		 values('19859819785','1783','7','000070','000070','0',bytea('D:/seatrev.jpg'),'1948-04-02');		
		

insert into seat_review
		 values('15814985519','1293','8','000071','000071','5',bytea('D:/seatrev.jpg'),'1948-01-01');
		
insert into seat_review
		 values('18958959898','1293','8','000072','000072','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('15165195818','1293','8','000073','000073','5',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('18951951581','1293','8','000074','000074','10',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('19848948981','1293','8','000075','000075','0',bytea('D:/seatrev.jpg'),'1948-01-01');		

insert into seat_review
		 values('17818495050','1293','8','000076','000076','10',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('14845919514','1293','8','000077','000077','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('18915615959','1293','8','000078','000078','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('11591985191','1293','8','000079','000079','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('12059591958','1293','8','000080','000080','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
		
insert into seat_review
		 values('14945614554','1795','9','000081','000081','5',bytea('D:/seatrev.jpg'),'1948-01-01');
		
insert into seat_review
		 values('11985981251','1795','9','000082','000082','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('18951951581','1795','9','000083','000083','5',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('10561898914','1795','9','000084','000084','10',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('19859819785','1795','9','000085','000085','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('18098680134','1795','9','000086','000086','10',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('12059591958','1795','9','000087','000087','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('11591985191','1795','9','000088','000088','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('16518948912','1795','9','000089','000089','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('14845919514','1795','9','000090','000090','0',bytea('D:/seatrev.jpg'),'1948-01-01');				
		
		
insert into seat_review
		 values('18958959898','7961','10','000091','000091','5',bytea('D:/seatrev.jpg'),'1948-01-01');
		
insert into seat_review
		 values('18951951581','7961','10','000092','000092','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('19846516516','7961','10','000093','000093','5',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('15995095950','7961','10','000094','000094','10',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('15020955900','7961','10','000095','000095','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('15620505060','7961','10','000096','000096','10',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('17561590505','7961','10','000097','000097','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('18098680134','7961','10','000098','000098','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('17818495050','7961','10','000099','000099','0',bytea('D:/seatrev.jpg'),'1948-01-01');		
		
insert into seat_review
		 values('16518948912','7961','10','000100','000100','0',bytea('D:/seatrev.jpg'),'1948-01-01');			
		
		
insert into seat_review
		 values('16518948912','1111','11','000101','000101','5',bytea('D:/seatrev.jpg'),'2003-01-01');
		
insert into seat_review
		 values('16429085948','1111','11','000102','000102','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('17988948919','1111','11','000103','000103','5',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('15020955900','1111','11','000104','000104','10',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('18958959898','1111','11','000105','000105','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('15620505060','1111','11','000106','000106','10',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('16059159050','1111','11','000107','000107','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('11985981251','1111','11','000108','000108','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('10020566506','1111','11','000109','000109','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('14945614554','1111','11','000110','000110','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
		
insert into seat_review
		 values('10561898914','1676','12','000111','000111','5',bytea('D:/seatrev.jpg'),'2003-01-01');
		
insert into seat_review
		 values('15814985519','1676','12','000112','000112','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('16059159050','1676','12','000113','000113','5',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('17818495050','1676','12','000114','000114','10',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('14845919514','1676','12','000115','000115','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('11591985191','1676','12','000116','000116','10',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('12059591958','1676','12','000117','000117','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('18789195516','1676','12','000118','000118','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('11651526516','1676','12','000119','000119','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
insert into seat_review
		 values('14945614554','1676','12','000120','000120','0',bytea('D:/seatrev.jpg'),'2003-01-01');		
		
		
insert into seat_review
		 values('16429085948','1785','13','000121','000121','5',bytea('D:/seatrev.jpg'),'1994-01-01');
		
insert into seat_review
		 values('18098680134','1785','13','000122','000122','0',bytea('D:/seatrev.jpg'),'1994-01-01');		
		
insert into seat_review
		 values('18958959898','1785','13','000123','000123','5',bytea('D:/seatrev.jpg'),'1994-01-01');		
		
insert into seat_review
		 values('17561590505','1785','13','000124','000124','10',bytea('D:/seatrev.jpg'),'1994-01-01');		
		
insert into seat_review
		 values('12059591958','1785','13','000125','000125','0',bytea('D:/seatrev.jpg'),'1994-01-01');		
		
insert into seat_review
		 values('14845919514','1785','13','000126','000126','10',bytea('D:/seatrev.jpg'),'1994-01-01');		
		
insert into seat_review
		 values('15620505060','1785','13','000127','000127','0',bytea('D:/seatrev.jpg'),'1994-01-01');		
		
insert into seat_review
		 values('15995095950','1785','13','000128','000128','0',bytea('D:/seatrev.jpg'),'1994-01-01');		
		
insert into seat_review
		 values('17988948919','1785','13','000129','000129','0',bytea('D:/seatrev.jpg'),'1994-01-01');		
		
insert into seat_review
		 values('15020955900','1785','13','000130','000130','0',bytea('D:/seatrev.jpg'),'1994-01-01');			
		
		
insert into seat_review
		 values('14845919514','1023','14','000131','000131','5',bytea('D:/seatrev.jpg'),'2006-05-12');
		
insert into seat_review
		 values('17561590505','1023','14','000132','000132','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('15620505060','1023','14','000133','000133','5',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('15995095950','1023','14','000134','000134','10',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('15020955900','1023','14','000135','000135','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('19848948981','1023','14','000136','000136','10',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('18958959898','1023','14','000137','000137','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('11651526516','1023','14','000138','000138','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('10020566506','1023','14','000139','000139','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('14945614554','1023','14','000140','000140','0',bytea('D:/seatrev.jpg'),'2006-05-12');			
		
		
insert into seat_review
		 values('14065159815','1092','15','000141','000141','5',bytea('D:/seatrev.jpg'),'2006-05-12');
		
insert into seat_review
		 values('11985981251','1092','15','000142','000142','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('18951951581','1092','15','000143','000143','5',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('19848948981','1092','15','000144','000144','10',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('11651526516','1092','15','000145','000145','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('18561591599','1092','15','000146','000146','10',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('11591985191','1092','15','000147','000147','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('12059591958','1092','15','000148','000148','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('18956159198','1092','15','000149','000149','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('17988948919','1092','15','000150','000150','0',bytea('D:/seatrev.jpg'),'2006-05-12');			
		
		
insert into seat_review
		 values('14945614554','1985','16','000151','000151','5',bytea('D:/seatrev.jpg'),'2006-05-12');
		
insert into seat_review
		 values('11985981251','1985','16','000152','000152','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('19859819785','1985','16','000153','000153','5',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('19848948981','1985','16','000154','000154','10',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('19846516516','1985','16','000155','000155','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('11651526516','1985','16','000156','000156','10',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('15995095950','1985','16','000157','000157','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('15020955900','1985','16','000158','000158','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('17561590505','1985','16','000159','000159','0',bytea('D:/seatrev.jpg'),'2006-05-12');		
		
insert into seat_review
		 values('18789195516','1985','16','000160','000160','0',bytea('D:/seatrev.jpg'),'2006-05-12');	
		
		
insert into seat_review
		 values('16059159050','9573','17','000161','000161','5',bytea('D:/seatrev.jpg'),'2000-01-01');
		
insert into seat_review
		 values('17115961595','9573','17','000162','000162','0',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
insert into seat_review
		 values('17818495050','9573','17','000163','000163','5',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
insert into seat_review
		 values('14845919514','9573','17','000164','000164','10',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
insert into seat_review
		 values('18915615959','9573','17','000165','000165','0',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
insert into seat_review
		 values('16518948912','9573','17','000166','000166','10',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
insert into seat_review
		 values('18561591599','9573','17','000167','000167','0',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
insert into seat_review
		 values('11591985191','9573','17','000168','000168','0',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
insert into seat_review
		 values('12059591958','9573','17','000169','000169','0',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
insert into seat_review
		 values('14945614554','9573','17','000170','000170','0',bytea('D:/seatrev.jpg'),'2000-01-01');		
		
		
insert into seat_review
		 values('18951951581','1224','18','000171','000171','5',bytea('D:/seatrev.jpg'),'2010-01-01');
		
insert into seat_review
		 values('16518948912','1224','18','000172','000172','0',bytea('D:/seatrev.jpg'),'2010-01-01');		
		
insert into seat_review
		 values('10561898914','1224','18','000173','000173','5',bytea('D:/seatrev.jpg'),'2010-01-01');		
		
insert into seat_review
		 values('19848948981','1224','18','000174','000174','10',bytea('D:/seatrev.jpg'),'2010-01-01');		
		
insert into seat_review
		 values('15020955900','1224','18','000175','000175','0',bytea('D:/seatrev.jpg'),'2010-01-01');		
		
insert into seat_review
		 values('14065159815','1224','18','000176','000176','10',bytea('D:/seatrev.jpg'),'2010-01-01');		
		
insert into seat_review
		 values('17115961595','1224','18','000177','000177','0',bytea('D:/seatrev.jpg'),'2010-01-01');		
		
insert into seat_review
		 values('16429085948','1224','18','000178','000178','0',bytea('D:/seatrev.jpg'),'2010-01-01');		
		
insert into seat_review
		 values('17561590505','1224','18','000179','000179','0',bytea('D:/seatrev.jpg'),'2010-01-01');		
		
insert into seat_review
		 values('18098680134','1224','18','000180','000180','0',bytea('D:/seatrev.jpg'),'2010-01-01');
		
		
insert into seat_review
		 values('16429085948','1573','19','000181','000181','5',bytea('D:/seatrev.jpg'),'2013-01-01');
		
insert into seat_review
		 values('16059159050','1573','19','000182','000182','0',bytea('D:/seatrev.jpg'),'2013-01-01');		
		
insert into seat_review
		 values('14065159815','1573','19','000183','000183','5',bytea('D:/seatrev.jpg'),'2013-01-01');		

insert into seat_review
		 values('15814985519','1573','19','000184','000184','10',bytea('D:/seatrev.jpg'),'2013-01-01');		
		
insert into seat_review
		 values('10561898914','1573','19','000185','000185','0',bytea('D:/seatrev.jpg'),'2013-01-01');		
		
insert into seat_review
		 values('10020566506','1573','19','000186','000186','10',bytea('D:/seatrev.jpg'),'2013-01-01');		
		
insert into seat_review
		 values('15995095950','1573','19','000187','000187','0',bytea('D:/seatrev.jpg'),'2013-01-01');		
		
insert into seat_review
		 values('11651526516','1573','19','000188','000188','0',bytea('D:/seatrev.jpg'),'2013-01-01');		
		
insert into seat_review
		 values('15020955900','1573','19','000189','000189','0',bytea('D:/seatrev.jpg'),'2013-01-01');		
		
insert into seat_review
		 values('17818495050','1573','19','000190','000190','0',bytea('D:/seatrev.jpg'),'2013-01-01');		
		
		
insert into seat_review
		 values('16518948912','1862','20','000191','000191','5',bytea('D:/seatrev.jpg'),'2008-12-31');
		
insert into seat_review
		 values('11651526516','1862','20','000192','000192','0',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
insert into seat_review
		 values('10020566506','1862','20','000193','000193','5',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
insert into seat_review
		 values('14065159815','1862','20','000194','000194','10',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
insert into seat_review
		 values('14845919514','1862','20','000195','000195','0',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
insert into seat_review
		 values('16429085948','1862','20','000196','000196','10',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
insert into seat_review
		 values('14945614554','1862','20','000197','000197','0',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
insert into seat_review
		 values('19846516516','1862','20','000198','000198','0',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
insert into seat_review
		 values('19859819785','1862','20','000199','000199','0',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
insert into seat_review
		 values('18789195516','1862','20','000200','000200','0',bytea('D:/seatrev.jpg'),'2008-12-31');		
		
		
insert into seat_review
		 values('18098680134','5515','21','000201','000201','5',bytea('D:/seatrev.jpg'),'1999-07-01');
		
insert into seat_review
		 values('15814985519','5515','21','000202','000202','0',bytea('D:/seatrev.jpg'),'1999-07-01');		
		
insert into seat_review
		 values('17988948919','5515','21','000203','000203','5',bytea('D:/seatrev.jpg'),'1999-07-01');		
		
insert into seat_review
		 values('14065159815','5515','21','000204','000204','10',bytea('D:/seatrev.jpg'),'1999-07-01');		
		
insert into seat_review
		 values('18958959898','5515','21','000205','000205','0',bytea('D:/seatrev.jpg'),'1999-07-01');		
		
insert into seat_review
		 values('19848948981','5515','21','000206','000206','10',bytea('D:/seatrev.jpg'),'1999-07-01');		
		
insert into seat_review
		 values('15020955900','5515','21','000207','000207','0',bytea('D:/seatrev.jpg'),'1999-07-01');		
		
insert into seat_review
		 values('10020566506','5515','21','000208','000208','0',bytea('D:/seatrev.jpg'),'1999-07-01');		
		
insert into seat_review
		 values('15620505060','5515','21','000209','000209','0',bytea('D:/seatrev.jpg'),'1999-07-01');		
		
insert into seat_review
		 values('16059159050','5515','21','000210','000210','0',bytea('D:/seatrev.jpg'),'1999-07-01');	
		
		
		
select * from Event_days;
insert into Event_days
          values('1111', 'Sunday-Monday', '10:45','3');

insert into Event_days
          values('1214', 'Monday-Wednesday', '11:30', '2');

insert into Event_days
          values('1224', 'Monday-Tuesday', '11:00', '3');

insert into Event_days
          values('1981', 'Monday-Tuesday', '10:00', '3');
         
insert into Event_days
          values('1676', 'Monday-Tuesday', '17:00', '3');

insert into Event_days
          values('1237', 'Tuesday-Thursday', '12:00', '4');
         
  insert into Event_days
          values('1785', 'Wednesday-Thursday', '13:00', '3');
       
insert into Event_days
          values('1573', 'Wednesday-Friday', '12:30', '6');
         
insert into Event_days
          values('1025', 'Thursday-Friday', '12:35', '3');

insert into Event_days
          values('1783', 'Friday-Saturday', '10:00', '2');

insert into Event_days
          values('1023', 'Wednesday-Thursday', '17:00', '2');

insert into Event_days
          values('1092', 'Monday-Friday', '20:30', '3');
	 
insert into Event_days
          values('1293', 'Thuesday-Friday', '10:30', '4');
		  
insert into Event_days
          values('1862', 'Monday-Wednesday', '14:00', '6');

insert into Event_days
          values('1795', 'Monday-Wednesday ', '12:30', '5');
		  
insert into Event_days
          values('9516', 'Monday-Wednesday ', '14:30', '3');

insert into Event_days
          values('9846', 'Tuesday-Friday', '12:30', '3');

insert into Event_days
          values('1985', 'Tuesday-Friday', '12:30', '3');
         
insert into Event_days
          values('7961', 'Thursday-Friday', '11:00', '2.5');

insert into Event_days
          values('5515', 'Tuesday', '11:30', '3');

insert into Event_days
          values('9573', 'Tuesday-Thursday', '17:00', '3');
		
insert into Event_Days
		  values ('1811','Monday-Wednesday','10:15','2');

insert into Event_Days
		  values ('6486','Tuesday-Friday','10:45','2');


		
select * from Attend;
insert into attend
		 values('18098680134','1214',true);
		
insert into attend
		 values('16429085948','1214',true);		
		
insert into attend
		 values('14945614554','1214',false);		
		
insert into attend
		 values('11985981251','1214',true);		
		
insert into attend
		 values('18958959898','1214',true);		
		
insert into attend
		 values('15620505060','1214',true);		
		
insert into attend
		 values('15165195818','1214',true);		
		
insert into attend
		 values('18951951581','1214',true);		
		
insert into attend
		 values('19848948981','1214',true);		
		
insert into attend
		 values('11651526516','1214',true);
				
		
insert into attend
		 values('15020955900','1237',true);
		
insert into attend
		 values('10020566506','1237',true);		
		
insert into attend
		 values('10561898914','1237',true);		
		
insert into attend
		 values('19859819785','1237',true);		
		
insert into attend
		 values('15814985519','1237',true);		
		
insert into attend
		 values('15620505060','1237',true);		
		
insert into attend
		 values('14065159815','1237',true);		
		
insert into attend
		 values('17561590505','1237',true);		
		
insert into attend
		 values('18789195516','1237',true);		
		
insert into attend
		 values('16059159050','1237',true);		
		
		
insert into attend
		 values('15995095950','1025',false);
		
insert into attend
		 values('19859819785','1025',true);		
		
insert into attend
		 values('12059591958','1025',true);		
		
insert into attend
		 values('16518948912','1025',true);		
		
insert into attend
		 values('16429085948','1025',true);		
		
insert into attend
		 values('18951951581','1025',true);
		
insert into attend
		 values('15020955900','1025',true);
		
insert into attend
		 values('10561898914','1025',true);
		
insert into attend
		 values('17988948919','1025',true);
		
insert into attend
		 values('18956159198','1025',true);
		
		
insert into attend
		 values('18098680134','9516',true);
		
insert into attend
		 values('11651526516','9516',true);
		
insert into attend
		 values('14945614554','9516',true);
		
insert into attend
		 values('10020566506','9516',true);
		
insert into attend
		 values('10561898914','9516',true);
		
insert into attend
		 values('14065159815','9516',true);	
		
insert into attend
		 values('18789195516','9516',true);
		
insert into attend
		 values('17115961595','9516',true);
		
insert into attend
		 values('18915615959','9516',false);
		
insert into attend
		 values('16518948912','9516',true);
		
		
insert into attend
		 values('18561591599','9846',true);
		
insert into attend
		 values('11591985191','9846',true);
		
insert into attend
		 values('12059591958','9846',true);
		
insert into attend
		 values('18956159198','9846',true);		
		
insert into attend
		 values('17988948919','9846',true);	
		
insert into attend
		 values('11985981251','9846',true);
		
insert into attend
		 values('18958959898','9846',false);
		
insert into attend
		 values('15165195818','9846',true);
		
insert into attend
		 values('18951951581','9846',true);	
		
insert into attend
		 values('19848948981','9846',true);
		
		
insert into attend
		 values('19859819785','1981',true);
		
insert into attend
		 values('15814985519','1981',true);
		
insert into attend
		 values('15620505060','1981',true);
		
insert into attend
		 values('14065159815','1981',true);
		
insert into attend
		 values('17561590505','1981',true);
		
insert into attend
		 values('18789195516','1981',true);
		
insert into attend
		 values('16059159050','1981',true);
		
insert into attend
		 values('17115961595','1981',true);
		
insert into attend
		 values('17818495050','1981',true);
		
insert into attend
		 values('14845919514','1981',true);
		
		
insert into attend
		 values('18098680134','1783',true);
		
insert into attend
		 values('16429085948','1783',true);	
		
insert into attend
		 values('11985981251','1783',false);
		
insert into attend
		 values('18951951581','1783',true);
		
insert into attend
		 values('17988948919','1783',true);
		
insert into attend
		 values('18956159198','1783',true);
		
insert into attend
		 values('12059591958','1783',true);
		
insert into attend
		 values('10020566506','1783',true);
		
insert into attend
		 values('10561898914','1783',true);
		
insert into attend
		 values('19859819785','1783',true);
		

insert into attend
		 values('15814985519','1293',true);
		
insert into attend
		 values('18958959898','1293',true);
		
insert into attend
		 values('15165195818','1293',true);
		
insert into attend
		 values('18951951581','1293',true);
		
insert into attend
		 values('19848948981','1293',true);
		
insert into attend
		 values('17818495050','1293',true);
		
insert into attend
		 values('14845919514','1293',true);
		
insert into attend
		 values('18915615959','1293',true);
		
insert into attend
		 values('11591985191','1293',true);	
		
insert into attend
		 values('12059591958','1293',true);
		
		
insert into attend
		 values('14945614554','1795',true);
		
insert into attend
		 values('11985981251','1795',true);	
		
insert into attend
		 values('18951951581','1795',true);
		
insert into attend
		 values('10561898914','1795',false);
		
insert into attend
		 values('19859819785','1795',false);
		
insert into attend
		 values('18098680134','1795',true);	
		
insert into attend
		 values('12059591958','1795',true);
		
insert into attend
		 values('11591985191','1795',true);
		
insert into attend
		 values('16518948912','1795',false);
		
insert into attend
		 values('14845919514','1795',false);		
		
		
insert into attend
		 values('18958959898','7961',true);
		
insert into attend
		 values('18951951581','7961',true);	
		
insert into attend
		 values('19846516516','7961',true);
		
insert into attend
		 values('15995095950','7961',true);
		
insert into attend
		 values('15020955900','7961',true);
		
insert into attend
		 values('15620505060','7961',true);	
		
insert into attend
		 values('17561590505','7961',true);	
		
insert into attend
		 values('18098680134','7961',false);
		
insert into attend
		 values('17818495050','7961',true);	
		
insert into attend
		 values('16518948912','7961',true);
		
		
insert into attend
		 values('16518948912','1111',true);
		
insert into attend
		 values('16429085948','1111',true);		
		
insert into attend
		 values('17988948919','1111',true);		
		
insert into attend
		 values('15020955900','1111',true);		
		
insert into attend
		 values('18958959898','1111',false);	
		
insert into attend
		 values('15620505060','1111',true);	
		
insert into attend
		 values('16059159050','1111',true);	
		
insert into attend
		 values('11985981251','1111',true);
		
insert into attend
		 values('10020566506','1111',true);
		
insert into attend
		 values('14945614554','1111',true);
		
		
insert into attend
		 values('10561898914','1676',true);
		
insert into attend
		 values('15814985519','1676',true);	
		
insert into attend
		 values('16059159050','1676',true);	
		
insert into attend
		 values('17818495050','1676',true);
		
insert into attend
		 values('14845919514','1676',true);	
		
insert into attend
		 values('11591985191','1676',true);	
		
insert into attend
		 values('12059591958','1676',true);		
		
insert into attend
		 values('18789195516','1676',true);
		
insert into attend
		 values('11651526516','1676',true);
		
insert into attend
		 values('14945614554','1676',true);
		
		
insert into attend
		 values('16429085948','1785',true);
		
insert into attend
		 values('18098680134','1785',true);	
		
insert into attend
		 values('18958959898','1785',true);
		
insert into attend
		 values('17561590505','1785',true);		
		
insert into attend
		 values('12059591958','1785',true);		
		
insert into attend
		 values('14845919514','1785',false);
		
insert into attend
		 values('15620505060','1785',false);	
		
insert into attend
		 values('15995095950','1785',true);
		
insert into attend
		 values('17988948919','1785',true);
		
insert into attend
		 values('15020955900','1785',true);		
		
		
insert into attend
		 values('14845919514','1023',true);
		
insert into attend
		 values('17561590505','1023',true);
		
insert into attend
		 values('15620505060','1023',true);		
		
insert into attend
		 values('15995095950','1023',true);
		
insert into attend
		 values('15020955900','1023',false);
		
insert into attend
		 values('19848948981','1023',true);
		
insert into attend
		 values('18958959898','1023',true);
		
insert into attend
		 values('11651526516','1023',true);
		
insert into attend
		 values('10020566506','1023',true);
		
insert into attend
		 values('14945614554','1023',true);
		
		
insert into attend
		 values('14065159815','1092',true);
		
insert into attend
		 values('11985981251','1092',true);		
		
insert into attend
		 values('18951951581','1092',false);
		
insert into attend
		 values('19848948981','1092',true);
		
insert into attend
		 values('11651526516','1092',true);
		
insert into attend
		 values('18561591599','1092',true);	
		
insert into attend
		 values('11591985191','1092',true);
		
insert into attend
		 values('12059591958','1092',true);	
		
insert into attend
		 values('18956159198','1092',true);
		
insert into attend
		 values('17988948919','1092',true);		
		
		
insert into attend
		 values('14945614554','1985',true);
		
insert into attend
		 values('11985981251','1985',true);	
		
insert into attend
		 values('19859819785','1985',false);		
		
insert into attend
		 values('19848948981','1985',true);	
		
insert into attend
		 values('19846516516','1985',true);	
		
insert into attend
		 values('11651526516','1985',true);	
		
insert into attend
		 values('15995095950','1985',true);	
		
insert into attend
		 values('15020955900','1985',true);
		
insert into attend
		 values('17561590505','1985',true);
		
insert into attend
		 values('18789195516','1985',true);
		
		
insert into attend
		 values('16059159050','9573',true);
		
insert into attend
		 values('17115961595','9573',true);
		
insert into attend
		 values('17818495050','9573',true);
		
insert into attend
		 values('14845919514','9573',true);
		
insert into attend
		 values('18915615959','9573',true);
		
insert into attend
		 values('16518948912','9573',false);
		
insert into attend
		 values('18561591599','9573',true);	
		
insert into attend
		 values('11591985191','9573',true);
		
insert into attend
		 values('12059591958','9573',false);
		
insert into attend
		 values('14945614554','9573',true);
		
		
insert into attend
		 values('18951951581','1224',true);
		
insert into attend
		 values('16518948912','1224',true);
		
insert into attend
		 values('10561898914','1224',true);
		
insert into attend
		 values('19848948981','1224',true);	
		
insert into attend
		 values('15020955900','1224',true);
		
insert into attend
		 values('14065159815','1224',true);		
		
insert into attend
		 values('17115961595','1224',true);		
		
insert into attend
		 values('16429085948','1224',true);	
		
insert into attend
		 values('17561590505','1224',true);
		
insert into attend
		 values('18098680134','1224',true);
		
		
insert into attend
		 values('16429085948','1573',true);
		
insert into attend
		 values('16059159050','1573',true);	
		
insert into attend
		 values('14065159815','1573',true);
		
insert into attend
		 values('15814985519','1573',true);
		
insert into attend
		 values('10561898914','1573',true);
		
insert into attend
		 values('10020566506','1573',true);	
		
insert into attend
		 values('15995095950','1573',false);
		
insert into attend
		 values('11651526516','1573',true);
		
insert into attend
		 values('15020955900','1573',true);
		
insert into attend
		 values('17818495050','1573',false);
		
	
insert into attend
		 values('16518948912','1862',true);
		
insert into attend
		 values('11651526516','1862',true);	
		
insert into attend
		 values('10020566506','1862',true);
		
insert into attend
		 values('14065159815','1862',true);

insert into attend
		 values('14845919514','1862',false);
		
insert into attend
		 values('16429085948','1862',true);
		
insert into attend
		 values('14945614554','1862',true);
		
insert into attend
		 values('19846516516','1862',true);
		
insert into attend
		 values('19859819785','1862',true);
		
insert into attend
		 values('18789195516','1862',true);	
		
		
insert into attend
		 values('18098680134','5515',true);
		
insert into attend
		 values('15814985519','5515',true);
		
insert into attend
		 values('17988948919','5515',true);
		
insert into attend
		 values('14065159815','5515',true);
		
insert into attend
		 values('18958959898','5515',false);
		
insert into attend
		 values('19848948981','5515',false);	
		
insert into attend
		 values('15020955900','5515',false);
		
insert into attend
		 values('10020566506','5515',true);
		
insert into attend
		 values('15620505060','5515',true);
		
insert into attend
		 values('16059159050','5515',true);
		
		
		

select * from Buy_Cancel;
insert into buy_cancel 
		 values('000001','CGS-HAL1-B1','15',true,false);
		
insert into buy_cancel 
		 values('000002','CGS-HAL1-B2','15',true,false);
		
insert into buy_cancel 
		 values('000003','CGS-HAL1-B3','15',false,false);
		
insert into buy_cancel 
		 values('000004','CGS-HAL1-C1','15',true,false);
		
insert into buy_cancel 
		 values('000005','CGS-HAL1-C2','15',true,false);
		
insert into buy_cancel 
		 values('000006','CGS-HAL1-C3','15',true,false);
		
insert into buy_cancel 
		 values('000007','CGS-HAL1-D1','15',true,false);
		
insert into buy_cancel 
		 values('000008','CGS-HAL1-A1','35',true,false);
		
insert into buy_cancel 
		 values('000009','CGS-HAL1-A2','35',true,false);
		
insert into buy_cancel 
		 values('000010','CGS-HAL1-A3','35',true,false);
		
		
insert into buy_cancel 
		 values('000011','CGS-HAL2-B1','15',true,false);
		
insert into buy_cancel 
		 values('000012','CGS-HAL2-B2','15',true,false);
		
insert into buy_cancel 
		 values('000013','CGS-HAL2-B3','15',true,false);
		
insert into buy_cancel 
		 values('000014','CGS-HAL2-C1','15',true,false);
		
insert into buy_cancel 
		 values('000015','CGS-HAL2-C2','15',true,false);
		
insert into buy_cancel 
		 values('000016','CGS-HAL2-C3','15',true,false);
		
insert into buy_cancel 
		 values('000017','CGS-HAL2-D1','15',true,false);
		
insert into buy_cancel 
		 values('000018','CGS-HAL2-A1','35',true,false);
		
insert into buy_cancel 
		 values('000019','CGS-HAL2-A2','35',true,false);
		
insert into buy_cancel 
		 values('000020','CGS-HAL2-A3','35',true,false);		

		
insert into buy_cancel 
		 values('000021','CGS-HAL3-B1','15',true,true);
		
insert into buy_cancel 
		 values('000022','CGS-HAL3-B2','15',true,false);
		
insert into buy_cancel 
		 values('000023','CGS-HAL3-B3','15',true,false);
		
insert into buy_cancel 
		 values('000024','CGS-HAL3-C1','15',true,false);
		
insert into buy_cancel 
		 values('000025','CGS-HAL3-C2','15',true,false);
		
insert into buy_cancel 
		 values('000026','CGS-HAL3-C3','15',true,false);
		
insert into buy_cancel 
		 values('000027','CGS-HAL3-D1','15',true,false);
		
insert into buy_cancel 
		 values('000028','CGS-HAL3-A1','35',true,false);
		
insert into buy_cancel 
		 values('000029','CGS-HAL3-A2','35',true,false);
		
insert into buy_cancel 
		 values('000030','CGS-HAL3-A3','35',true,false);		
		
		
insert into buy_cancel 
		 values('000031','SIS-HAL1-B1','18',true,false);
		
insert into buy_cancel 
		 values('000032','SIS-HAL1-B2','18',true,false);
		
insert into buy_cancel 
		 values('000033','SIS-HAL1-B3','18',true,false);
		
insert into buy_cancel 
		 values('000034','SIS-HAL1-C1','18',true,false);
		
insert into buy_cancel 
		 values('000035','SIS-HAL1-C2','18',true,false);
		
insert into buy_cancel 
		 values('000036','SIS-HAL1-C3','18',true,false);
		
insert into buy_cancel 
		 values('000037','SIS-HAL1-D1','18',true,false);
		
insert into buy_cancel 
		 values('000038','SIS-HAL1-A1','45',true,false);
		
insert into buy_cancel 
		 values('000039','SIS-HAL1-A2','45',true,true);
		
insert into buy_cancel 
		 values('000040','SIS-HAL1-A3','45',true,false);				
		
		
insert into buy_cancel 
		 values('000041','SIS-HAL2-B1','18',true,false);
		
insert into buy_cancel 
		 values('000042','SIS-HAL2-B2','18',true,false);
		
insert into buy_cancel 
		 values('000043','SIS-HAL2-B3','18',true,false);
		
insert into buy_cancel 
		 values('000044','SIS-HAL2-C1','18',true,false);
		
insert into buy_cancel 
		 values('000045','SIS-HAL2-C2','18',true,false);
		
insert into buy_cancel 
		 values('000046','SIS-HAL2-C3','18',true,false);
		
insert into buy_cancel 
		 values('000047','SIS-HAL2-D1','18',false,false);
		
insert into buy_cancel 
		 values('000048','SIS-HAL2-A1','45',true,false);
		
insert into buy_cancel 
		 values('000049','SIS-HAL2-A2','45',true,false);
		
insert into buy_cancel 
		 values('000050','SIS-HAL2-A3','45',true,false);				
		
		
insert into buy_cancel 
		 values('000051','LGO-HAL1-B1','30',true,false);
		
insert into buy_cancel 
		 values('000052','LGO-HAL1-B2','30',true,false);
		
insert into buy_cancel 
		 values('000053','LGO-HAL1-B3','30',true,false);
		
insert into buy_cancel 
		 values('000054','LGO-HAL1-C1','30',true,false);
		
insert into buy_cancel 
		 values('000055','LGO-HAL1-C2','30',true,false);
		
insert into buy_cancel 
		 values('000056','LGO-HAL1-C3','30',true,false);
		
insert into buy_cancel 
		 values('000057','LGO-HAL1-D1','30',true,false);
		
insert into buy_cancel 
		 values('000058','LGO-HAL1-A1','70',true,false);
		
insert into buy_cancel 
		 values('000059','LGO-HAL1-A2','70',true,false);
		
insert into buy_cancel 
		 values('000060','LGO-HAL1-A3','70',true,false);				
		
		
insert into buy_cancel 
		 values('000061','LGO-HAL2-B1','30',true,false);
		
insert into buy_cancel 
		 values('000062','LGO-HAL2-B2','30',true,false);
		
insert into buy_cancel 
		 values('000063','LGO-HAL2-B3','30',false,false);
		
insert into buy_cancel 
		 values('000064','LGO-HAL2-C1','30',true,false);
		
insert into buy_cancel
		 values('000065','LGO-HAL2-C2','30',true,false);
		
insert into buy_cancel 
		 values('000066','LGO-HAL2-C3','30',true,false);
		
insert into buy_cancel 
		 values('000067','LGO-HAL2-D1','30',true,false);
		
insert into buy_cancel 
		 values('000068','LGO-HAL2-A1','70',true,false);
		
insert into buy_cancel 
		 values('000069','LGO-HAL2-A2','70',true,false);
		
insert into buy_cancel 
		 values('000070','LGO-HAL2-A3','70',true,false);				
		
		
insert into buy_cancel 
		 values('000071','AGD-HAL1-B1','15',true,false);
		
insert into buy_cancel 
		 values('000072','AGD-HAL1-B2','15',true,false);
		
insert into buy_cancel 
		 values('000073','AGD-HAL1-B3','15',true,false);
		
insert into buy_cancel 
		 values('000074','AGD-HAL1-C1','15',true,false);
		
insert into buy_cancel 
		 values('000075','AGD-HAL1-C2','15',true,false);
		
insert into buy_cancel 
		 values('000076','AGD-HAL1-C3','15',true,false);
		
insert into buy_cancel 
		 values('000077','AGD-HAL1-D1','15',true,false);
		
insert into buy_cancel 
		 values('000078','AGD-HAL1-A1','35',true,false);
		
insert into buy_cancel 
		 values('000079','AGD-HAL1-A2','35',true,false);
		
insert into buy_cancel 
		 values('000080','AGD-HAL1-A3','35',true,false);				
		
		
insert into buy_cancel 
		 values('000081','AGD-HAL2-B1','15',true,false);
		
insert into buy_cancel 
		 values('000082','AGD-HAL2-B2','15',true,false);
		
insert into buy_cancel 
		 values('000083','AGD-HAL2-B3','15',true,false);
		
insert into buy_cancel 
		 values('000084','AGD-HAL2-C1','15',false,false);
		
insert into buy_cancel 
		 values('000085','AGD-HAL2-C2','15',true,true);
		
insert into buy_cancel 
		 values('000086','AGD-HAL2-C3','15',true,false);
		
insert into buy_cancel 
		 values('000087','AGD-HAL2-D1','15',true,false);
		
insert into buy_cancel 
		 values('000088','AGD-HAL2-A1','35',true,false);
		
insert into buy_cancel 
		 values('000089','AGD-HAL2-A2','35',true,false);
		
insert into buy_cancel 
		 values('000090','AGD-HAL2-A3','35',false,false);				
		
		
insert into buy_cancel 
		 values('000091','AGD-HAL3-B1','15',true,false);
		
insert into buy_cancel 
		 values('000092','AGD-HAL3-B2','15',true,false);
		
insert into buy_cancel 
		 values('000093','AGD-HAL3-B3','15',true,false);
		
insert into buy_cancel
		 values('000094','AGD-HAL3-C1','15',true,false);
		
insert into buy_cancel 
		 values('000095','AGD-HAL3-C2','15',true,false);
		
insert into buy_cancel 
		 values('000096','AGD-HAL3-C3','15',true,false);
		
insert into buy_cancel 
		 values('000097','AGD-HAL3-D1','15',true,false);
		
insert into buy_cancel 
		 values('000098','AGD-HAL3-A1','35',true,false);
		
insert into buy_cancel 
		 values('000099','AGD-HAL3-A2','35',true,false);
		
insert into buy_cancel 
		 values('000100','AGD-HAL3-A3','35',true,false);				
		
		
insert into buy_cancel 
		 values('000101','ARC-HAL1-B1','20',true,false);
		
insert into buy_cancel 
		 values('000102','ARC-HAL1-B2','20',true,false);
		
insert into buy_cancel 
		 values('000103','ARC-HAL1-B3','20',true,false);
		
insert into buy_cancel 
		 values('000104','ARC-HAL1-C1','20',true,false);
		
insert into buy_cancel 
		 values('000105','ARC-HAL1-C2','20',true,true);
		
insert into buy_cancel 
		 values('000106','ARC-HAL1-C3','20',true,false);
		
insert into buy_cancel 
		 values('000107','ARC-HAL1-D1','20',true,false);
		
insert into buy_cancel 
		 values('000108','ARC-HAL1-A1','20',true,false);
		
insert into buy_cancel 
		 values('000109','ARC-HAL1-A2','20',true,false);
		
insert into buy_cancel 
		 values('000110','ARC-HAL1-A3','20',true,false);				
		
		
insert into buy_cancel 
		 values('000111','ARC-HAL2-B1','20',true,false);
		
insert into buy_cancel 
		 values('000112','ARC-HAL2-B2','20',true,false);
		
insert into buy_cancel 
		 values('000113','ARC-HAL2-B3','20',true,false);
		
insert into buy_cancel 
		 values('000114','ARC-HAL2-C1','20',true,false);
		
insert into buy_cancel 
		 values('000115','ARC-HAL2-C2','20',true,false);
		
insert into buy_cancel 
		 values('000116','ARC-HAL2-C3','20',true,false);
		
insert into buy_cancel 
		 values('000117','ARC-HAL2-D1','20',true,false);
		
insert into buy_cancel 
		 values('000118','ARC-HAL2-A1','20',true,false);
		
insert into buy_cancel 
		 values('000119','ARC-HAL2-A2','20',true,false);
		
insert into buy_cancel 
		 values('000120','ARC-HAL2-A3','20',true,false);	
		
		
insert into buy_cancel 
		 values('000121','PRS-HAL1-B1','25',true,false);
		
insert into buy_cancel 
		 values('000122','PRS-HAL1-B2','25',true,false);
		
insert into buy_cancel 
		 values('000123','PRS-HAL1-B3','25',true,false);
		
insert into buy_cancel 
		 values('000124','PRS-HAL1-C1','25',true,false);
		
insert into buy_cancel 
		 values('000125','PRS-HAL1-C2','25',true,false);
		
insert into buy_cancel 
		 values('000126','PRS-HAL1-C3','25',true,true);
		
insert into buy_cancel 
		 values('000127','PRS-HAL1-D1','25',false,false);
		
insert into buy_cancel 
		 values('000128','PRS-HAL1-A1','25',true,false);
		
insert into buy_cancel 
		 values('000129','PRS-HAL1-A2','25',true,false);
	
insert into buy_cancel 
		 values('000130','PRS-HAL1-A3','25',true,false);			
		
		
insert into buy_cancel 
		 values('000131','CAN-HAL1-B1','35',true,false);
		
insert into buy_cancel 
		 values('000132','CAN-HAL1-B2','35',true,false);
		
insert into buy_cancel 
		 values('000133','CAN-HAL1-B3','35',true,false);
		
insert into buy_cancel 
		 values('000134','CAN-HAL1-C1','35',true,false);
		
insert into buy_cancel 
		 values('000135','CAN-HAL1-C2','35',true,false);
		
insert into buy_cancel 
		 values('000136','CAN-HAL1-C3','35',true,false);
		
insert into buy_cancel 
		 values('000137','CAN-HAL1-D1','35',true,false);
		
insert into buy_cancel 
		 values('000138','CAN-HAL1-A1','35',true,false);
		
insert into buy_cancel 
		 values('000139','CAN-HAL1-A2','35',true,false);
		
insert into buy_cancel 
		 values('000140','CAN-HAL1-A3','35',true,false);			
		
		
insert into buy_cancel 
		 values('000141','CAN-HAL2-B1','35',true,false);
		
insert into buy_cancel 
		 values('000142','CAN-HAL2-B2','35',true,false);
		
insert into buy_cancel 
		 values('000143','CAN-HAL2-B3','35',false,false);
		
insert into buy_cancel 
		 values('000144','CAN-HAL2-C1','35',true,false);
		
insert into buy_cancel 
		 values('000145','CAN-HAL2-C2','35',true,false);
		
insert into buy_cancel 
		 values('000146','CAN-HAL2-C3','35',true,false);
		
insert into buy_cancel 
		 values('000147','CAN-HAL2-D1','35',true,false);
		
insert into buy_cancel 
		 values('000148','CAN-HAL2-A1','35',true,false);
		
insert into buy_cancel 
		 values('000149','CAN-HAL2-A2','35',true,false);
		
insert into buy_cancel 
		 values('000150','CAN-HAL2-A3','35',true,false);			
		
		
insert into buy_cancel 
		 values('000151','CAN-HAL3-B1','35',true,false);
		
insert into buy_cancel 
		 values('000152','CAN-HAL3-B2','35',true,false);
		
insert into buy_cancel 
		 values('000153','CAN-HAL3-B3','35',true,true);
		
insert into buy_cancel 
		 values('000154','CAN-HAL3-C1','35',true,false);
		
insert into buy_cancel 
		 values('000155','CAN-HAL3-C2','35',true,false);
		
insert into buy_cancel 
		 values('000156','CAN-HAL3-C3','35',true,false);
		
insert into buy_cancel 
		 values('000157','CAN-HAL3-D1','35',true,false);
		
insert into buy_cancel 
		 values('000158','CAN-HAL3-A1','35',true,false);
		
insert into buy_cancel 
		 values('000159','CAN-HAL3-A2','35',true,false);
		
insert into buy_cancel 
		 values('000160','CAN-HAL3-A3','35',true,false);			
		
		
insert into buy_cancel 
		 values('000161','MET-HAL6-B1','20',true,false);
		
insert into buy_cancel 
		 values('000162','MET-HAL6-B2','20',true,false);
		
insert into buy_cancel 
		 values('000163','MET-HAL6-B3','20',true,false);
		
insert into buy_cancel 
		 values('000164','MET-HAL6-C1','20',true,false);
		
insert into buy_cancel 
		 values('000165','MET-HAL6-C2','20',true,false);
		
insert into buy_cancel 
		 values('000166','MET-HAL6-C3','20',false,false);
		
insert into buy_cancel 
		 values('000167','MET-HAL6-D1','20',true,false);
		
insert into buy_cancel 
		 values('000168','MET-HAL6-A1','20',true,false);
		
insert into buy_cancel 
		 values('000169','MET-HAL6-A2','20',false,false);
		
insert into buy_cancel 
		 values('000170','MET-HAL6-A3','20',true,false);			
		
		
insert into buy_cancel 
		 values('000171','CNG-MAIN-B1','600',true,false);
		
insert into buy_cancel 
		 values('000172','CNG-MAIN-B2','600',true,false);
		
insert into buy_cancel 
		 values('000173','CNG-MAIN-B3','600',true,false);
		
insert into buy_cancel 
		 values('000174','CNG-MAIN-C1','600',true,false);
		
insert into buy_cancel 
		 values('000175','CNG-MAIN-C2','600',true,false);
		
insert into buy_cancel 
		 values('000176','CNG-MAIN-C3','600',true,false);
		
insert into buy_cancel 
		 values('000177','CNG-MAIN-D1','600',true,false);
		
insert into buy_cancel 
		 values('000178','CNG-MAIN-A1','1000',true,false);
		
insert into buy_cancel 
		 values('000179','CNG-MAIN-A2','1000',true,false);
		
insert into buy_cancel 
		 values('000180','CNG-MAIN-A3','1000',true,false);			
		
		
insert into buy_cancel 
		 values('000181','ZOR-MAIN-B1','300',true,false);
		
insert into buy_cancel 
		 values('000182','ZOR-MAIN-B2','300',true,false);
		
insert into buy_cancel
		 values('000183','ZOR-MAIN-B3','300',true,false);
		
insert into buy_cancel 
		 values('000184','ZOR-MAIN-C1','300',true,false);
		
insert into buy_cancel 
		 values('000185','ZOR-MAIN-C2','300',true,false);
		
insert into buy_cancel 
		 values('000186','ZOR-MAIN-C3','300',true,false);
		
insert into buy_cancel 
		 values('000187','ZOR-MAIN-D1','300',true,true);
		
insert into buy_cancel 
		 values('000188','ZOR-MAIN-A1','700',true,false);
		
insert into buy_cancel 
		 values('000189','ZOR-MAIN-A2','700',true,false);
		
insert into buy_cancel 
		 values('000190','ZOR-MAIN-A3','700',true,false);			
		
		
insert into buy_cancel
		 values('000191','JOL-MAIN-B1','200',true,false);
		
insert into buy_cancel 
		 values('000192','JOL-MAIN-B2','200',true,false);
		
insert into buy_cancel 
		 values('000193','JOL-MAIN-B3','200',true,false);
		
insert into buy_cancel 
		 values('000194','JOL-MAIN-C1','200',true,false);
		
insert into buy_cancel 
		 values('000195','JOL-MAIN-C2','200',true,true);
		
insert into buy_cancel 
		 values('000196','JOL-MAIN-C3','200',true,false);
		
insert into buy_cancel 
		 values('000197','JOL-MAIN-D1','200',true,false);
		
insert into buy_cancel 
		 values('000198','JOL-MAIN-A1','500',true,false);
		
insert into buy_cancel 
		 values('000199','JOL-MAIN-A2','500',true,false);
		
insert into buy_cancel 
		 values('000200','JOL-MAIN-A3','500',true,false);			
		
		
insert into buy_cancel
		 values('000201','BAB-MAIN-B1','100',true,false);
		
insert into buy_cancel 
		 values('000202','BAB-MAIN-B2','100',true,false);
		
insert into buy_cancel 
		 values('000203','BAB-MAIN-B3','100',true,false);
		
insert into buy_cancel 
		 values('000204','BAB-MAIN-C1','100',true,false);
		
insert into buy_cancel 
		 values('000205','BAB-MAIN-C2','100',true,false);
		
insert into buy_cancel 
		 values('000206','BAB-MAIN-C3','100',false,false);
		
insert into buy_cancel 
		 values('000207','BAB-MAIN-D1','100',true,true);
		
insert into buy_cancel 
		 values('000208','BAB-MAIN-A1','300',true,false);
		
insert into buy_cancel 
		 values('000209','BAB-MAIN-A2','300',true,false);
		
insert into buy_cancel 
		 values('000210','BAB-MAIN-A3','300',true,false);			
		
		

select * from attend;
select * from buy_cancel;
select * from castt;
select * from client;
select * from client_phonenumber;
select * from event;
select * from event_days;
select * from event_review;
select * from seat;
select * from seat_review;
select * from venue;
select * from cast_view;


update Client
set Surname = 'Koçyiðit'
          where Surname = 'Günaydýn';
        
delete from Client
           where Client_ID  = '16429085948';

          
update Client_PhoneNumber 
set Phone_Number =  '+90(5360750505)'
          where Phone_Number = '+90(5315159499)';
          
delete from Client_PhoneNumber
           where Phone_Number = '+90(5345654765)';
                                                      		
delete from Client_PhoneNumber
           where Phone_Number not like '+90%';
                                                      		

update Event
set Event_ID = '9999'
          where Event_ID = '1111';
                      
delete from Event
           where Event_ID  = '9999'; 

          
update Castt          
set Email = 'Pianist.Fazýl.Say@gmail.com'
          where Email = 'fazil.say@gmail.com';

delete from Castt
           where email = 'falfano@gmail.com'; 
		
		
update Event_Review 
set Given_Score = '10'
          where Given_Score > '10';
		
delete from Event_Review
           where Evaluating_Client_ID= '14945614554';
		
		
update Venue
set Venue_ID = '888'
          where Venue_ID = '8';
		
delete from Venue
           where Venue_ID  = '7';
		
		
update Seat
set Seat_ID= '111111'
          where Seat_ID = '000001';
		
delete from Seat
           where Seat_ID  = '000010';
		
		
update Seat_Review
set Comment_Date = '2020-01-01'
		   where Venue_ID = '1';
          
delete from Seat_Review
           where Review_ID = '000003';
		
		
update Event_days
set Starting_Hours = '12:00'
          where Starting_Hours = '20:30';
		
delete from Event_days
           where Working_Days like '%Saturday%' or Working_Days like '%Sunday%'; 
		
		
update Attend
set Attended_Clients = true
          where Client_ID = '14945614554' and Event_ID = '1214';
          
delete from Attend
           where Client_ID = '10020566506' and Event_ID = '1237';
    
          
update Buy_Cancel
set Seat_Price = '17.5'	
          where Seat_Price <= '15'; 

/*This delete has not been runned because of the assumption in Delete11*/
delete from Buy_Cancel 
           where Ticket_ID  like '%0' or Ticket_ID  like '%2' or Ticket_ID  like '%4' or Ticket_ID  like '%6' or Ticket_ID  like '%8';
/**/		
		
	       
update Cast_View
set Name = 'Yevegny'
          where Name = 'Yevgeny';
	
delete from Cast_View
           where Email = 'nur.yazar@gmail.com';
		
insert into Cast_View
          values('1293', 'Adile', 'Naþit', 'Actor', 'adile.nasit@gmail.com');
         
         

alter table Client
		 add column Email varchar(100);

update client
set Email = 'berra.cam@gmail.com'
		 where Client_ID = '15165195818';

update client
set Email = 'hakan.gurgun@gmail.com'
		 where Client_ID = '19846516516';	
		
update client
set Email = 'kemsen@gmail.com'
		 where Client_ID = '17115961595';			

update client
set Email = 'aa.yasli@gmail.com'
		 where Client_ID = '16059159050';		
		
update client
set Email = 'albina.gulerman@gmail.com'
		 where Client_ID = '18956159198';
		
update client
set Email = 'oyku.davud@gmail.com'
		 where Client_ID = '10259059005';
		
update client
set Email = 'lisaa.mano@gmail.com'
		 where Client_ID = '13473735750';		
		
update client
set Email = 'jisoki@gmail.com'
		 where Client_ID = '13068841891';
		
update client
set Email = 'hefederick@gmail.com'
		 where Client_ID = '16841818154';		
		
update client
set Email = 'caleb.stone@gmail.com'
		 where Client_ID = '16841818177';
		
		