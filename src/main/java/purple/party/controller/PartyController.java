package purple.party.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import purple.common.common.CommandMap;

@Controller
@RequestMapping("/party")
public class PartyController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartyController.class);
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String partyInsert(HttpServletRequest request, CommandMap commandMap, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("nickname", request.getSession().getAttribute("nickname").toString());
		model.addAttribute("userInfo", map);
	
		return "party/partyInsert";
	}
}
