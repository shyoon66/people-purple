package purple.main.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import purple.main.dao.MainDao;
import purple.model.User;

public class MainDaoImpl implements MainDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}
	
	public void updateUser(User user) {
		sessionFactory.getCurrentSession().update(user);
	}
	
	public void deleteUser(User user) {
		sessionFactory.getCurrentSession().delete(user);
	}
	
	public User findUserById(String id) {
		User user = (User)sessionFactory.getCurrentSession().load(User.class, id);
		return user;
	}
}
