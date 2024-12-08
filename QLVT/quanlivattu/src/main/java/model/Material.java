package model;
import lombok.*;
@Data

public class Material {
	
	 	private int material_id; 
	    private String material_name; 
	    private String material_describe; 
	    private String material_unit; 
	    private String material_date; 
	    private String material_expiry; 
	    private String material_use; 
	    private String material_supplier; 
	    private String material_country; 
	    private double material_value; 
	    private String material_image;
	    private int material_quantity;
	    private int stock_quantity;
	    private int total_imported;
	    private int total_exported;
	    private String unit;
	
}
