package model;
import lombok.Data;
@Data

public class Transaction {
	
	private String date;
    private String type;
    private String materialName;
    private int quantity;

}
