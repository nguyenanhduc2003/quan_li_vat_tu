package model;
import lombok.*;
@Data

public class Request {
	
	 	private int request_id; 
	    private String request_name; 
	    private String request_email; 
	    private String request_phone; 
	    private String request_date; 
	    private String request_materialname; 
	    private int request_quantity; 
	    private String request_reason; 
	    private String request_note; 
	    private String request_status;
	
}
