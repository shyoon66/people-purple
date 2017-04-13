package purple.party.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import purple.domain.Party;
import purple.party.dao.PartyDao;
import purple.party.service.PartyService;

@Service("partyService")
@Transactional
public class PartyServiceImpl implements PartyService {
	
	private static final Logger logger = LoggerFactory.getLogger(PartyService.class);
	
	@Resource(name="partyDao")
	private PartyDao partyDao;

	public void saveParty(Party party) throws Exception {
		partyDao.saveParty(party);
	}

	public void updateParty(Party party) {
		partyDao.updateParty(party);
	}

	public void deleteParty(Party party) {
		partyDao.deleteParty(party);
	}

	public Party findPartyByOid(int oid) {
		return partyDao.findPartyByOid(oid);
	}
}
