package purple.party.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import purple.command.CommandMap;
import purple.domain.Party;
import purple.party.service.PartyService;

@Controller
@RequestMapping("/party")
public class PartyController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartyController.class);
	
	@Resource(name="partyService")
	private PartyService partyService;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String partyInsert(HttpServletRequest request, CommandMap commandMap, Model model) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", request.getSession().getAttribute("id").toString());
		map.put("nickname", request.getSession().getAttribute("nickname").toString());
		map.put("url", request.getSession().getAttribute("url").toString());
		model.addAttribute("userInfo", map);
	
		return "party/partyInsert";
	}
	
	@RequestMapping(value = "/insertPartyProc", method = RequestMethod.POST)
	public String insertPartyProc(Party party, HttpServletRequest request, CommandMap commandMap, Model model) throws Exception {
		try {
			party.setId(request.getSession().getAttribute("id").toString());
			party.setNick_name(request.getSession().getAttribute("nickname").toString());
			party.setCreate_date(new Date());
			partyService.saveParty(party);
			model.addAttribute("result", true);
		} catch(Exception e) {
			model.addAttribute("result", false);
		}	
	
		return "party/partyInsert";
	}
}
