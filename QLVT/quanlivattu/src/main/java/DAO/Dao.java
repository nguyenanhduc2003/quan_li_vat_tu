package DAO;

import java.util.List;
import java.util.Optional;

public interface Dao<T> {

    // Lấy tất cả đối tượng
    List<T> getAll();

    // Lấy đối tượng theo ID
    Optional<T> get(int id);

    // Lưu đối tượng vào CSDL
    void save(T t);

    // Cập nhật đối tượng
    void update(T t);

    // Xóa đối tượng
    void delete(T t);

}

