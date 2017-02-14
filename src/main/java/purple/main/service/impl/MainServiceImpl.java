package purple.main.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import purple.main.dao.MainDao;
import purple.main.service.MainService;
import purple.model.User;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired(required = false)
	private MainDao mainDao;
	
	public void saveUser(User user) {
		mainDao.saveUser(user);
	}
	
	public void updateUser(User user) {
		mainDao.saveUser(user);
	}
	
	public void deleteUser(User user) {
		mainDao.saveUser(user);
	}
	
	public User findUserById(String id) {
		User user = new User();
		return user;
	}
}
