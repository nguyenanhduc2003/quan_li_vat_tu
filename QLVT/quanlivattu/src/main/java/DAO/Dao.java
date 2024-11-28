package DAO;

import java.util.List;

public interface Dao<T> {
	
	List<T> getALL();	
	void save(T t);
	void delete(int t);   
	void update(T t);
	public List<T> getByName(String name);
	
}
