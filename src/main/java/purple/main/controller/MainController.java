package purple.main.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import purple.common.common.CommandMap;
import purple.domain.User;
import purple.main.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Resource(name="mainService")
	private MainService mainService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(CommandMap commandMap, Model model) {
		logger.info("Welcome home!");
	
		return "main/index";
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(@RequestParam(value = "id") String id, @RequestParam(value = "nickname") String nickname, @RequestParam(value = "url") String url, HttpServletRequest request, Model model) {
		try {
			if(nickname != null) {
				nickname = new String(nickname.getBytes("8859_1"),"UTF-8"); // getBytes("8859_1") 
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		logger.info("id : {}, nickname : {}", id, nickname);
		
		//유저정보가 등록 되어 있는지 확인
		User user = mainService.findUserById(id);
		
		if(user == null) {
			user = new User(id, nickname, url);
			mainService.saveUser(user);
		}
		
		request.getSession().setAttribute("id", id);
		request.getSession().setAttribute("nickname", nickname);
		request.getSession().setAttribute("url", url);
		
		model.addAttribute("user", user);
		
		return "main/main";
	}
}
