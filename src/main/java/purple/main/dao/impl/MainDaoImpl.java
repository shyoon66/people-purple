package purple.main.dao.impl;

import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import purple.domain.User;
import purple.main.dao.MainDao;

@Repository("mainDao")
public class MainDaoImpl implements MainDao {
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

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
		User user = (User)sessionFactory.getCurrentSession().get(User.class, id);
		Hibernate.initialize(user); // 이 부분을 추가해주면 됨
		return user;
	}
}
