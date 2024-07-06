# Online Ticketing System Management Tool with Java and PostgreSQL

This project is a database management application developed for an online ticketing system. The project includes a Java application that performs database operations using Java and PostgreSQL.

## Installation and Usage

1. *Prerequisites:*
    - Java 8 or higher
    - PostgreSQL 9.5 or higher

2. *Installation Steps:*

   **2.1. Clone the project & Create Database and Tables::**

   ```bash
   git clone https://github.com/gunsugunaydin/Online-Ticketing-System-Database.git
   cd Online-Ticketing-System-Database-App

    Execute the SQL script `createdb.sql` to create the necessary database schema and tables. This script initializes the structure required for the Online Ticketing System.

   ```bash
   psql -U group34 -d "Online Ticketing System Database" -a -f createdb.sql

3. *Usage:*
    After build and run the application, you can see the Online Ticketing System Database Menu in your java compiler.

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

## Database Structure: ER Conceptual Schema Diagram for Online Ticketing System Database

![Untitled Diagram drawio adlı dosyanın kopyası](https://github.com/gunsugunaydin/Online-Ticketing-System-Database-Management-Application/assets/110038957/68c28536-3e97-4b42-8468-990d6e7d0a9e)


## Database Structure: Schema Diagram for Online Ticketing System Database


![group project-Page-2 (1)](https://github.com/gunsugunaydin/Online-Ticketing-System-Database-Management-Application/assets/110038957/4f9e7110-b574-45ee-99f1-606eef3f5eac)



## SQL Queries

The project also includes a separate script containing various SQL queries. This script can be found in the `queries.sql` file and can be used to perform more detailed database operations.

## Java Application

The Java application connects to the PostgreSQL database using JDBC and allows the user to perform database operations. Users can execute the following operations from the application menu:

- Add, list, update, and delete clients
- Add, list, update, and delete events
- Add, list, update, and delete venues

