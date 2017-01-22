package purple.main.dao;

import purple.main.model.User;

public interface UserDao {
	void save(User user);
	void update(User user);
	void delete(User user);
	User findByUserId(String id);
}
