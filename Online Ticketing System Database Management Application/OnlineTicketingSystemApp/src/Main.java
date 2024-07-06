import java.util.Scanner;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

public class Main {

	private static Connection connection = null;
	private static Statement statement = null;
	private static ResultSet resultset = null;
	
	final private static String host = "jdbc:postgresql://10.98.98.61:5432/group34";
	final private static String user = "group34";
	final private static String password = "d$b?XLuM*2*BmmK3";
		
	
	public static void main(String[] args) throws SQLException{
		// TODO Auto-generated method stub

		Scanner keyboard = new Scanner(System.in);
		
		try {
			Connection connection = DriverManager.getConnection(host, user, password);
			System.out.println("Java JDBC PostgreSQL Example");
			
			System.out.println("Connected to PostgreSQL database!");
			statement = connection.createStatement();
		}
		catch(SQLException e){
			System.out.println("Connection failure.");
			e.printStackTrace();
		}
		System.out.println();
		
		while(true) {
			System.out.println("Online Ticketing System Database Menu");
			System.out.println("Please select what you want to do:");
			System.out.println("1-Insert a Client");
			System.out.println("2-List the Clients");
			System.out.println("3-Insert a Event");
			System.out.println("4-List the Events");
			System.out.println("5-Insert a Venue");
			System.out.println("6-List the Venues in the selected city");
				
			System.out.println("7-Update a Client's Surname");
			System.out.println("8-Update a Event's ID");
			System.out.println("9-Update a Venue's ID");
			
			System.out.println("10-Delete a Client");
			System.out.println("11-Delete a Event");
			System.out.println("12-Delete a Venue");

			System.out.println("0-Exit");
			
			
			int input1 = keyboard.nextInt();
			keyboard.nextLine();
			
			if(input1 == 1) {
				String newEmail;
				System.out.println("1-Enter the new Client ID");
				String newID = keyboard.nextLine();
				System.out.println("2-Enter the new Name");
				String newName = keyboard.nextLine();
				System.out.println("3-Enter the new Surname");
				String newSurname = keyboard.nextLine();
				System.out.println("4-Enter the new Phone Number");
				String newPhoneNumber = keyboard.nextLine();
				if(!(newPhoneNumber.substring(0,3).equals("+90"))) {
					System.out.println("5-Enter the new Email");
					newEmail = keyboard.nextLine();
				}
				else {
					newEmail = null;
				}
				
				statement.executeUpdate("insert into Client " + "(client_id, name, surname, email)" + "values ('"+newID+"', '"+newName+"', '"+newSurname+"', '"+newEmail+"')");							
				statement.executeUpdate("insert into client_phonenumber " + "(client_id, phone_number)" + "values('"+newID+"', '"+newPhoneNumber+"')");
				System.out.println();
				
			}
			else if(input1 == 2) {
				resultset = statement.executeQuery("select * from Client");
				writeResultSet(resultset);
				System.out.println();
				
			}
			else if(input1 == 3) {
				System.out.println("1-Enter the new Event ID");
				String newEventID = keyboard.nextLine();
				System.out.println("2-Enter the new Event Name");
				String newEventName = keyboard.nextLine();
				System.out.println("3-Enter the new Event Genre");
				String newEventGenre = keyboard.nextLine();
				System.out.println("4-Enter the new Event's Date of Start");
				String newEventStart = keyboard.nextLine();
				System.out.println("5-Enter the new Event's Date of End");
				String newEventEnd = keyboard.nextLine();
				
				statement.executeUpdate("insert into Event " + "(event_id, name, genre, date_of_start, date_of_end)" + "values ('"+newEventID+"', '"+newEventName+"', '"+newEventGenre+"', '"+newEventStart+"', '"+newEventEnd+"')");							
				System.out.println();
				
			}
			else if(input1 == 4) {
				resultset = statement.executeQuery("select * from Event");
				writeResultSet(resultset);
				System.out.println();

			}
			else if(input1 == 5) {
				System.out.println("1-Enter the new Venue Event ID");
				String newVenueEventID = keyboard.nextLine();
				System.out.println("2-Enter the new Venue ID");
				String newVenueID = keyboard.nextLine();
				System.out.println("3-Enter the new Venue Phone Number");
				String newVPhoneNumb = keyboard.nextLine();
				System.out.println("4-Enter the new Venue Name");
				String newVenueName = keyboard.nextLine();
				System.out.println("5-Enter the new Venue Section");
				String newVenueSec = keyboard.nextLine();
				System.out.println("6-Enter the new Venue Information");
				String newVenueInf = keyboard.nextLine();
				System.out.println("7-Enter the new Venue's Number of Seat");
				int newNumofSeat = keyboard.nextInt();
				keyboard.nextLine();
				System.out.println("8-Enter the new Venue's State");
				String newVenueState = keyboard.nextLine();
				System.out.println("9-Enter the new Venue's City");
				String newVenueCity = keyboard.nextLine();
				System.out.println("10-Enter the new Venue's County");
				String newVenueCounty = keyboard.nextLine();
				System.out.println("11-Enter the new Venue's Street Name");
				String newVenueStrName = keyboard.nextLine();
				System.out.println("12-Enter the new Venue's Building No");
				String newVenueBuildNo = keyboard.nextLine();
				
				statement.executeUpdate("insert into Venue " + "(venueeventid, venue_id, vphone_number, name, section, information, seating_arrangment, number_of_seat, state, city, county, street_name, building_no)" 
										+ "values ('"+newVenueEventID+"', '"+newVenueID+"', '"+newVPhoneNumb+"', '"+newVenueName+"', '"+newVenueSec+"', '"+newVenueInf+"', "+null+", '"+newNumofSeat+"', '"+newVenueState+"', '"+newVenueCity+"', '"+newVenueCounty+"', '"+newVenueStrName+"', '"+newVenueBuildNo+"')");
				System.out.println();
				
			}
			else if(input1 == 6) {
				System.out.println("1-Enter the City");
				String city = keyboard.nextLine();
				
				resultset = statement.executeQuery("select * from Venue where Venue.City = '"+city+"'");
				writeResultSet(resultset);
				System.out.println();
				
			}
			
			else if(input1 == 7) {
				System.out.println("1-Enter the surname of the client you want to update");
				String oldSurname = keyboard.nextLine();
				System.out.println("2-Enter the new surname of the client");
				String newSurname = keyboard.nextLine();

				statement.executeUpdate("update Client set Surname = '"+newSurname+"' where Surname = '"+oldSurname+"'");
				System.out.println("The surname of the client updated as '"+newSurname+"'");
				System.out.println();
				
			}
			else if(input1 == 8) {
				System.out.println("1-Enter the ID of the event you want to update");
				String oldID = keyboard.nextLine();
				System.out.println("2-Enter the new ID of event");
				String newID = keyboard.nextLine();

				statement.executeUpdate("update Event set event_id = '"+newID+"' where event_id = '"+oldID+"'");
				System.out.println("The event ID of the event updated to '"+newID+"'");
				System.out.println();
				
			}
			else if(input1 == 9) {
				System.out.println("1-Enter the ID of the venue you want to update");
				String oldID = keyboard.nextLine();
				System.out.println("2-Enter the new ID of the venue");
				String newID = keyboard.nextLine();

				statement.executeUpdate("update Venue set venue_id = '"+newID+"' where venue_id = '"+oldID+"'");
				System.out.println("The venue ID of the venue updated to '"+newID+"'");
				System.out.println();
				
			}
			else if(input1 == 10) {
				System.out.println("1-Enter the ID of the Client you want to delete");
				String deleteID = keyboard.nextLine();
				
				statement.execute("delete from Client where client_id = '"+deleteID+"'");
				System.out.println("Client with "+deleteID+" ID has been deleted");
				System.out.println();
				
			}
			else if(input1 == 11) {
				System.out.println("1-Enter the ID of the Event you want to delete");
				String deleteID = keyboard.nextLine();
				
				statement.execute("delete from Event where event_id = '"+deleteID+"'");
				System.out.println("Event with "+deleteID+" ID has been deleted");
				System.out.println();
				
			}
			else if(input1 == 12) {
				System.out.println("1-Enter the ID of the Venue you want to delete");
				String deleteID = keyboard.nextLine();
				
				statement.execute("delete from Venue where venue_id = '"+deleteID+"'");
				System.out.println("Venue with "+deleteID+" ID has been deleted");
				System.out.println();
				
			}
			else if(input1 == 0) {
				System.exit(0);
				
			}
			else {
				System.out.println("Wrong input! Please enter between 0-12.");
				
			}
	
		}
		
	}

	private static void writeResultSet(ResultSet resultSet)throws SQLException {
		// TODO Auto-generated method stub
		ResultSetMetaData rsmd = resultSet.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		while(resultSet.next()) {
			for(int i=1; i<=columnsNumber; i++) {
				System.out.print(resultSet.getString(i)+" ");
			}
			System.out.println();
		}
	}

}
