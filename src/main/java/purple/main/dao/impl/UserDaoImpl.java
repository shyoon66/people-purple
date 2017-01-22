package purple.main.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import purple.main.dao.UserDao;
import purple.main.model.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	public void save(User user) {
		getHibernateTemplate().save(user);
	}
	
	public void update(User user) {
		getHibernateTemplate().update(user);
	}
	
	public void delete(User user) {
		getHibernateTemplate().delete(user);
	}
	
	@SuppressWarnings("unchecked")
	public User findByUserId(String id) {
		List<User> userList = (List<User>) getHibernateTemplate().find("from tb_user_info where id=?", id);
		return userList.get(0);
	}
}
