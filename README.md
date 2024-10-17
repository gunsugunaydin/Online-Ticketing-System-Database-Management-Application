# Online Ticketing System Management Tool with Java and PostgreSQL <img src="https://media.tenor.com/Haml3kLurnQAAAAi/ticket-admission-tickets.gif" alt="Showing Ticket Gif" width="50" height="50"> 

This project is a database management application developed for an online ticketing system. The project includes a Java application that performs database operations using Java and PostgreSQL.

## Installation and Usage

1. *Prerequisites:*
    - Java 8 or higher
    - PostgreSQL 9.5 or higher

2. *Installation Steps:*

   *2.1. Clone the Project:*

   ```bash
    git clone https://github.com/gunsugunaydin/Online-Ticketing-System-Database.git
    cd Online-Ticketing-System-Database-App
    ```
   *2.2. Create Database and Tables:*

   Execute the SQL script `createdb.sql` to create the necessary database schema and tables. This script initializes the structure required for the Online Ticketing System.

   ```bash
    createdb -U admin "online_ticketing_system_database"
    psql -U admin -d "online_ticketing_system_database" -a -f createdb.sql
    ```
   
4. *Usage:*
    After build and run the application, you can see the 'Online Ticketing System Database Menu' in your java IDE.

    #### Online Ticketing System Database Menu
    
    Please select what you want to do:
    
    - 1- Insert a Client
    - 2- List the Clients
    - 3- Insert an Event
    - 4- List the Events
    - 5- Insert a Venue
    - 6- List the Venues in the selected city
    - 7- Update a Client's Surname
    - 8- Update an Event's ID
    - 9- Update a Venue's ID
    - 10- Delete a Client
    - 11- Delete an Event
    - 12- Delete a Venue
    - 0- Exit
    
    You can add, list, update, and delete clients, events, and venues according to the menu options.

## The Requirements for the Online Ticketing System Database

- The ticketing system based on the events. Each event has a unique ID, a unique name, genre, beginning date and ending date.  

- An event has several (including 0) event review and each event review must associated with an event. When the client enters the event review, he/she can see the given score, can see evaluation date of the event, and he/she can evaluate the event himself/herself. In order to evaluate the event, client must enter client’s id.

- An event organized by at least one cast and each cast must organize at most one event. Each cast has unique email, name surname, profession and salary.

- Events consist event days. An event must take place on some day(s) in a week. Since event days dependent on events, it should match at least one event. When the client attends the event, he/she should be able to see which days and time intervals available of that event.

- Each event takes place in just one venue and each venue can host more than one events. Each venue has unique venue id, name section, phone number, seating arrangement, information about the event, and address. In addition, one venue can has at least one seat but seat can only belong to one venue.

- Clients can attend several events and system keeps track of the clients who joined the event. Each client has a unique ID, name, surname, email and clients may have several phone numbers. 

- The client can buy seat(s) with paying seat price and each seat known by its type (VIP, standard etc.), name (A1,B1 etc.) and its unique id. When client bought the seat(s), system keep track of bought seat(s) and records the purchased ticket with its id and price. In addition, client can cancel his/her seat or seats and seat(s) is cancelled by purchaser only. The system also keep track of cancelled seat(s). 

- Every seat include seat review or reviews. This mean that client can see seats’ angle, image, and upload date (comment date) of review if he/she want. Moreover, each seat review has a unique review id.


## Database Structure: ER Conceptual Schema Diagram for Online Ticketing System Database

![Untitled Diagram drawio adlı dosyanın kopyası](https://github.com/gunsugunaydin/Online-Ticketing-System-Database-Management-Application/assets/110038957/68c28536-3e97-4b42-8468-990d6e7d0a9e)


## Database Structure: Schema Diagram for Online Ticketing System Database

![diagram_2png](https://github.com/user-attachments/assets/e20f8944-3541-427e-8f30-14f3af09801b)


## SQL Queries

The project also includes a separate script containing various SQL queries. This script can be found in the `queries.sql` file and can be used to perform more detailed database operations.

## Java Application

The Java application connects to the PostgreSQL database using JDBC and allows the user to perform database operations. Users can execute the following operations from the application menu:

- Add, list, update, and delete clients
- Add, list, update, and delete events
- Add, list, update, and delete venues
  
## A Little Extra

![Ticket Tool](https://media.tenor.com/XVWIZQh1Ge8AAAAM/make-a-ticket-ticket-tool.gif)

Thank you for exploring the Online Ticketing System Management Tool! If you have any questions, feedback, or just want to chat about the project, feel free to reach out. Your support and suggestions are always appreciated!

- **Email**: [gunsugunay98@gmail.com](mailto:gunsugunay98@gmail.com)
- **LinkedIn**: [linkedin.com/in/gunsugunaydin](https://www.linkedin.com/in/gunsugunaydin/)


