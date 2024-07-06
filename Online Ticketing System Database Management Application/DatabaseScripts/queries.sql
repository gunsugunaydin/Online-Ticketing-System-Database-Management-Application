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


select profession, avg_salary_of_profession 
from( select profession, avg(salary) as avg_salary_of_profession
      from castt
      group by profession) as derivedTable
where avg_salary_of_profession > '2000';


select profession, avg_salary_of_profession 
from( select profession, avg(salary) as avg_salary_of_profession
      from castt
      group by profession) as derivedTable
order by avg_salary_of_profession desc;


select Name, Starting_Hours
from Event_days ed, Event e
where Starting_Hours > '12:00' and ed.Event_ID= e.Event_ID
intersect
select Name, Starting_Hours
from Event_days ed, Event e
where Working_Days  like '%Friday%' and ed.Event_ID= e.Event_ID;


select Name, avg_score
from (select e.Name, avg(Given_Score) as avg_score
           from Event_Review er, Event e
           group by e.Name, er.ReviewEventID, e.Event_ID
           having er.ReviewEventID=e.Event_ID) as derivedTable
where avg_score > some (select avg(Given_Score) as avg_score
                        from Event_Review er, Event e
                        group by er.ReviewEventID, e.Event_ID
                        having er.ReviewEventID=e.Event_ID and avg(Given_Score) = '7');
                       
                       
select e.Name, avg(Given_Score) as avg_score
           from Event_Review er, Event e
           group by e.Name, er.ReviewEventID, e.Event_ID
           having er.ReviewEventID=e.Event_ID and avg(Given_Score) between '1' and '5';
 
          
select distinct Name, max(seat_price) as Max_Price
from Event e, Buy_Cancel c, Seat s
group by e.Name,e.Event_ID, s.Event_ID, s.Seat_ID
having e.Event_ID = s.Event_ID and s.Seat_ID in (select Seat_ID
                                                from Buy_Cancel
                                                where Seat_Price = (select max(Seat_Price) from Buy_Cancel));
      

select E.Name, count(castt.email) as Cast_Count
from Castt, Event E
group by E.Name, CastEventID, Event_ID
having CastEventID= Event_ID and Event_ID = '1676';	          
          
          
select Name, max(seat_price) as Max_Price, null as Min_Price
from Event e, Buy_Cancel c, Seat s
group by e.Name,e.Event_ID, s.Event_ID, s.Seat_ID
having e.Event_ID = s.Event_ID and s.Seat_ID in (select Seat_ID
											    from Buy_Cancel
											    where Seat_Price in (select max(Seat_Price) from Buy_Cancel))
union
select Name, null as Max_Price ,min(seat_price) as Min_Price
from Event e, Buy_Cancel c, Seat s
group by e.Name, e.Event_ID, s.Event_ID, s.Seat_ID, c.seat_id
having e.Event_ID = s.Event_ID and s.Seat_ID = c.Seat_ID and c.Seat_Price in (select Seat_Price 
											    							 from Buy_Cancel
											   								 group by Seat_Price
											    							 having Seat_Price in (select min(Seat_Price) from Buy_Cancel));


select v.Name, sum(v.number_of_seat)
from Venue v
where v.name like 'Cüneyt Gökçer Stage'
group by v.Name;										  
											   

select c.Client_ID, c.Name
from Client as c
where c.Client_ID not in (select distinct c.Client_ID
		    			  from Client as c, Attend as a
						  where a.Attended_Clients = true and (a.Event_ID = '1785' or a.Event_ID = '1676') and a.Client_ID = c.Client_ID)
order by c.Name asc;


select Seat_ID, Seat_Name,
                         ( select count(*)
                           from Seat_Review
                           where Seat.Seat_ID= Seat_Review. Seat_ID )
                          as num_reviews
from Seat;


select distinct C.Client_ID, C.Name, C.Surname
from Client as C
where not exists ( (select Event_ID
                               from Event
                               where Event.Name = 'Pride and Prejudice')
                               except
                              (select A.Event_ID
                               from Attend as A
                               where A.Client_ID = C.Client_ID and A.Attended_Clients = true));



select S.Seat_ID, S.Seat_Name
from Seat S, Seat_Review R, Event E
where S.Seat_ID = R.Seat_ID and S.Event_ID= E.Event_ID and E.Name= 'Europa Galante' and R.Seat_Angle  <=  all (select Seat_Angle
                                               from Seat_Review R, Seat S
                                               where S.Seat_ID = R.Seat_ID
                                         intersect
                                                select Seat_Angle
                                                from Seat_Review R, Event E, Seat S
                                                where S.Seat_ID = R.Seat_ID and S.Event_ID= E.Event_ID and E.Name= 'Europa Galante');                              
                              
 
select sum(salary)
from Castt join Event on Event_ID=CastEventID
where Event.Name = 'Çalýkuþu';     
                                               
  
select Client.Name, Event.Name
from Client natural join Attend, Event
where Attend.Event_ID = Event.Event_ID and Attend.Attended_Clients= false;
                              
                              
select *
from Event e left outer join Venue v on e.Event_ID = v.VenueEventID;
                              
  
select C.Client_ID, C.Name, C.Surname
from Client as C
where not exists ( (select Event_ID
                               from Event
                               where Event.Name like 'Harry Potter%1'
                               except
                               select A.Event_ID
                               from Attend as A
                               where A.Client_ID = C.Client_ID and A.Attended_Clients = true) 
                               union
                             (select Event_ID
                               from Event
                               where Event.Name like 'Harry Potter%2'
                               except
                               select A.Event_ID
                               from Attend as A
                               where A.Client_ID = C.Client_ID and A.Attended_Clients = true));



select S.Seat_ID, S.Seat_Name as empty_seats
from Seat S, Buy_Cancel BC
where BC.Seat_ID = S.Seat_ID and (BC.Bought_seats = false or BC.Cancelled_seats = true)  
intersect
select S.Seat_ID, S.Seat_Name as empty_seats 
from Seat S, Venue V
where V.Venue_ID=S.Venue_ID and  V.Section = 'Hall 6' and V.Name = 'Metropol Cinema';


select *
from Client C
where Client_ID=(select S.Client_ID 
				 from Seat S 
				 where S.Seat_Type='VIP' 
				 intersect
				 select A.Client_ID
				 from Attend A, Event e 
				 where A.Event_ID = (Select E.Event_ID from Event e where E.Name='Tarkan Concert') and A.Attended_Clients=false);


