package purple.main.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import purple.common.common.CommandMap;

@Controller
@RequestMapping("/main")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		logger.info("Welcome home!");
	
		return "main/index";
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(@RequestParam(value = "id") String id, @RequestParam(value = "nickname") String nickname, CommandMap commandMap, Model model) {
		try {
			if(nickname != null){
				nickname = new String(nickname.getBytes("8859_1"),"UTF-8"); // getBytes("8859_1") 
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		logger.info("id : {}, nickname : {}", id, nickname);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("nickname", nickname);
		model.addAttribute("userInfo",map);
		
		return "main/main";
	}
}
