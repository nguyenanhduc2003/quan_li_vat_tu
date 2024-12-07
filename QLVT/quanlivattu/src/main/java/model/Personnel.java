package model;
import lombok.*;
@Data

public class Personnel {
	
	private int personnel_id;
	private String personnel_name; 
	private String personnel_gender; 
	private String personnel_birthday; 
	private String personnel_phone; 
	private String personnel_address; 
	private int department_id;
	
}
