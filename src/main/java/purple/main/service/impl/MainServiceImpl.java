package purple.main.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import purple.common.controller.CommonController;
import purple.domain.User;
import purple.main.dao.MainDao;
import purple.main.service.MainService;

@Service("mainService")
@Transactional
public class MainServiceImpl implements MainService {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Resource(name="mainDao")
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
		return mainDao.findUserById(id);
	}
}
