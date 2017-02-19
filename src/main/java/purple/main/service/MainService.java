package purple.main.service;

import purple.domain.User;

public interface MainService {
	void saveUser(User user);
	void updateUser(User user);
	void deleteUser(User user);
	User findUserById(String id);
}
