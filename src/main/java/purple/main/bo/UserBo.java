package purple.main.bo;

import purple.main.model.User;

public interface UserBo {
	void save(User user);
	void update(User user);
	void delete(User user);
	User findByUserId(String id);
}
