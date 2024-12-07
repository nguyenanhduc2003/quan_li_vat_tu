package model;
import lombok.*;
@Data

public class Export {
	private int export_id;
	private String export_name; 
	private String export_date; 
	private String export_receiver; 
	private String export_phone;
	private String export_department; 
	private int export_quantity;
}
