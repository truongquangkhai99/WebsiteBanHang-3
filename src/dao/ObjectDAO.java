package dao;

public interface ObjectDAO {
	default boolean add(Object obj) {
		return false;
	}

	default boolean edit(String id, Object obj) {
		return false;
	}

	default boolean del(String id) {
		return false;
	}
}
