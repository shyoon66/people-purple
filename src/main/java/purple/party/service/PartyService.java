package purple.party.service;

import purple.domain.Party;

public interface PartyService {
	void saveParty(Party party) throws Exception;
	void updateParty(Party party);
	void deleteParty(Party party);
	Party findPartyByOid(int oid);
}
