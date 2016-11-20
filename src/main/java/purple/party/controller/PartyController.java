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
import org.springframework.web.bind.annotation.RequestParam;

import purple.common.common.CommandMap;

@Controller
@RequestMapping("/party")
public class PartyController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartyController.class);
	
	@RequestMapping(value = "/partyInsert", method = RequestMethod.GET)
	public String partyInsert(HttpServletRequest request, CommandMap commandMap, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + request.getSession().toString());
		model.addAttribute("userInfo", map);
	
		return "party/partyInsert";
	}
}
