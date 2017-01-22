package purple.main.bo.impl;

import purple.main.bo.UserBo;
import purple.main.dao.UserDao;
import purple.main.model.User;

public class UserBoImpl implements UserBo {
	UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public void save(User user) {
		userDao.save(user);
	}
	
	public void update(User user) {
		userDao.update(user);
	}
	
	public void delete(User user) {
		userDao.delete(user);
	}
	
	public User findByUserId(String id) {
		return userDao.findByUserId(id);
	}
}
